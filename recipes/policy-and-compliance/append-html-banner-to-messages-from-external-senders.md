# Append HTML Warning Banner To Messages From External Senders

## Problem

You want to add a banner to the end of messages sent from outside your organization.

## Solution

Create a transport rule to add a snippet of HTML code to the end of the message body.
First, store the HTML in a [Here-String](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_quoting_rules?view=powershell-7.2#here-strings).

```powershell
$banner = @"
<html>
    <body>
        <p style="background-color:orange; border-style:double">
        !! WARNING !! This message is from someone outside your organization.
        Use caution when replying or handling links and attachments.</p>
    </body>
</html>
"
```

```powershell
New-TransportRule -FromScope NotInOrganization -SentToScope InOrganization `
-ApplyHTMLDisclaimerLocation Append -ApplyHTMLDisclaimerText $banner -ApplyHTMLDisclaimerFallBackAction Wrap
```

## Discussion

The `New-TransportRule` cmdlet had many parameters.
Understanding which parameters are important for your need can be confusing.
Creating a Transport Rule in the Exchange Admin Center and then viewing the properties is a g
