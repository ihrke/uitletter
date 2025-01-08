# Letter Format for UiT - The arctic university of Tromsø

Based on the Quarto-letter template <https://github.com/quarto-ext/typst-templates/tree/main/letter> which is based on the letter template published by the Typst team at <https://github.com/typst/templates/tree/main/letter>.


## Installing

```bash
quarto use template ihrke/quarto-uitletter
```

This will install the extension and create an example qmd file that you can use as a starting place for your document.

## Using

Specify the sender, recipient, subject, etc. using YAML options, then write the body of the letter. An example is fount in `template.qmd`.

This document would be rendered as:

![](letter.png)

### Options

- **Sender Information**:
  - `sender` - The name of the letter's sender, displayed close to the bottom. *(Default: none)*
  - `sender_occupation` - The sender's occupation, displayed under the name. *(Default: none)*
  - `sender_email` - The sender's email address, displayed under the occupation. *(Default: none)*
  - `sender_phone` - The sender's phone number, displayed under the email address. *(Default: none)*

- **Recipient Information**:
  - `recipient` - The letter's recipient, displayed close to the top. *(Default: none)*

- **Letter Metadata**:
  - `date` - The date, displayed to the right. *(Default: none)*
  - `title` - The subject line of the letter. *(Default: none)*

- **UiT Details**:
  - `faculty` - The UiT faculty from which the letter is sent. *(Default: none)*
  - `department` - The UiT department from which the letter is sent. *(Default: none)*
  - `unit` - The UiT unit from which the letter is sent. *(Default: none)*
  - **References**:
    - `your_ref` - UiT: your reference field. *(Default: none)*
    - `our_ref` - UiT: our reference field. *(Default: none)*
  - `exempt_public` - Text related to exempting the letter from public disclosure. *(Default: none)*
  - `attachments` - A list of any attachments included with the letter. *(Default: none)*
  - `lang` - The language of the letter (`norsk` or `english`, `no` or `en`). *(Default: none)*
