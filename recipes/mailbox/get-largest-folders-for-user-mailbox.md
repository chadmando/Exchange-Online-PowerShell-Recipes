# Get The Largest Folders By Size For A User Mailbox

## Problem

You want to find the largest folders by size for a user's mailbox.
Mailbox includes email, calendar, contacts, and tasks.

## Solution

```pwsh
Get-MailboxFolderStatistics -Identity "user@domain.com" |
Select @{Name="Folder";Expression={"$($_.Name) [$($_.FolderType)]"}},
@{Name="FolderSizeMB";Expression={[math]::Round($_.FolderSize.ToString().Split(" ")[0],2)}},
ItemsInFolder |
Sort-Object FolderSizeMB -Descending
```
