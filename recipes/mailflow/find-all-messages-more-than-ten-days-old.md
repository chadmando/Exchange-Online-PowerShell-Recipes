# Find All Messages More Than Ten Days Old

## Problem

You want to run a message report like `Get-MessageTrace` but for messages older than 10 days.

## Solution

Use the `Start-HistoricalSearch` cmdlet and specify the `-ReportType` parameter as _MessageTrace_.

### Example

This command will need many parameters.
Use [_Splatting_](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_splatting?view=powershell-7.2) to improve readability.

```powershell
$ReportParameters = @{
    StartDate = "04/01/2022"
    EndDate = "04/07/2022"
    ReportTitle = "Message Trace April 01" 
    ReportType = "MessageTrace"
    NotifyAddress = "chad@man.do" # address must be in your org
    RecipientAddress = "alexw@man.do"
}
```

Check the help on the `Start-HistoricalSearch` cmdlet for all available parameters.
When you are ready to begin the job run this:

```powershell
Start-HistoricalSearch @ReportParameters
```

You'll receive output that includes a JobId.
If you want to stop the search, use the JobId in the `Stop-HistoricalSearch` cmdlet.

```text
JobId                                SubmitDate           ReportTitle            Status     Rows 
-----                                ----------           -----------            ------     ---- 
7361e4e0-a427-49fe-b50a-9ace93e48554 4/30/2022 7:03:45 PM Message Trace April 01 NotStarted 0
```

## Discussion

Exchange Online creates the report in a comma-separated value (CSV) format.
The CSV report is limited to 50,000 lines.
When the report is ready, an email with download link is sent to the `-NotifyAddress`.
The `-ReportTitle` will be in the email subject.
Microsoft limits the number of searches to 250 in a 24 hour period[^1].
_Stopped_ reports count against the 250 quota.
This report is limited in how far back it can look.

>This report can be run on messages that are less than 90 days old.

[^1]:The Description section of `Start-HistoricalSearch` help has the [quota details](https://docs.microsoft.com/en-us/powershell/module/exchange/start-historicalsearch?view=exchange-ps#description).
