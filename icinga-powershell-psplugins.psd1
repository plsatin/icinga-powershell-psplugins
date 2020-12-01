@{
    ModuleVersion = '0.0.1'
    GUID = 'b4b6e84f-fc6a-4868-bafb-004cbb58c438' # Сгенерировать GUID
    RootModule        = 'icinga-powershell-psplugins.psm1'
    # ModuleToProcess = 'icinga-powershell-psplugins.psm1'
    Author = 'Pavel Satin'
    CompanyName = 'Pavel Satin'
    Copyright = '(c) 2019 Pavel Satin'
    Description = 'A collection of Icinga PowerShell for the Icinga PowerShell Framework'
    PowerShellVersion = '4.0'
    RequiredModules = @( 'icinga-powershell-framework' )
    FunctionsToExport = @('*')
    CmdletsToExport = @('*')
    VariablesToExport = '*'
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @( 'icinga', 'icinga2', 'icinga 2', 'monitoring plugins', 'icinga plugins', 'icinga 2 plugins')
            LicenseUri = 'https://github.com/plsatin/icinga-powershell-psplugins/blob/master/LICENSE'
            ProjectUri = 'https://github.com/plsatin/icinga-powershell-psplugins'
            ReleaseNotes = 'https://github.com/plsatin/icinga-powershell-psplugins/releases'
        };
        Version = 'v0.0.1';
    }
    HelpInfoURI = 'https://github.com/plsatin/icinga-powershell-psplugins'
}
