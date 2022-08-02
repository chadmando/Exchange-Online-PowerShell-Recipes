# Get Group Membership

## Problem
You want to get the members of a group.

## Solution

```powershell
$group = "Group Name" # Insert your group name here
Get-Group -Identity $group | 
Select-Object -ExpandProperty Members |
ForEach-Object {Get-EXOMailbox -Identity $_} |
Select-Object -Property DisplayName
```

## Discussion

Use this approach when you are having issues using `Get-DistributionGroupMember`.
The `ForEach-Object` and selecting the `DisplayName` is for readability only.
