# Find Quota Limits for User Mailboxes

## Problem

You want to see the quota limits for user mailboxes.

## Solution

```powershell
Get-EXOMailbox -PropertySets Quota -RecipientTypeDetails Usermailbox -ResultSize Unlimited |
Select-Object -Property Identity, ProhibitSendQuota, ProhibitSendReceiveQuota, IssueWarningQuota |
Format-Table
```

Results:

```text
Identity            ProhibitSendQuota             ProhibitSendReceiveQuota       IssueWarningQuota
--------            -----------------             ------------------------       -----------------
AdeleV              99 GB (106,300,440,576 bytes) 100 GB (107,374,182,400 bytes) 98 GB (105,226,698,752 bytes)
AlexW               99 GB (106,300,440,576 bytes) 100 GB (107,374,182,400 bytes) 98 GB (105,226,698,752 bytes)
chad                99 GB (106,300,440,576 bytes) 100 GB (107,374,182,400 bytes) 98 GB (105,226,698,752 bytes)
DiegoS              99 GB (106,300,440,576 bytes) 100 GB (107,374,182,400 bytes) 98 GB (105,226,698,752 bytes)
GradyA_ea705059d0   99 GB (106,300,440,576 bytes) 100 GB (107,374,182,400 bytes) 98 GB (105,226,698,752 bytes)
HenriettaM          99 GB (106,300,440,576 bytes) 100 GB (107,374,182,400 bytes) 98 GB (105,226,698,752 bytes)
JohannaL_0df74a2e37 99 GB (106,300,440,576 bytes) 100 GB (107,374,182,400 bytes) 98 GB (105,226,698,752 bytes)
JoniS               99 GB (106,300,440,576 bytes) 100 GB (107,374,182,400 bytes) 98 GB (105,226,698,752 bytes)
LeeG                99 GB (106,300,440,576 bytes) 100 GB (107,374,182,400 bytes) 98 GB (105,226,698,752 bytes)
LidiaH              99 GB (106,300,440,576 bytes) 100 GB (107,374,182,400 bytes) 98 GB (105,226,698,752 bytes)
LynneR              99 GB (106,300,440,576 bytes) 100 GB (107,374,182,400 bytes) 98 GB (105,226,698,752 bytes)
MeganB              99 GB (106,300,440,576 bytes) 100 GB (107,374,182,400 bytes) 98 GB (105,226,698,752 bytes)
MiriamG             99 GB (106,300,440,576 bytes) 100 GB (107,374,182,400 bytes) 98 GB (105,226,698,752 bytes)
NestorW             99 GB (106,300,440,576 bytes) 100 GB (107,374,182,400 bytes) 98 GB (105,226,698,752 bytes)
PattiF              99 GB (106,300,440,576 bytes) 100 GB (107,374,182,400 bytes) 98 GB (105,226,698,752 bytes)
PradeepG            99 GB (106,300,440,576 bytes) 100 GB (107,374,182,400 bytes) 98 GB (105,226,698,752 bytes)
User_4abdf02f4b     99 GB (106,300,440,576 bytes) 100 GB (107,374,182,400 bytes) 98 GB (105,226,698,752 bytes)
```

## Discussion

These results seem boring.
All mailboxes have the same quota limits.
This might not be true for every organization.
Different licensing or internal policies will change mailbox capacity and associated quota limits.
