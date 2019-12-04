
<##################################################################################################
################# /lib/provider/license #############################################################
##################################################################################################>

[hashtable]$LicenseStatusDescription = @{
    0 = 'Unlicensed';
    1 = 'Licensed';
    2 = 'Out-Of-Box Grace Period';
    3 = 'Out-Of-Tolerance Grace Period';
    4 = 'Non-Genuine Grace Period';
    5 = 'Notification';
    6 = 'Extended Grace';
}

[hashtable]$DiskDriveStatus = @{
    'OK'         = 0;
    'Error'      = 1;
    'Degraded'   = 2;
    'Unknown'    = 3;
    'Pred Fail'  = 4;
    'Starting'   = 5;
    'Stopping'   = 6;
    'Service'    = 7;
    'Stressed'   = 8;
    'NonRecover' = 9;
    'No Contact' = 10;
    'Lost Comm'  = 11;

}



[hashtable]$PSProviderEnums = @{
    #/lib/provider/license
    LicenseStatusDescription = $LicenseStatusDescription;
    DiskDriveStatus = $DiskDriveStatus;
}

Export-ModuleMember -Variable @('PSProviderEnums');