﻿function Get-GPOZaurrPermissionConsistency {
    [cmdletBinding()]
    param(
        [Parameter(ParameterSetName = 'GPOName')][string] $GPOName,
        [Parameter(ParameterSetName = 'GPOGUID')][alias('GUID', 'GPOID')][string] $GPOGuid,
        [Parameter(ParameterSetName = 'Type')][validateSet('Consistent', 'Inconsistent', 'All')][string[]] $Type = 'All',
        [alias('ForestName')][string] $Forest,
        [string[]] $ExcludeDomains,
        [alias('Domain', 'Domains')][string[]] $IncludeDomains,
        [System.Collections.IDictionary] $ExtendedForestInformation,
        [switch] $IncludeGPOObject,
        [switch] $VerifyInside
    )
    Begin {
        $ForestInformation = Get-WinADForestDetails -Forest $Forest -IncludeDomains $IncludeDomains -ExcludeDomains $ExcludeDomains -ExtendedForestInformation $ExtendedForestInformation
    }
    Process {
        foreach ($Domain in $ForestInformation.Domains) {
            $QueryServer = $ForestInformation['QueryServers'][$Domain]['HostName'][0]
            if ($GPOName) {
                $getGPOSplat = @{
                    Name        = $GPOName
                    Domain      = $Domain
                    Server      = $QueryServer
                    ErrorAction = 'SilentlyContinue'
                }
            } elseif ($GPOGuid) {
                $getGPOSplat = @{
                    Guid        = $GPOGuid
                    Domain      = $Domain
                    Server      = $QueryServer
                    ErrorAction = 'SilentlyContinue'
                }
            } else {
                $getGPOSplat = @{
                    All         = $true
                    Domain      = $Domain
                    Server      = $QueryServer
                    ErrorAction = 'SilentlyContinue'
                }
            }
            Get-GPO @getGPOSplat | ForEach-Object -Process {
                try {
                    $IsConsistent = $_.IsAclConsistent()
                    $ErrorMessage = ''
                } catch {
                    $ErrorMessage = $_.Exception.Message
                    Write-Warning "Get-GPOZaurrPermissionConsistency - Failed to get consistency: $($_.Exception.Message)."
                    $IsConsistent = 'Not available.'
                }
                $SysVolpath = -join ('\\', $Domain, '\sysvol\', $Domain, '\Policies\{', $_.ID.GUID, '}')
                if ($VerifyInside) {
                    $FolderPermissions = Get-WinADSharePermission -Path $SysVolpath
                    [Array] $NotInheritedPermissions = foreach ($File in $FolderPermissions) {
                        if ($File.Path -ne $SysVolpath -and $File.IsInherited -eq $false) {
                            $File
                        }
                    }
                    if ($NotInheritedPermissions.Count -eq 0) {
                        $ACLConsistentInside = $true
                    } else {
                        $ACLConsistentInside = $false
                    }
                } else {
                    $ACLConsistentInside = $null
                }
                $Object = [ordered] @{
                    DisplayName         = $_.DisplayName     # : New Group Policy Object
                    DomainName          = $_.DomainName      # : ad.evotec.xyz
                    ACLConsistent       = $IsConsistent
                    ACLConsistentInside = $ACLConsistentInside
                    Owner               = $_.Owner           # : EVOTEC\Enterprise Admins
                    Path                = $_.Path
                    SysVolPath          = $SysvolPath
                    Id                  = $_.Id              # : 8a7bc515-d7fd-4d1f-90b8-e47c15f89295
                    GpoStatus           = $_.GpoStatus       # : AllSettingsEnabled
                    Description         = $_.Description     # :
                    CreationTime        = $_.CreationTime    # : 04.03.2020 17:19:42
                    ModificationTime    = $_.ModificationTime# : 06.05.2020 10:30:36
                    UserVersion         = $_.UserVersion     # : AD Version: 0, SysVol Version: 0
                    ComputerVersion     = $_.ComputerVersion # : AD Version: 1, SysVol Version: 1
                    WmiFilter           = $_.WmiFilter       # :
                    Error               = $ErrorMessage
                }
                if ($IncludeGPOObject) {
                    $Object['IncludeGPOObject'] = $_
                }
                if ($VerifyInside) {
                    $Object['ACLConsistentInsideDetails'] = $NotInheritedPermissions
                }
                [PSCustomObject] $Object
            }
        }
    }
    End {

    }
}