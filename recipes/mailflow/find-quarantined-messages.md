# Find Quarantined Messages

## Problem

You want to find all messages that have been quarantined in the last two days.

## Solution 1: `Get-MessageTrace`

```powershell
Get-MessageTrace -EndDate (Get-Date) -StartDate (Get-Date).adddays(-2) -Status Quarantined | 
Sort-Object -Property RecipientAddress | 
Format-Table -GroupBy RecipientAddress
```

## Solution 2: `Get-QuarantineMessage`

```powershell
Get-QuarantineMessage -EndReceivedDate (Get-Date) -StartReceivedDate (Get-Date).adddays(-2) | 
Select-Object -Property RecipientAddress, SenderAddress, Subject, PolicyName, MessageId |
Sort-Object -Property RecipientAddress |
Format-Table -GroupBy  RecipientAddress |
Out-Host -Paging
```

## Discussion

You will have an issue of messages being placed in quarantine when they should be delivered to a mailbox.
False positives are common when both AntiSpam and AntiPhish policies send messages to quarantine.
In a small organization, you can scroll through the quarantined messages for each user.
By showing all the messages, you may find a sender being flagged for all recipients.
Removing the `-GroupBy` parameter results in output that is dense but still readable.
Consider sorting by _SenderAddress_ or _Subject_ if you looking for false positives in the dense table view.

### Limiting Results

Add the `-RecipientAddress` parameter to the first line of either solution for targeted results.

### Selecting Properties for `Get-QuarantineMessage`

In Solution 2, the second stop in the pipe is the `Select-Object` cmdlet.
`Get-QuarantineMessage` returns many properties.
When piping to the `Format-Table` the properties you want may not be visible.
I have found this recipe works best when I explicitly select the properties I want to see.
