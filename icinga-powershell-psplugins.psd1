@{
    ModuleVersion     = '1.0.0'
    RootModule        = 'icinga-powershell-psplugins.psm1'
    GUID              = '9a4f0652-2908-42c2-be5d-fb315a47a49f'
    Author            = 'Pavel Satin'
    CompanyName       = ''
    Copyright         = '(c) 2021 Pavel Satin | GPL v2.0'
    Description       = ''
    PowerShellVersion = '4.0'
    RequiredModules   = @(
        @{ ModuleName = 'icinga-powershell-framework'; ModuleVersion = '1.7.0'; }
    )
    NestedModules     = @(
        '.\plugins\Invoke-IcingaCheckDiskStatus.psm1',
        '.\plugins\Invoke-IcingaSoftwareLicensingProduct.psm1',
        '.\provider\enums\Icinga_PSProviderEnums.psm1',
        '.\provider\license\Icinga_ProviderLicense.psm1',
        '.\provider\license\Show-IcingaSoftwareLicensingProductData.psm1'
    )
    FunctionsToExport = @( '*' )
    CmdletsToExport   = @( '*' )
    VariablesToExport = @( '*' )
    AliasesToExport   = @( '*' )
    PrivateData       = @{
        PSData   = @{
            Tags         = @( 'psplugins' )
            LicenseUri   = ''
            ProjectUri   = ''
            ReleaseNotes = ''
        };
        Version  = 'v1.0.0'
        Name     = 'Windows psplugins';
        Type     = 'plugins';
        Function = '';
        Endpoint = '';
    }
    HelpInfoURI       = ''
}

