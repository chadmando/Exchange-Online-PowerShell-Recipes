# Enable Mailbox Auditing For All Users

## Prerequisites

My notes for Mailbox Auditing say that Microsoft Defender for Office 365 P1 is required.
After some light searching, I cannot confirm this is true.
Microsoft changes policies so please confirm before using this recipe.

## Mailbox Auditing - On By Default

Mailbox auditing for Microsoft 365 Organizations should be _on by default_ for the following mailbox types:

+ User Mailbox
+ Shared Mailbox
+ Microsoft 365 Group Mailbox

To confirm mailbox auditing is enabled, we check that the `-AuditDisabled` is set to `False`.
This is a bit odd at first but think of it as a _double negative_; "Not Disabled" = "Enabled".

First connect to Exchange Online:

```powershell
Connect-ExchangeOnline
```

Then check the value of the `AuditDisabled` switch.

```powershell
Get-OrganizationConfig | Select-Object -Property AuditDisabled
```

If auditing is enabled, you will see that `AuditDisabled` is set to `False`:

```powershell
Get-OrganizationConfig | Select-Object -Property AuditDisabled
AuditDisabled
-------------
        False
```

## Mailboxes That Need to Auditing Enabled

If you want auditing for any of the following mailbox types, you will need to enable manually:

+ Resource Mailbox
+ Public Folder Mailbox
+ DiscoverySearch Mailbox

To enable auditing for these mailbox types use a routine like this:

```powershell
Get-ExoMailbox -RecipientTypeDetails DiscoveryMailbox | Set-Mailbox -AuditEnabled $True
```

To verify this worked, use the `-PropertySet Audit` with the `Get-ExoMailbox` command.

```powershell
Get-ExoMailbox -PropertySet Audit -RecipientTypeDetails DiscoveryMailbox | Select-Object -Property AuditEnabled

AuditEnabled
------------
        True
```

## References

[Microsoft Mailbox Auditing](https://learn.microsoft.com/en-us/purview/audit-mailboxes) Learn article.
