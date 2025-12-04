# Get The Largest Folders By Size For A User Mailbox

## Problem

You want to find the largest folders by size for a user's mailbox.
Mailbox includes email, calendar, contacts, and tasks.

## Solution

```pwsh
Get-MailboxFolderStatistics -Identity user@domain.com |
Select-Object @{Name="Folder";Expression={"$($_.Name) [$($_.FolderType)]"}},
@{Name="FolderSizeMB";Expression={
    $sizeParts = $_.FolderSize.ToString().Split(" ")
    $value = [double]$sizeParts[0]
    switch ($sizeParts[1]) {
        "B"  { $value = $value / 1MB }      # Bytes → MB
        "KB" { $value = $value / 1024 }     # KB → MB
        "MB" { $value = $value }            # MB → MB
        "GB" { $value = $value * 1024 }     # GB → MB
        default { $value = 0 }              # Handles unexpected or empty
    }
    [math]::Round($value,2)
}},
ItemsInFolder |
Where-Object {$_.FolderSizeMB -ne 0} |
Sort-Object FolderSizeMB -Descending
```
