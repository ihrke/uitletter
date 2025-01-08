// This function gets your whole document as its `body`
// and formats it as a simple letter.
#let letter(
  // The letter's sender, which is display at the top of the page.
  sender: none,

  // The letter's recipient, which is displayed close to the top.
  recipient: none,

  // The date, displayed to the right.
  date: none,

  // The subject line.
  subject: none,

  // The name with which the letter closes.
  name: none,

  // UiT faculty from which the letter is sent
  faculty: none,

  // UiT department from which the letter is sent
  department: none,

  // UiT unit from which the letter is sent
  unit: none,

  // The letter's content.
  body
) = {
  // Configure page and text properties.
  // funny margins for the letter according to UiT Word template
  set page(paper: "a4", 
           margin: (left: 2.794cm, right: 1.8034cm,
                    top: 1.4cm, // 0.762cm plus height of empty header 0.04in
                    bottom: 2.413cm), // 0.9652cm plus 0.04in height + 0.53in spacing (footer-descent)
           header: rect(fill: aqua, width: 100%,  height: 100%, inset: 4pt)[],
           footer: rect(fill: aqua, width: 100%,  height: 100%, inset: 4pt)[
            #text(font: "Arial", size: 8pt)[ 
            PO box 6050 Langnes, NO-9037 Tromsø 
            #h(1fr) / #h(1fr)
            +47 77 64 40 00 
            #h(1fr) / #h(1fr)
            #link("mailto:postmottak@uit.no") 
            #h(1fr) / #h(1fr)
            #link("https://uit.no")[uit.no]
            #h(1fr) / #h(1fr)
            organization number 970 422 528
           ]
           ],
           footer-descent: 0.53in // "spacing" in word file
           )

  // --rectangle to fill the page for margin debugging
  //rect(fill: aqua, width: 100%,  height: 100%, inset: 4pt)[]
  
  // place logo in upper left corner of the first page
  // dims: 11cm x 1.3cm (auto)
  // logo reaches 1.4 into the margin so that UiT text aligns with text
  place(top+left, 
        dx: -1.4cm,
        image("UiT_Logo_Eng_Bla_RGB.png", width: 11cm, height: auto)
  )

  // text-block for sender in special format
  // space between end of logo and text: 1.8cm
  // i.e.: 11cm-1.4cm+1.8cm = 11.4cm from left margin
  // width of box: 8.27in (A4) - 1.10in (left margin) - 0.71in (right margin) - 11.4cm (distance) = 5.01cm
  let institutions = (faculty, department, unit)
  institutions = institutions.filter(val => val!=none)

  grid(columns: (11.4cm, 5.01cm),
    hide(""),
    grid.cell()[
      #text(weight: "bold", font: "Arial", size: 8pt, 
      institutions.reduce( (s1,s2) => s1+" / "+s2 )
    )
    ]
   //   Faculty / Department / Unit
    
  )

  // font is Arial for Sender/Receiver, Title, Attachments
  // font is Times New Roman for Text
  set text(font: "Arial")

  // Display sender at top of page. If there's no sender
  // add some hidden text to keep the same spacing.
  text(9pt, if sender == none {
    hide("a")
  } else {
    sender
  })

  v(1.8cm)

  // Display recipient.
  recipient

  v(0.5cm)

  // Display date. If there's no date add some hidden
  // text to keep the same spacing.
  align(right, if date != none {
    date
  } else {
    hide("a")
  })

  v(2cm)

  // Add the subject line, if any.
  if subject != none {
    pad(right: 10%, strong(subject))
  }

  // Add body and name.
  set text(font: "Times New Roman")
  body
  v(1.25cm)
  name
}
