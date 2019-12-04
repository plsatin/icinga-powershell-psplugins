Import-IcingaLib provider\enums;

function Get-IcingaSoftwareLicensingProduct {
    param(
        [array]$ProductFilter = @()
    );

    <# #>

    # [hashtable]$LicenseStatusDescription = @{
    #     0 = 'Unlicensed';
    #     1 = 'Licensed';
    #     2 = 'Out-Of-Box Grace Period';
    #     3 = 'Out-Of-Tolerance Grace Period';
    #     4 = 'Non-Genuine Grace Period';
    #     5 = 'Notification';
    #     6 = 'Extended Grace';
    # }

    # $ErrorActionPreference = "SilentlyContinue"
    # $PSProviderEnums.Add('LicenseStatusDescription', $LicenseStatusDescription);



    $LicenseInformation = Get-WmiObject -Class SoftwareLicensingProduct | Where-Object PartialProductKey | Select-Object ID, Name, ApplicationId, LicenseStatus, ProductKeyChannel, KeyManagementServiceMachine;
    [hashtable]$LicenseData = @{};
    [int]$LicenseCount = 0;
    $LicenseData.Add('products', @{ });

    foreach ($lic in $LicenseInformation) {
        [string]$productname = $lic.Name;

        if ($ProductFilter.Count -ne 0) {
            # if (-Not $ProductFilter.Contains($productname)) {
            if (-Not $productname.Contains($ProductFilter)) {
                    continue;
            }
        }

        $LicenseCount += 1;

        $LicenseData.products.Add(
            $lic.ID, @{
                    'Name' = $lic.Name;
                    'ApplicationId' = $lic.ApplicationId;
                    'ProductKeyChannel' = $lic.ProductKeyChannel;
                    'LicenseStatus' = @{
                        'raw'   = $lic.LicenseStatus;
                        'value' = $PSProviderEnums.LicenseStatusDescription[[int]$lic.LicenseStatus];
                    };
                    'KeyManagementServiceMachine' = $lic.KeyManagementServiceMachine
            }
        );
    }

    $LicenseData.Add('count', $LicenseCount);

    return $LicenseData;
}

function Get-IcingaLicenseStatus()
{

    $license = Get-WmiObject -Class SoftwareLicensingProduct | Where-Object PartialProductKey; # | Select-Object Name, ApplicationId, LicenseStatus, ProductKeyChannel
    return @{'value' = $license.LicenseStatus; 'name' = 'LicenseStatus'};
}


