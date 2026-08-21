# Get Last Sync Data For A Mobile Device

## Problem

You want to know the last time a mobile device syncronized with Exchange Online.

## Solution

Use the `Get-MobileDeviceStatistics` cmdlet.
There are many *statistics*, so you may need to select only the properties of interest.

```pwsh
 Get-MobileDeviceStatistics -Mailbox <user@comp.any> |
Select-Object -Property DeviceID, DeviceType, DeviceModel, DeviceOS,LastSyncAttemptTime,LastSuccessSync, DeviceAccessState, DeviceAccessStateReason
```

## Discussion

Use this receipe if a user's mail isn't syncing to their mobile device.
I included the `DeviceOS` in the properties because a common issue with iOS devices is the need for re-authentication after an iOS update.
