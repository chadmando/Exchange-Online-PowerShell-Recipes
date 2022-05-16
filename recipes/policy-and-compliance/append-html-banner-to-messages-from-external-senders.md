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

The `New-TransportRule` cmdlet has many parameters and a broad scope.
Finding the parameters for your needs can be confusing.
If you are struggling, try using the Exchange Admin Center to create a rule.
Then use PowerShell to view the parameters and values.

### Banner Options

The HTML, styling, and warning message in the `$banner` variable are not special.
Change them to suit your needs.
The `-ApplyHTMLDisclaimerLocation` can be set to `Append` (add to the end) or `Prepend` (add to the begining).
Again, use the location that works for you.
