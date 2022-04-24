# Create Shared Mailbox For Internal Process

## Problem

You want to create a shared mailbox for an internal business process.

## Solution

```powershell
New-Mailbox -Shared -Name "Internal Purchasing" -DisplayName "Internal Purchase Requests" -Alias InternalPurchasing |
Set-Mailbox -GrantSendOnBehalfTo PurchasingSG -RequireSenderAuthenticationEnabled $True |
Add-MailboxPermission -User PurchasingSG -AccessRights FullAccess -InheritanceType All
```

## Discussion

A common business need is a mailbox shared between several employees.
This recipe creates a shared mailbox used for internal purchase requests.
All of the members of *PurchasingSG* Distribution Group have `FullAccess` to the mailbox.

### Internal Senders Only

Because all requests are for internal purchases, there is no need to deliver messages from external senders.
Setting the `-RequireSenderAuthenticationEnabled` to `$True` means messages are accepted only from internal senders[^1].
External senders will recieve an *Undeliverable* response with the error 550 5.7.134.
This isn't the only way to control message delivery to a mailbox.
Transport rules[^2] can be crafted to do the same.

[^1]: See the `-RequireSenderAuthenticationEnable` documentation in the `Set-Mailbox` [help](https://docs.microsoft.com/en-us/powershell/module/exchange/set-mailbox?view=exchange-ps)
[^2]: Documentation for [New-TransportRule](https://docs.microsoft.com/en-us/powershell/module/exchange/new-transportrule?view=exchange-ps)