// This function gets your whole document as its `body`
// and formats it as a simple letter.
#let letter(
  // The name of the letter's sender, which is displayed close to the bottom.
  sender: none,

  // The sender's occupation, which is displayed under the name.
  sender_occupation: none,

  // The sender's email address, which is displayed under the occupation.
  sender_email: none,

  // The sender's phone number, which is displayed under the email address.
  sender_phone: none,

  // The letter's recipient, which is displayed close to the top.
  recipient: none,

  // The date, displayed to the right.
  date: none,

  // The subject line.
  title: none,

  // UiT faculty from which the letter is sent
  faculty: none,

  // UiT department from which the letter is sent
  department: none,

  // UiT unit from which the letter is sent
  unit: none,

  // UiT: your reference field
  your_ref: none,
  our_ref: none,

  // UiT: exempt from public disclosure text
  exempt_public: none,

  // UiT: attachment (list)matthias
  // UiT: language (norsk or english, no or en)
  lang: none,

  // The letter's content.
  body
) = {
  // Configure page and text properties.
  // funny margins for the letter according to UiT Word template
  set page(paper: "a4", 
           margin: (left: 2.794cm, right: 1.8034cm,
                    top: 1.4cm, // 0.762cm plus height of empty header 0.04in
                    bottom: 2.413cm), // 0.9652cm plus 0.04in height + 0.53in spacing (footer-descent)
           //header: rect(fill: aqua, width: 100%,  height: 100%, inset: 4pt)[],
           footer: //rect(fill: aqua, width: 100%,  height: 100%, inset: 4pt)[
            text(font: "Arial", size: 8pt)[ 
            PO box 6050 Langnes, NO-9037 Tromsø 
            #h(1fr) / #h(1fr)
            +47 77 64 40 00 
            #h(1fr) / #h(1fr)
            #link("mailto:postmottak@uit.no") 
            #h(1fr) / #h(1fr)
            #link("https://uit.no")[uit.no]
            #h(1fr) / #h(1fr)
            #if(lang != none and lang.text.starts-with("no")) [
              organisasjonsnummer
            ] else [
              organization number
            ]
            970 422 528
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
        if(lang != none and lang.text.starts-with("no")) {
          image("UiT_Logo_Bok_Bla_RGB.png", width: 11cm, height: auto)
        } else {
          image("UiT_Logo_Eng_Bla_RGB.png", width: 11cm, height: auto)
        }
  )


  //   Faculty / Department / Unit
  // text-block for sender in special format
  // space between end of logo and text: 1.8cm
  // i.e.: 11cm-1.4cm+1.8cm = 11.4cm from left margin
  // width of box: 8.27in (A4) - 1.10in (left margin) - 0.71in (right margin) - 11.4cm (distance) = 5.01cm
  let institutions = (faculty, department, unit)
  institutions = institutions.filter(val => val!=none)

  grid(columns: (11.4cm, 5.01cm),
    rows: 1.32in, // proper distance for recipient box below
    hide(""),
    grid.cell()[
      #set par(spacing: 0.5em)
      #text(weight: "bold", font: "Arial", size: 8pt, 
        institutions.reduce( (s1,s2) => s1+" / "+s2 )
      )

      // references
      #if(your_ref != none) {
        text(font: "Arial", size: 8pt, 
          if(lang != none and lang.text.starts-with("no")) {
            "Deres ref.: "+your_ref
          } else {
            "Your ref.: "+your_ref
          }
        )
      }

      #if(our_ref != none) {
        text(font: "Arial", size: 8pt, 
          if(lang != none and lang.text.starts-with("no")) {
            "Vår ref.: "+our_ref
          } else {
            "Our ref.: "+our_ref
          })
      }

      #text(font: "Arial", size: 8pt, 
        if(lang != none and lang.text.starts-with("no")) {
          "Dato: "+date
        } else {
          "Date: "+date
      })

      #if(exempt_public != none) {
        text(font: "Arial", size: 8pt, weight: "bold", exempt_public)
      }
    ]    
  )

  // recipient box: height 1.28in
  text(font: "Arial", size: 11pt, recipient)
  
  // space between recipient and text
  v(0.79in) 

  // Add the subject line, if any.
  if title != none {
    pad(right: 10%, text(weight: "bold", font: "Arial", size: 14pt, title))
  }

  // Add body and name.
  set text(font: "Times New Roman", size: 11pt)
  body
  v(1.25cm)
  set par(spacing: 0.5em)
  sender 

  if(sender_occupation != none) {
    linebreak()
    sender_occupation
  }

  if(sender_email != none or sender_phone != none) {
    linebreak()
    text("—")
    if(sender_email != none) {
      linebreak()
      link("mailto:"+sender_email, sender_email)
    }
    if(sender_phone != none) {
      linebreak()
      sender_phone
    }

  }

  // attachments
  if(attachments != none) {
    v(1.25cm)
    text(font: "Arial", size: 8pt)[ 
      Attachments: 

      #for attachment in attachments {
          enum.item(attachment)
      }
    ]
  }
}
