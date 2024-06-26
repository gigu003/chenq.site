---
title: "利用cowplot包生成组合图"
author: "Qiong Chen"
date: '2020-02-06'
slug: ggplot2-cowplot
link: https://chenq.site/tech/2020-ggplot2-cowplot/
categories: [R, 科研作图]
tags: ["科研作图"]
keywords: ["科研作图","cowplot","ggplot2"]
---

# 背景

最近一直忙于肿瘤登记年报的撰写和编辑工作，以往的工作都是通过word来编辑，它有一个很大的麻烦就是，一旦生成的图有错误，特别是组合图出现错误需要调整的时候，噩梦就开始了。偶然的机会，在网上了解了R bookdown这个包，用来写书还是很方便的，最大的好处就是能把R程序和编辑书结合起来，可以直接用R生成的图，对我来说太方便了。

本文就是尝试利用R的ggplot2包和cowplot包生成组合图。今年的肿瘤登记年报纳入分析的是35个肿瘤登记处2016年的肿瘤发病和死亡数据，其中20多个肿瘤登记处自2009年、2010年和2011年便开始肿瘤登记工作。各个登记处历年肿瘤发病率和死亡率的稳定性是肿瘤登记数据质量的重要指标,因为肿瘤的发病率和死亡率短时间内不会出现很大的波动，如果一个登记处相邻年份的肿瘤发病率和死亡率出现很大的波动，则提示数据质量可能存在问题。当然肿瘤登记的数据质量还要考虑其他指标如病理诊断比例（MV%），死亡发病比（M:I）和只有死亡医学证明书的比例（DCO%）。本文只考虑如何图形化展示肿瘤登记数据的稳定性指标。

# 程序

```r
library(RODBC)
library(dplyr)
library(reshape2)
library(ggplot2)
library(cowplot)
library(ggthemes)
theme_set(theme_wsj())

data <- odbcConnect("canreg_hist") 
xy <-sqlQuery(data, query = "select * from report_all") %>%
  filter(code==62,sex=="合计",!(areacode %in% c("510000","520000")))%>%
  select(areacode,year,name,ihj,dhj)%>%
  melt(id.vars=c("areacode","year","name"))%>%
  mutate(variable=ifelse(variable=="ihj","Incidence","Mortality"))%>%
  group_by(areacode,variable)%>% filter(min(year)<=2013)
close(data)
p <- list()
for (i in xy$name)
{
  p[[i]]<-xy %>% filter(name==i) %>%
    ggplot(aes(x=factor(year),y=value,fill=variable))+
    geom_bar(stat="identity",color="black",position=position_dodge(),width = 0.7,size=0.25)+
    ylim(0,300)+
    theme_wsj()+
    theme(legend.title = element_blank(),text=element_text(family="sans"))
}
plot_grid(p$全省, p$林州市, p$洛阳市, p$偃师市,p$禹州市,
          p$沈丘县,p$西平县,p$鲁山县,p$辉县市,p$济源市,p$漯河市,p$漯河市郾城区,
          p$三门峡市湖滨区, p$虞城县, p$郸城县,p$内乡县,p$罗山县,p$开封市祥符区,
          p$鹤壁市,p$睢县,
          labels =c("全省","林州市","洛阳市","偃师市","禹州市","沈丘县","西平县",
          "鲁山县","辉县市","济源市","漯河市","漯河市郾城区","三门峡市湖滨区",
"虞城县","郸城县","内乡县","罗山县","开封市祥符区","鹤壁市","睢县"), 
label_size = 12,ncol=2)

```