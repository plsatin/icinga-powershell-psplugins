
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



[hashtable]$ProviderEnums = @{
    #/lib/provider/license
    LicenseStatusDescription = $LicenseStatusDescription;
}

Export-ModuleMember -Variable @('ProviderEnums');