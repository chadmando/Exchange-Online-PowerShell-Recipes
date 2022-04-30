# Find All Messages From A Sender Address

## Problem

You want to find all messages and delivery details from a specific sender address.

## Solution

```powershell
$sender = "tony@starkenterprises.com"  # replace with your sender address
$lookbackdays = 4 # adjust the look back period as needed
Get-MessageTrace -StartDate (Get-Date).AddDays(-1*$lookbackdays) -EndDate (Get-Date) -SenderAddress $sender |
ForEach-Object -Process {$_ | Out-Default
Get-MessageTraceDetail -RecipientAddress ($_.RecipientAddress) -MessageTraceId ($_.MessageTraceID)}
```

## Discussion

Piping the results of `Get-MessageTrace` to `Get-MessageTraceDetails` provides detail on where the message was delivered.
If you don't specify start or end dates, only data from the last 48 hours is returned[^1].
The `Get-MessageTrace` command can only look back 10 days.
If you need data on messages older than 10 days, use this [recipe](./find-all-messages-more-than-ten-days-old.md).

## References

[^1]: _Description_ section of `Get-MessageTrace` help [documentation](https://docs.microsoft.com/en-us/powershell/module/exchange/get-messagetrace?view=exchange-ps#description).
