#show: letter.with(
$if(recipient)$
  recipient: [$recipient$],
$endif$
$if(date)$
  date: [$date$],
$endif$
$if(title)$
  title: [$title$],
$endif$
$if(faculty)$
  faculty: [$faculty$],
$endif$
$if(department)$
  department: [$department$],
$endif$
$if(unit)$
  unit: [$unit$],
$endif$
$if(your_ref)$
  your_ref: [$your_ref$],
$endif$
$if(our_ref)$
  our_ref: [$our_ref$],
$endif$
$if(exempt_public)$
  exempt_public: [$exempt_public$],
$endif$
$if(sender)$
  sender: [$sender$],
$endif$
$if(sender_occupation)$
  sender_occupation: [$sender_occupation$],
$endif$
$if(sender_email)$
  sender_email: [$sender_email$],
$endif$
$if(sender_phone)$
  sender_phone: [$sender_phone$],
$endif$
$if(attachments)$
  attachments: ($for(attachments)$"$attachments$"$sep$, $endfor$),
$endif$
)
