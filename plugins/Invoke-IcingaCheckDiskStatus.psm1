<#
.SYNOPSIS
   Checks Disk Drive status
.DESCRIPTION
    Invoke-IcingaCheckDiskStatus returns either 'OK', 'WARNING' or 'CRITICAL'
.FUNCTIONALITY
    Current status of the object. Various operational and nonoperational statuses can be defined. Operational statuses include: "OK", "Degraded", and "Pred Fail" (an element, such as a SMART-enabled hard disk drive, may be functioning properly but predicting a failure in the near future). Nonoperational statuses include: "Error", "Starting", "Stopping", and "Service". The latter, "Service", could apply during mirror-resilvering of a disk, reload of a user permissions list, or other administrative work. Not all such work is online, yet the managed element is neither "OK" nor in one of the other states.
.EXAMPLE
    PS> Invoke-IcingaCheckDiskStatus -NoPerfData
    [OK] Check package "Disk Drives Status" (Match All)
    \_ [OK] Disk Drive "\\.\PHYSICALDRIVE0" (WDC WD10EZRZ-00Z5HB0): 0
    \_ [OK] Disk Drive "\\.\PHYSICALDRIVE1" (WDC WD1003FBYX-01Y7B0): 0
    \_ [OK] Disk Drive "\\.\PHYSICALDRIVE2" (WDC WD1002FBYS-02A6B0): 0
    \_ [OK] Disk Drive "\\.\PHYSICALDRIVE3" (WDC WD1003FBYX-01Y7B0): 0
.OUTPUTS
   System.String
.LINK
   https://github.com/Icinga/icinga-powershell-plugins
.NOTES
#>

function Invoke-IcingaCheckDiskStatus {
    param(
        [switch]$NoPerfData,
        [ValidateSet(0, 1, 2, 3)]
        [int]$Verbosity     = 3
    );

    $DiskStatus = Show-IcingaDiskData;
    $DiskPackage = New-IcingaCheckPackage -Name 'Disk Drives Status' -OperatorAnd -Verbose $Verbosity;


    # [hashtable]$DiskDriveStatus = @{
    #     'OK'         = 0;
    #     'Error'      = 1;
    #     'Degraded'   = 2;
    #     'Unknown'    = 3;
    #     'Pred Fail'  = 4;
    #     'Starting'   = 5;
    #     'Stopping'   = 6;
    #     'Service'    = 7;
    #     'Stressed'   = 8;
    #     'NonRecover' = 9;
    #     'No Contact' = 10;
    #     'Lost Comm'  = 11;
    
    # }
    
    # $ErrorActionPreference = "SilentlyContinue"
    # $PSProviderEnums.Add('DiskDriveStatus', $DiskDriveStatus);


    foreach ($Disk in $DiskStatus.Values) {

        [int]$DiskDriveStatus = $PSProviderEnums.DiskDriveStatus[[string]$Disk.Status];


        $IcingaCheck = New-IcingaCheck -Name ([string]::Format('Disk Drive "{0}" ({1}): {2}', $Disk.DeviceID, $Disk.Caption, $Disk.Status)) -Value $DiskDriveStatus;
        # $IcingaCheck.WarnIfGreaterThan(0) | Out-Null;
        $IcingaCheck.WarnOutOfRange(0).CritOutOfRange(8) | Out-Null;
        $DiskPackage.AddCheck($IcingaCheck);
    }

    return (New-IcingaCheckResult -Check $DiskPackage -NoPerfData $NoPerfData -Compile);

}
