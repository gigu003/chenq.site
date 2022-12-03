library(easyPubMed)
q <- "Qiong Chen[AU] AND Henan Cancer Hospital[AD]"
mq <- get_pubmed_ids(q)
mb <- seq(from = 1, to = as.numeric(mq$Count), by = 10)
mb_xml <- lapply(mb,  function(i) {
  fetch_pubmed_data(mq, retmax = 1000, retstart = i)  
})
## 储存为 list
all_xml <- list()
for(x in mb_xml) {
  xx <- articles_to_list(x)
  for(y in xx) {
    all_xml[[(1 + length(all_xml))]] <- y
  }  
}

t.start <- Sys.time()

## max_chars = -1 即提取全部摘要
final_df <- do.call(rbind, lapply(all_xml, article_to_df, 
                                  max_chars = -1, getAuthors = FALSE))

t.stop <- Sys.time()
print(t.stop - t.start)

write.csv(final_df,"result.csv")




rm(list = ls())
options(stringsAsFactors = F)
library(RISmed)

search_topic <- c("Henan Cancer Hospital[AD] AND Qiong Chen[AU]")
search_query <- EUtilsSummary(search_topic,type="esearch",db="pubmed")
summary(search_query)
QueryId(search_query)
records<- EUtilsGet(search_query)
class(records)
str(records)

pubmed_data <- data.frame('PMID'=PMID(records),
                          'Title'=ArticleTitle(records),
                          'Year'=YearPubDate(records),
                          'journal'=ISOAbbreviation(records))
head(pubmed_data,1)
pubmed_data[1:3,1]
write.csv(pubmed_data,file='PAH-CHD.csv')


