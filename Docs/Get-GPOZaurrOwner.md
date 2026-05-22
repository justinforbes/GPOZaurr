---
external help file: GPOZaurr-help.xml
Module Name: GPOZaurr
online version: https://github.com/EvotecIT/GPOZaurr
schema: 2.0.0
---
# Get-GPOZaurrOwner
## SYNOPSIS
Gets owners of GPOs from Active Directory and SYSVOL

## SYNTAX
### Default (Default)
```powershell
Get-GPOZaurrOwner [-IncludeSysvol] [-SkipBroken] [-Forest <string>] [-ExcludeDomains <string[]>] [-IncludeDomains <string[]>] [-ExtendedForestInformation <IDictionary>] [-ADAdministrativeGroups <IDictionary>] [-ApprovedOwner <string[]>] [<CommonParameters>]
```

### GPOName
```powershell
Get-GPOZaurrOwner [-GPOName <string>] [-IncludeSysvol] [-SkipBroken] [-Forest <string>] [-ExcludeDomains <string[]>] [-IncludeDomains <string[]>] [-ExtendedForestInformation <IDictionary>] [-ADAdministrativeGroups <IDictionary>] [-ApprovedOwner <string[]>] [<CommonParameters>]
```

### GPOGUID
```powershell
Get-GPOZaurrOwner [-GPOGuid <string>] [-IncludeSysvol] [-SkipBroken] [-Forest <string>] [-ExcludeDomains <string[]>] [-IncludeDomains <string[]>] [-ExtendedForestInformation <IDictionary>] [-ADAdministrativeGroups <IDictionary>] [-ApprovedOwner <string[]>] [<CommonParameters>]
```

## DESCRIPTION
Gets owners of GPOs from Active Directory and SYSVOL

## EXAMPLES

### EXAMPLE 1
```powershell
PS > Get-GPOZaurrOwner -Verbose -IncludeSysvol
```


### EXAMPLE 2
```powershell
PS > Get-GPOZaurrOwner -Verbose -IncludeSysvol -SkipBroken
```


## PARAMETERS

### -ADAdministrativeGroups
Ability to provide AD Administrative Groups from another command to speed up processing

```yaml
Type: IDictionary
Parameter Sets: Default, GPOName, GPOGUID
Aliases:
Possible values:

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ApprovedOwner
Ability to provide different owner (non administrative that still is approved for use)

```yaml
Type: String[]
Parameter Sets: Default, GPOName, GPOGUID
Aliases: Exclusion, Exclusions
Possible values:

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ExcludeDomains
Exclude domain from search, by default whole forest is scanned

```yaml
Type: String[]
Parameter Sets: Default, GPOName, GPOGUID
Aliases:
Possible values:

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ExtendedForestInformation
Ability to provide Forest Information from another command to speed up processing

```yaml
Type: IDictionary
Parameter Sets: Default, GPOName, GPOGUID
Aliases:
Possible values:

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Forest
Target different Forest, by default current forest is used

```yaml
Type: String
Parameter Sets: Default, GPOName, GPOGUID
Aliases: ForestName
Possible values:

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -GPOGuid
GUID of GPO. By default all GPOs are returned

```yaml
Type: String
Parameter Sets: GPOGUID
Aliases: GUID, GPOID
Possible values:

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -GPOName
Name of GPO. By default all GPOs are returned

```yaml
Type: String
Parameter Sets: GPOName
Aliases:
Possible values:

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -IncludeDomains
Include only specific domains, by default whole forest is scanned

```yaml
Type: String[]
Parameter Sets: Default, GPOName, GPOGUID
Aliases: Domain, Domains
Possible values:

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -IncludeSysvol
Includes Owner from SYSVOL as well

```yaml
Type: SwitchParameter
Parameter Sets: Default, GPOName, GPOGUID
Aliases:
Possible values:

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -SkipBroken
Doesn't display GPOs that have no SYSVOL content (orphaned GPOs)

```yaml
Type: SwitchParameter
Parameter Sets: Default, GPOName, GPOGUID
Aliases:
Possible values:

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

- `None`

## OUTPUTS

- `None`

## RELATED LINKS

- None
