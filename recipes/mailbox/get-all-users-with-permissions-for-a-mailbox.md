# Get All Users With Permissions For A Mailbox

## Problem

You want to find all users and their permissions for a mailbox.

## Solution

```powershell
$mailbox = # put the mailbox you want to check
Get-EXOMailboxPermission -Identity $mailbox |
Where-Object {$_.User -ne "NT AUTHORITY\SELF"} |
Select-Object @{Name="DisplayName";Expression={(Get-Exomailbox -Id $_.User).DisplayName}},AccessRights,InheritanceType
```

## Discussion

The default user, `NT AUTHORITY\SELF`, is excluded from the results.
A calculated property is used to show the `DisplayName` of the user.
