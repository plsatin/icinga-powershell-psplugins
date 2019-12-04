<#
.SYNOPSIS
    Get Software licensing product status
.DESCRIPTION
    The script returns ok warning or critical depending on the status of the license. Also returns the total number of licensed software products. To obtain data, use the **SoftwareLicensingProduct** class. More Information on https://docs.microsoft.com/en-us/previous-versions/windows/desktop/sppwmi/softwarelicensingproduct
.FUNCTIONALITY
    This module is designed to obtain product licensing status.
.EXAMPLE
    PS> Invoke-IcingaSoftwareLicensingProduct
    [OK] Check package "SoftwareLicensingProduct" (Match All)
    \_ [OK] - Total licenses: 3
    \_ [OK] Office 15, OfficeProPlusVL_KMS_Client edition (Volume:GVLK): Licensed: 1
    \_ [OK] Office 15, OfficeVisioProVL_KMS_Client edition (Volume:GVLK): Licensed: 1
    \_ [OK] Windows(R), ServerStandard edition (Volume:GVLK): Licensed: 1
.PARAMETER ProductFilter
    The parameter is used to filter software products.
.INPUTS
    System.String
.OUTPUTS
    System.String
.LINK
    https://github.com/plsatin/icinga-powershell-psplugins
.NOTES
#>

function Invoke-IcingaSoftwareLicensingProduct {
    param (
        [array]$ProductFilter,
        [switch]$NoPerfData,
        [ValidateSet(0, 1, 2, 3)]
        [int]$Verbosity = 3
    );

    # # Тестовые переменные
    # [array]$ProductFilter = @('Office15')
    # $NoPerfData          = $true
    # [int]$Verbosity      = 3

    $ProductsPackage  = New-IcingaCheckPackage -Name 'SoftwareLicensingProduct' -OperatorAnd -Verbose $Verbosity;
    $LicenseProducts = Get-IcingaSoftwareLicensingProduct -ProductFilter $ProductFilter;

    foreach ($Product in $LicenseProducts.products.Keys) {
        $IcingaCheck = New-IcingaCheck -Name ([string]::Format('{0} ({1}): {2}', $LicenseProducts.products.$Product.Name, $LicenseProducts.products.$Product.ProductKeyChannel, $LicenseProducts.products.$Product.LicenseStatus.value)) -Value $LicenseProducts.products.$Product.LicenseStatus.raw -NoPerfData;
        $IcingaCheck.WarnIfGreaterThan(1) | Out-Null;
        $IcingaCheck.CritIfMatch(0) | Out-Null;
        $ProductsPackage.AddCheck($IcingaCheck)
    }

    $IcingaCheck = New-IcingaCheck -Name '- Total licenses' -Value $LicenseProducts.count;
    $ProductsPackage.AddCheck($IcingaCheck)


    return (New-IcingaCheckResult -Name 'SoftwareLicensingProduct' -Check $ProductsPackage -NoPerfData $NoPerfData -Compile);

}
