// Typst custom formats typically consist of a 'typst-template.typ' (which is
// the source code for a typst template) and a 'typst-show.typ' which calls the
// template's function (forwarding Pandoc metadata values as required)
//
// This is an example 'typst-show.typ' file (based on the default template  
// that ships with Quarto). It calls the typst function named 'article' which 
// is defined in the 'typst-template.typ' file. 
//
// If you are creating or packaging a custom typst template you will likely
// want to replace this file and 'typst-template.typ' entirely. You can find
// documentation on creating typst templates here and some examples here:
//   - https://typst.app/docs/tutorial/making-a-template/
//   - https://github.com/typst/templates
#show: doc => article(
$if(institute)$
  institute: [$for(institute)$$institute$$sep$\ $endfor$],
$endif$
$if(proofreading)$
  proofreading: [$proofreading$],
$endif$
$if(prefix)$
  prefix: [$prefix$],
$endif$
$if(year)$
  year: [$year$],
$endif$
$if(number)$
  number: [$number$],
$endif$
$if(issue)$
  issue: [$issue$],
$endif$
$if(title)$
  title: [$title$],
$endif$
$if(send_to)$
  send_to: [$for(send_to)$$send_to$$sep$, $endfor$],
$endif$
$if(show_send_to)$
  show_send_to: [$show_send_to$],
$endif$
$if(copy_to)$
  copy_to: [$for(copy_to)$$copy_to$$sep$, $endfor$。],
$endif$
$if(date)$
  date: [$date$],
$endif$
$if(info_query)$
  info_query: [$info_query$],
$endif$
$if(attach_file)$
  attach_file: [$for(attach_file)$+ $attach_file$$sep$\
  $endfor$],
$endif$
$if(copy_num)$
  copy_num: [$copy_num$],
$endif$
$if(classify)$
  classify: [$classify$],
$endif$

$if(emergency)$
  emergency: [$emergency$],
$endif$
  doc,
)
