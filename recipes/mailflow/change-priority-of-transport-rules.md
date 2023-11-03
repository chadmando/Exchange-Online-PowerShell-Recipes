# Change Priority Of Transport Rules

## Problem

You want to change the priority of a transport rule.

## Solution

You are able to change the priority of transport rules using the Exchange Admin Center (EAC).
The user experience is awful.
A faster way is to use Powershell.

If you want to change the priority from XX to YY:

```pwsh
Connect-ExchangeOnline
# complete authentication flow

Get-Transportrule | ?{$_.Priority -eq XX} | Set-Transportrule -Priority YY

```

## Discussion

All rules with a priority greater than or equal to the new priority of your rule will be increased by one.