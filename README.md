# Exchange Online PowerShell Recipes

A Collection of PowerShell Scripts and One-Liners to Use With Exchange Online

Not enough for a cookbook, just some recipes.

## About

This repo is for anyone who manages Exchange Online using PowerShell.
All the recipes solve a common administration problem.
Use this information in any way that improves your process.
If you want to know more about _why_ this repo was created, read the [FAQ](FAQ.md).

## Requirements

You need a Microsoft 365 or Office 365 Subscription with access to Exchange Online.
In addition to Exchange Online access, you may also need permissions or management roles assigned to your account.
Review Microsoft's documentation on Exchange permissions [here](https://docs.microsoft.com/en-us/powershell/exchange/find-exchange-cmdlet-permissions).
If you need a test environment, sign up for a [Microsoft 365 Developer](https://developer.microsoft.com/en-us/microsoft-365/dev-program) account and use that tenant for testing.
To execute commands, you must be connected to Exchange Online using the [Exchange Online PowerShell V2 module](https://docs.microsoft.com/en-us/powershell/exchange/exchange-online-powershell-v2?view=exchange-ps).
If you are not connected, you'll receive an error message.

```powershell
PS > Get-EXOMailbox
Get-EXOMailbox: You must call Connect-ExchangeOnline before calling any other cmdlet.
```

## Warning

> Some recipes make changes that are difficult to undo.

Use the `-WhatIf` or `-Confirm` parameter when executing commands that make changes (Set, Remove, Enable, Disable) or test recipes before changing a production environment.
Recipes may have the _Enable_ or _Disable_ portion commented out for safety.

## Contributing

Contributions welcomed.
Please review the [Contributing Guidelines](CONTRIBUTING.md) before submitting a Pull Request (PR).

---

## Table of Contents

+ [Mailbox Recipes](#mailbox-recipes)
+ [Mail Flow Recipes](#mail-flow-recipes)
+ [Role Based Access Control Recipes](#role-based-access-control)
+ [User and Group Recipes](#user-and-group-recipes)

### Mailbox Recipes

+ [Create Shared Mailbox For An Internal B Process](recipes/mailbox/create-shared-mailbox-for-internal-process.md)
+ [Find The Largest User Mailboxes By ItemSize](recipes/mailbox/find-largest-user-mailbox-by-itemsize.md)
+ [Find The Quota Information for User Mailboxes](recipes/mailbox/find-quota-limits-for-mailboxes.md)

### Mail Flow Recipes

+ [Find All Messages From A Sender Address](recipes/mailflow/find-all-messages-from-sender-address.md)
+ [Find Quarantined Messages](recipes/mailflow/find-quarantined-messages.md)

### Role Based Access Control Recipes

+ [Find All Management Roles Assigned To All Users](recipes/role-based-access-control/find-management-roles-for-all-recipients.md)

### User and Group Recipes

+ [Create Dynamic Distribution Group By Department](recipes/user-and-group/create-dynamic-distribution-group-by-department.md)
