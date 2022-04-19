# Find Quarantined Messages

## Problem

You want to find all messages that have been quarantined in the last two days.

## Solution

```powershell
Get-MessageTrace -EndDate (Get-Date) -StartDate (Get-Date).adddays(-2) -Status Quarantined | 
Sort-Object -Property RecipientAddress | 
Format-Table -GroupBy RecipientAddress
```

## Discussion

You will have an issue of messages being placed in quarantine when they should be delivered to an mailbox.
False positives are common when both AntiSpam and AntiPhish policies send messages to quarantine.
In a small organization, you can scroll through the quarantined messages for each user.
By showing all the messages, you may find a sender being flagged for all recipients.
Removing the `-GroupBy` parameter results in output that is dense but still readable.
Consider sorting by _SenderAddress_ or _Subject_ if you looking for false positives in the dense table view.

### Limiting Results

Add the `-RecipientAddress` parameter to the `Get-MessageTrace` cmdlet for targeted results.
