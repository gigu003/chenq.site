
// This is an example typst template (based on the default template that ships
// with Quarto). It defines a typst function named 'article' which provides
// various customization options. This function is called from the 
// 'typst-show.typ' file (which maps Pandoc metadata function arguments)
//
// If you are creating or packaging a custom typst template you will likely
// want to replace this file and 'typst-show.typ' entirely. You can find 
// documentation on creating typst templates and some examples here: 
//   - https://typst.app/docs/tutorial/making-a-template/
//   - https://github.com/typst/templates

#let article(
  institute: none,
  prefix: none,
  year: none,
  number: none,
  issue: none,
  send_to: none,
  show_send_to: none,
  copy_to: none,
  title: none,
  date: none,
  proofreading: none,
  info_query: none,
  attach_file: none,
  copy_num: none,
  classify: none,
  emergency: none,
  doc,
) = {
  set page(
    paper: "a4",
    margin: (left: 2.8cm, right: 2.6cm, top:3.7cm, bottom: 3.5cm),
    footer: context {
      let page = counter(page).get().first()
      let body = if calc.odd(page) [\- #page \-#h(1em)] else [#h(1em)\- #page \-]
      let alignment = if calc.odd(page) { right } else { left }
      align(alignment, text(size:14pt)[#body])
      }
  )
  set par(
    leading: 5mm,
    justify: true
    )
  set text(lang: "CN",
           font: "fangsong_GB2312",
           size: 16pt)

set heading(numbering: "一、(一)1.(1)")
show heading: it => locate(loc => {
    let levels = counter(heading).at(loc)
    let deepest = if levels != () {
        levels.last()
    } else {
        1
    }

    if it.level == 1 [
        #set par(first-line-indent: 0pt)
        #set text(size: 16pt, font: "SimHei")
        #if it.numbering != none {
        numbering("一、", levels.last())
        }
        #it.body
    ] else if it.level == 2 [
        #set par(first-line-indent: 0pt)
        #set text(size:16pt, font:"kaiti_GB2312")
        #if it.numbering != none {
        numbering("(一)", levels.last())
        }
        #it.body
    ] else if it.level == 3 [
        #set par(first-line-indent: 0pt)
        #set text(size:16pt, font:"fangsong_GB2312")
        #v(15pt, weak: true)
        #if it.numbering != none {
          numbering("1.", levels.last())
        }
        #it.body
        #v(15pt, weak: true)
    ] else [
        #set par(first-line-indent: 0pt)
        #set text(size:16pt, font:"fangsong_GB2312")
        #v(12pt, weak: true)
        #if it.numbering != none {
        numbering("(1)", levels.last())
        h(7pt, weak: true)
        }
        #it.body
        #v(12pt, weak: true) 
    ]
})

//设置发文份号
if copy_num != none {
text(size:14pt)[#copy_num]
parbreak()
}

//设置密级和保密期限
if classify!= none {
text(font:"Simhei", size:14pt)[#classify]
parbreak()
}

//设置紧急程度
if emergency!= none {
text(font:"Simhei", size:14pt)[#emergency]
parbreak()
}

//设置发文机关
if institute != none {
align(center)[
#align(horizon)[
    #grid(columns: 2,
          gutter: 0.2em,
          text(font: "方正小标宋简", size: 25pt, tracking:0pt,fill: red)[#institute],
          text(font: "方正小标宋简", size: 30pt, fill: red)[#h(0.5em)文件])
]
]
}

v(30mm)

//设置发文字号
set block(spacing: 4mm)
align(center)[
 #text[#prefix〔#year〕#number 号]
 //版头分割线
 #line(length: 100%, stroke: 0.35mm + red)
]

v(10mm)

//发文标题
if title != none {
 align(center)[#text(font: "方正小标宋简", weight: "bold", size: 22pt)[#title]]
}

v(10mm)
//主送机关
set block(spacing: 6mm)
align(left)[#send_to：]
v(4mm)

//正文
par(first-line-indent: 2em)[#doc]

//附件
if attach_file != none {
  v(6mm)
  grid(
    columns: (5em, auto),
    gutter: 0em,
    [#h(2em)附件：],
    [#attach_file]
    )
}

//信息公开形式
if info_query != none {
align(left)[（信息公开形式：#info_query）]
}

v(10mm)

//发文机关署名、成文日期和印章
if institute != none {
  align(right)[#text[#institute#h(2em)#parbreak()#date#h(4em)]]
}


set block(spacing: 3mm)
set text(size: 14pt)
place(bottom,float:false)[
  #line(length: 100%, stroke: 0.35mm + black)
  #if send_to != none [
  #if show_send_to != none [
      #grid(
        columns: (4em, auto),
        align: (top, left),
        gutter: 0em,
        [#h(1em)主送：],
        par(leading:4mm)[#send_to。]
        )
          ]
      ]
  #if copy_to != none [
    #grid(
        columns: (4em, auto),
        align: (top, left),
        gutter: 0em,
        [#h(1em)抄送：],
        par(leading:4mm)[#copy_to]
        )
    #line(length: 100%, stroke: 0.25mm + black)
  ]
    
  #grid(
    columns: (1fr, 1fr),
    align: (left, right),
    column-gutter: 0em,
    text(size: 14pt)[#h(1em)#issue],
    text(size: 14pt)[#date#h(0em)印发#h(1em)]
  )
  #line(length: 100%, stroke: 0.35mm + black)
  #if proofreading != none [
      #align(right)[#text(size: 14pt)[校对：#proofreading] #h(2em)]
    ]
    ]

}