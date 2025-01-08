#show: letter.with(
$if(sender)$
  sender: [$sender$],
$endif$
$if(recipient)$
  recipient: [$recipient$],
$endif$
$if(sent)$
  date: [$sent$],
$endif$
$if(subject)$
  subject: [$subject$],
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
$if(name)$
  name: [$name$],
$endif$
)
