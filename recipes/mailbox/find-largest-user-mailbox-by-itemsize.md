# Find the Largest User Mailboxes

## Problem

You want to find the largest user mailboxes by the total size of all items.

## Solution

```powershell
Get-ExoMailbox -RecipientTypeDetails Usermailbox -ResultSize Unlimited |
Select-Object -Property Identity |
Get-EXOMailboxStatistics -PropertySet All |
Sort-Object -Property TotalItemSize -Descending |
Select-Object -Property DisplayName, TotalItemSize -First 10
```

## Discussion

If you have a large organization, this could take some time to execute.
Adjust the `-First 10` to suit your needs.
This recipe can be modified to find other properties.
Using the `Get-EXOMailboxStatistics -PropertySet All` provides access to _all_ the properties[^1].


### Example

Change this recipe to find the largest user mailboxes by item _count_ instead of total item _size_.

```powershell
Get-ExoMailbox -RecipientTypeDetails Usermailbox -ResultSize Unlimited |
Select-Object -Property Identity |
Get-EXOMailboxStatistics -PropertySet All |
Sort-Object -Property ItemCount -Descending |
Select-Object -Property DisplayName, ItemCount -First 10 
```

## References

[1^]: `Get-EXOMailboxStatistics` Property Set [documentation](https://docs.microsoft.com/en-us/powershell/exchange/cmdlet-property-sets?view=exchange-ps#get-exomailboxstatistics-property-sets)
