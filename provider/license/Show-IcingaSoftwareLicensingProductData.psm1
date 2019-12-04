function Show-IcingaSoftwareLicensingProductData {
    $LicenseInformation = Get-WmiObject -Class SoftwareLicensingProduct | Where-Object PartialProductKey;
    [hashtable]$LicenseData = @{};

    foreach ($license_properties in $LicenseInformation) {
        $lic_datails = @{};
        foreach($license in $license_properties.Properties) {
            $lic_datails.Add($license.Name, $license.Value);
        }
        $LicenseData.Add($lic_datails.ID, $lic_datails);
    }

    return $LicenseData;
}
