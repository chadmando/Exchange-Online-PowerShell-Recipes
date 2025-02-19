# Rebuild Search Index For Mailbox

## Problem

Search is broken for a user's mailbox in both the Outlook desktop application and in Outlook Web Access.

## Solution

The recommended solution is to move the mailbox in Exchange Online.

```pwsh
New-MoveRequest Tony@StarkEnterprises.com
```

You monitor the status of this request using this command.

```pwsh
Get-MoveRequestStatistics -Identity Tony@StarkEnterprises.com
```

## Discussion

This process will take time.
My experience is that a 40GB mailbox can take up to 10 hours to complete.

## Reference

Looking for a solution to "no search results in Outlook", I found this [article](https://techcommunity.microsoft.com/t5/exchange/rebuild-search-index-of-a-mailbox-in-exchange-online/m-p/25663#M384).
