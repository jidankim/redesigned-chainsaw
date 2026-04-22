/*
 * Vendored from AbdullahHendy/clickworthy-resume v1.0.1
 * Source: https://github.com/AbdullahHendy/clickworthy-resume
 * License: MIT
 */

/*
Core formatting for the cover letter template document type. Establishes general document-wide formatting, and creates the header for the cover letter.

Inspired by the template from the following guide:
https://career.engin.umich.edu/sample-cover-letter/
*/

#let cover-letter(
  author: "",
  location: "",
  contacts: (),
  date: datetime.today().display(),
  addressee-name: "",
  addressee-institution: "",
  addressee-address: "",
  addressee-city: "",
  addressee-state: "",
  addressee-country: "",
  addressee-zip: "",
  font: "New Computer Modern",
  font-size: 11pt,
  lang: "en",
  margin: (
    top: 1cm,
    bottom: 1cm,
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

  pad(
    top: 1em,
    bottom: 0.5em,
    align(left)[
      #strong()[#date]
    ],
  )

  pad(
    bottom: 1em,
    align(left)[
      #strong[#addressee-name] \\
      #addressee-institution \\
      #addressee-address \\
      #{addressee-city + ", " + addressee-state + " " + addressee-zip} \\
      #addressee-country
    ],
  )

  set par(
    justify: true,
  )

  body

  text(
    font: font,
    size: font-size,
    lang: lang,
  )[
    #"" \\ \\
    #"Sincerely," \\
    #strong[#author]
  ]
}
