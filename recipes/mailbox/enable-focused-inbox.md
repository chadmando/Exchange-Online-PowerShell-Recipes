# Enable Focused Inbox For All User Mailboxes

## Problem

You need to enable the _Focused Inbox_ feature for all user mailboxes where it is disabled.

## Solution

```powershell
Get-EXOMailbox -RecipientTypeDetails Usermailbox |
Select-Object -Property Identity |
Get-FocusedInbox |
Where-Object {$_.FocusedInboxOn -eq $False} |
Foreach-Object {Set-FocusedInbox -Identity $_.MailboxIdentity -FocusedInboxOn $True}
```
