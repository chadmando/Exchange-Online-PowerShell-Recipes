# Create Dynamic Distribution Group (DDG) Based On Department

## Problem

You want to create a distribution group that includes all users from the Marketing Department.

## Solution

```powershell
$Parameters = @{
    Name = "Marketing Group"
    DisplayName = "All Marketing Email List"
    RecipientFilter = "(RecipientType -eq 'UserMailbox') -and (Department -eq 'Marketing')"
    Confirm = $True
}
New-DynamicDistributionGroup @Parameters
```

## Discussion

Nothing clever here just an example of one way to create this type of group.
As you add or remove users from the Marketing Department, the list automatically updates.
>It may take time for all members to be added[^1].
>If you check the group membership too soon after creation, the group might be empty.

Many other configuration options are available for the group.
Check the help for details.

[^1]: Microsoft docs on [managing DDGs](https://docs.microsoft.com/en-us/exchange/recipients-in-exchange-online/manage-dynamic-distribution-groups/manage-dynamic-distribution-groups?tabs=create-new-eac%2Cproperties-powershell#important-changes-in-ddgs)
