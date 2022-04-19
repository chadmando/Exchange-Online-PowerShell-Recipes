# Find Management Roles Assigned to All Users

## Problem

You want to see all privileged management roles assigned to all users.

## Solution

```powershell
Get-User |
Select-Object -ExpandProperty Id -PipelineVariable Id |
ForEach-Object -Process {"`n`n Roles for $Id : `n" | Out-Default;
Get-ManagementRoleAssignment -RoleAssignee $_ -Delegating $False -ErrorAction SilentlyContinue} |
Where-Object {$_.RoleAssignee -ne "Default Role Assignment Policy"} |
Select-Object -Property Role, RoleAssignee
```

## Discussion

This recipe removes the `Default Role Assignment Policy`.
Many or all licenced users have this Management Role.
It gives the user access to their data and won't be relevant if you are searching for elevated privileges.
