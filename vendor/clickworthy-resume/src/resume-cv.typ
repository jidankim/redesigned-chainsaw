/*
 * Vendored from AbdullahHendy/clickworthy-resume v1.0.1
 * Source: https://github.com/AbdullahHendy/clickworthy-resume
 * License: MIT
 */

/*
Core formatting for the template document type. Establishes general document-wide formatting, and creates the header for the resume.

Inspired by the template from the `guided-resume-starter-cgc` v2.0.0 package:
https://github.com/typst/packages/blob/2da94b0f21174ae8366834332a6e44fd966de4dd/packages/preview/guided-resume-starter-cgc/2.0.0/template/templates/resume.template.typ
*/

#let resume(
  author: "",
  location: "",
  contacts: (),
  summary: "",
  theme-color: rgb("#26428b"),
  font: "New Computer Modern",
  font-size: 11pt,
  lang: "en",
  margin: (
    top: 1cm,
    bottom: 0cm,
    left: 1cm,
    right: 1cm,
  ),
  body,
) = {

  set document(author: author, title: author)

  set text(
    font: font,
    size: font-size,
    lang: lang,
    ligatures: false,
  )

  set page(
    margin: margin,
  )

  show link: set text(
    fill: rgb("#0645AD"),
  )

  show heading: set text(
    fill: rgb(theme-color),
  )

  show heading: it => [
    #pad(top: -0.3em, bottom: -0.8em, [#smallcaps(it.body)])
    #line(length: 100%, stroke: 1pt)
  ]

  align(center)[
    #block(text(weight: 700, 2.5em, [#smallcaps(author)]))
  ]

  align(center)[
    #[#contacts.join("  |  ")]
  ]

  if location != "" {
    align(center)[
      #smallcaps[#location]
    ]
  }

  if summary != "" {
    pad(
      top: 0em,
      align(center)[
        #summary
      ],
    )
  }

  set par(
    justify: true,
  )

  body
}

#let edu(
  institution: "",
  date: "",
  degrees: (),
  gpa: "",
  location: "",
  extra: "",
  hide: false,
) = {
  if hide {
    return
  }
  pad(
    bottom: -0em,
    grid(
      columns: (auto, 1fr),
      align(left)[
        #strong[#institution]
        #{
          if gpa != "" [
            | #emph[GPA: #gpa]
          ]
        }
        \\
        #{
          for degree in degrees [
            #strong[#degree.at(0)] | #emph[#degree.at(1)] \\
          ]
        }
        #{
          if extra != "" [
            #emph[#strong[#extra]]
          ]
        }
      ],
      align(right)[
        #emph[#date]
        #{
          if location != "" [
            \\ #emph[#location]
          ]
        }
      ],
    ),
  )
}

#let skills(areas) = {
  for area in areas {
    strong[#area.at(0): ]
    area.at(1).join(", ")
    linebreak()
  }
}

#let exp(
  title: "",
  organization: "",
  date: "",
  location: "",
  details: [],
  hide: false,
) = {
  if hide {
    return
  }
  pad(
    bottom: -0.3em,
    grid(
      columns: (auto, 1fr),
      align(left)[
        #strong[#title] \\
        #emph[#organization]
      ],
      align(right)[
        #emph[#date]
        #{
          if location != "" [
            \\ #emph[#location]
          ]
        }
      ],
    ),
  )
  details
}

#let pub(
  authors: (),
  bold-author: "",
  title: "",
  venue: "",
  year: "",
  doi-link: "",
  extra: "",
  hide: false,
) = {
  if hide {
    return
  }

  let fmt-authors = authors.map(
    a => if a == bold-author { strong[#a] } else { a },
  )

  let fmt-link = if doi-link != "" {
    link("https://" + doi-link)[#quote(title)]
  } else {
    quote(title)
  }

  let citation = [
    #{
      fmt-authors.join(", ") + ", " + fmt-link + ", " + emph(venue) + ", " + year + "." + if extra != "" { " " + strong[#extra] }
    }
  ]

  pad(
    bottom: -0.3em,
    align(left)[
      #citation
    ],
  )
}

#let pub-list(
  bib: "",
  style: "ieee",
) = {
  let publication-style(str) = {
    text(str)
  }
  show bibliography: it => publication-style(it)
  set bibliography(title: none, style: style, full: true)
  bib
}
