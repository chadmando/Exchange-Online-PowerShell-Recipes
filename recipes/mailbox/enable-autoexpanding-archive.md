# Enable AutoExpanding Archive On A Mailbox

## Problem

You want to enable AutoExpanding Archive on an individual user's mailbox

## Solution

```powershell
Enable-Mailbox tony@starkindustries.com -AutoExpandingArchive
```

## Discussion

To verify AutoExpanding Archive is enabled, use [this recipe](https://github.com/chadmando/Exchange-Online-PowerShell-Recipes/blob/main/recipes/mailbox/get-mailboxes-with-autoexpanding-archive-enabled.md).
