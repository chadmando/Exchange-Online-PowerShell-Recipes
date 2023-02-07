# Add Mailbox Permission Guide

## Problem

You want to give a user permission to a mailbox.

## Solution

The `Add-MailboxPermission` cmdlet handles this without much fuss.

```powershell
Add-MailboxPermission -Identity "johndoe@evilcorp.com" -User "Admin" -AccessRights Full -InheritanceType All
```

This example gives "Admin" FullAccess rights to the johndoe@evilcorp.com mailbox.

## Discussion

I have made the mistake of swapping the target mailbox and the user who is being given permission.
The purpose of this recipe is to explain it in plain language as a reminder to myself.

+ `-Identity` is the target mailbox
+ `-User` is the user being given permission to the target mailbox
