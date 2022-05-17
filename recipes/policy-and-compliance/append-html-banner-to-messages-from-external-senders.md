# Append HTML Warning Banner To Messages From External Senders

## Problem

You want to add a banner to the end of messages sent from outside your organization.

## Solution

Create a transport rule to add a snippet of HTML code to the end of the message body.
First, store the HTML in a Here-String[^1].

```powershell
$html = @"
<html>
    <body>
        <p style="background-color:orange; border-style:double">
        !! WARNING !! This message is from someone outside your organization.
        Use caution when replying or handling links and attachments.</p>
    </body>
</html>
"@
```

```powershell
New-TransportRule -FromScope NotInOrganization -SentToScope InOrganization `
-ApplyHTMLDisclaimerLocation Append -ApplyHTMLDisclaimerText $html -ApplyHTMLDisclaimerFallBackAction Wrap
```

## Discussion

The _banner_ is a small snippet of HTML.
How this rule applies the banner to messages can be read from the parameters:

+ `-FromScope NotInOrganization`
+ `-SentToScope InOrganization`

This recipe shows one of many rules this cmdlet can create.

### Banner Options

The HTML, styling, and warning message in the `$html` variable are not special.
Change them to suit your needs.
The location of the message is flexible.
The `-ApplyHTMLDisclaimerLocation` can be set to:

+ `Append` (add to the end of the body)
+ `Prepend` (add to the begining of the body)

Again, use the location that works for you.

[^1]: [Here-String](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_quoting_rules?view=powershell-7.2#here-strings)