 <#
.SYNOPSIS
Test connection to Exchange Online
.DESCRIPTION
This script is a utililty to be used in scripts that access Exchange Online (EXO).
It uses a command that is only accessible if you are connected.  
If you are connected to EXO, the script return $True. If you are not connected,
the scripts returns $False and a warning message is written.  
.EXAMPLE
.\Test-EXOConnection.ps1
.OUTPUTS
Boolean
.LINK
URI or name of related topic. repeat LINK and URI/name as desired/needed.
.NOTES
Version:          1.0
Author:           Chad Miars
Creation Date:    04/02/2022
History:
    The test is based on a similar test used by Jay Carter in a blog post found here:
    https://exchangetips.us/2017/12/add-blocked-senders-to-exchange-online-using-powershell/?utm_source=pocket_mylist
        
#NOTE This comment block MUST come before everything else.
#>

$Connected = $False  # Connected variable defaults to $False
if ((Get-Command Get-UnifiedGroup -ea silentlycontinue)) {
    $Connected = $True   
}

if (-not $Connected){
    Write-Warning "No Connection to Exchange Online Found"  # Remove warning if you prefer less noise
}

Write-Output $Connected