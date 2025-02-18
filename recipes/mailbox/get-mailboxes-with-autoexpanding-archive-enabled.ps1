# Get Mailboxes With Auto-Expanding Archive Is Enabled

## Problem

You want to know which mailboxes have auto-expanding archive enabled.

## Solution

```pwsh
Get-Mailbox -ResultSize Unlimited |
Where-Object {$_.AutoExpandingArchiveEnabled -eq $true} |
Select-Object DisplayName, PrimarySmtpAddress
```
