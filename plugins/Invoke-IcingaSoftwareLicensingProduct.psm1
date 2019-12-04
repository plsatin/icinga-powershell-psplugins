<#
.SYNOPSIS
   Get Software Product License status
.DESCRIPTION


.FUNCTIONALITY


.EXAMPLE
PS> Invoke-IcingaCheckSoftProductLic
[OK] Check package "SoftwareLicensingProduct" (Match All)
\_ [OK] - Total licenses: 3
\_ [OK] Office 15, OfficeProPlusVL_KMS_Client edition (Volume:GVLK): Licensed: 1
\_ [OK] Office 15, OfficeVisioProVL_KMS_Client edition (Volume:GVLK): Licensed: 1
\_ [OK] Windows(R), ServerStandard edition (Volume:GVLK): Licensed: 1
0

.OUTPUTS
   System.String
.LINK
   https://github.com/plsatin/icinga-powershell-psplugins
.NOTES
#>

function Invoke-IcingaSoftwareLicensingProduct {
    param (
        [array]$ProductFilter,
        # $Warning             = $null,
        # $Critical            = $null,
        [switch]$NoPerfData,
        [ValidateSet(0, 1, 2, 3)]
        [int]$Verbosity      = 3
    );

    # # Тестовые переменные
    # [array]$ProductFilter = @()
    # $NoPerfData          = $true
    # $Warning             = $null
    # $Critical            = $null
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
