---
title: "ICDO3编码规则一：诊断报告解剖学部位为区域或不明确"
date: 2021-11-15
slug: rule1
link: https://chenq.site/tech/2021-rule1/
categories:
  - 肿瘤登记
  - 编码
keywords: ["肿瘤登记","分类与编码","ICD-O3"]
summary: "本篇文章介绍了当我们在进行ICDO3的编码工作时，如果临床诊断报告的解剖学部位是一个区域或不明确的时候，我们应该怎么进行编码！"
---

### 规则描述

我们在前面的文章里介绍了[ICDO-3的基本概念](https://chenq.site/post/2021/10/icdo3/)，接着我们继续介绍实际编码过程中可以参照的一些规则。

首先，第一条规则就指定了一种情况，当诊断报告里解剖学部位的描述是一个"区域"或者"不明确部位"，没有指出起源的组织，这个时候应该怎么编码？比如诊断报告这样描述"**臂**的肿瘤"，而"臂"有可能是臂的皮肤、臂的软组织或者臂的骨。当临床诊断只是"臂肿瘤"而没有其他信息可供参考的时候，只能编码到一个很粗的编码上C76.4（臂，NOS）。

当解剖学部位不明确或是一个区域，但是有其他信息可供参考的时候，则应编码到合理的部位。比如诊断为"臂的癌瘤、黑色素瘤和痣"，这个时候解剖学部位编码应该编码到"臂的皮肤（C44.6）"，而不应该再编码到C76.4。虽然这个描述仅提及"臂"没有明确的解剖学部位信息，但是我们可以从黑色素瘤或痣的形态学信息上知道解剖学部位应该皮肤，因为这种形态学是多发于皮肤的。同样的原理，如果诊断为"臂的肉瘤，脂肪瘤"，则应编码到C49.1（臂的软组织）。

对于骨肿瘤的编码应特别注意，骨肉瘤和软骨肉瘤两者通常都发生在骨，而"臂骨"的编码为C40.0（上
肢的长骨、肩胛骨和
相关的关节），如果骨肉瘤或软骨肉瘤发生这些臂骨，则C40.0的解剖学编码正确。


| 解剖学部位编码 |             部位描述              |
|:--------------:|:---------------------------------:|
|     C76.4      |              臂，NOS              |
|     C44.6      | 臂的皮肤，NOS（癌、黑色素瘤、痣） |
|     C47.1      |           自主神经组织            |
|     C40.0      |                骨                 |
|     C49.1      | 结缔组织、脂肪组织、纤维组织，NOS |
|     C77.3      |              淋巴结               |
|     ......     |                                   |

: 臂肿瘤的索引

### ICDO3解剖学部位为区域或不明确部位编码汇总

中国肿瘤登记工作指导手册（2016）对解剖学部位为区域或不明确的ICDO3的解剖学部位编码进行了汇总，具体如下表：

| 解剖学部位编码 | 部位描述                                                                                                                 |
|----------------|--------------------------------------------------------------------------------------------------------------------------|
| C76.0          | 头、面和颈，NOS（颊、颌、鼻、颈区、锁骨上区，NOS）                                                                       |
| C76.1          | 胸，NOS（腋、胸壁、胸内部、胸壁、锁骨下区和肩胛区，NOS）                                                                 |
| C76.2          | 腹，NOS（腹壁、腹内部，NOS）                                                                                             |
| C76.3          | 骨盆，NOS（臀、腹股沟、坐骨肛门窝、骨盆壁、会阴、直肠阴道隔、直肠膀胱隔、臀区、腹股沟区、直肠周区、骶前区、骶尾区，NOS） |
| C76.4          | 上肢，NOS（肘窝、肘、手指、前臂、手、肩、拇指、腕，NOS）                                                                 |
| C76.5          | 下肢，NOS（踝、小腿、足、足跟、臀部、膝、腿、下肢、腘窝、大腿、趾，NOS）                                                 |
| C76.7          | 其他不明确的部位（背、胁腹、躯干，NOS）                                                                                  |

: ICDO3解剖学部位为区域或不明确部位编码汇总

### 临床常见的解剖学部位为区域的诊断有哪些？

#### 病例1

> 病人年龄63岁，男性，2020年2月入院治疗，门诊诊断和主要诊断为腹部恶性肿瘤，病理学诊断：横纹肌肉瘤（M8900/3）
>我们在给解剖学部位进行编码的时候就不能编码到C76.2，因为有相应的病理学诊断"横纹肌肉瘤"（未成熟的肌肉细胞组成的癌症），因此应编码到**C49.4**（腹部的结缔组织、皮下组织和其他，包括腹壁肌肉）。
>一套完整的ICDO3编码为：**C49.4** M8900/3 9


#### 病例2

> 病人2020年2月入院，男性，46岁，诊断为腘窝恶性肿瘤，后病理诊断为脂肪肉瘤（M8850/3）。
>这种情况和病例1相似，虽然诊断信息里没有描述具体的部位，但是结合病理学信息"脂肪肉瘤"的诊断，我们可以知道，癌症发生于腘窝的脂肪组织，那么对应的ICDO3解剖学部位编码为C49.2（下肢和臀部的结缔组织、皮下组织和其他软组织）。
>一套完整的ICDO3编码为：**C49.2** M8850/3 9


#### 病例3

> 男性病人，32岁，2020年3月入院治疗，诊断为"腹部恶性肿瘤"，返回的病理报告为"恶性肿瘤（M8000/3）"
>这份报告首先发病部位的描述不明确，为一个区域（腹部），其次病理报告也没有提供足够的信息（仅知道是恶性肿瘤），不能提供癌症的细胞来源信息。因此，我们在进行ICDO3编码的时候只能把它的解剖学部位编到C76.2（腹，NOS）。
>一套完整的ICDO3编码为：**C76.2** M8000/3 9


### 该规则应用的注意事项


1.  当遇到诊断发病部位为区域或不明确部位时，一定搜集到全部相关信息，比如病理报告、其他相关检查（排除转移）。
1.  从病理报告里读取相应的形态学的起源组织或细胞，一些病理类型是从名字上可以之间看出，比如横纹肌肉瘤、脂肪肉瘤等，而还有一些不太容易直接看出，这个时候可以利用搜索引擎去查询，一般都可以找到相应的知识点。
1.  先结合相关信息尽量明确解剖学部位，实在无法编码到确切部位时，再编码到相应的C76.X。


### 小结

ICDO3的编码是一个繁琐的过程，需要我们仔细搜集相应的信息，然后尽量利用一切可以利用的信息，编到更确切的部位。
