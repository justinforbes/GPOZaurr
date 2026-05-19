---
external help file: GPOZaurr-help.xml
Module Name: GPOZaurr
online version: https://github.com/EvotecIT/GPOZaurr
schema: 2.0.0
---
# Get-GPOZaurrWMI
## SYNOPSIS
Get Group Policy WMI filter

## SYNTAX
### __AllParameterSets
```powershell
Get-GPOZaurrWMI [[-Guid] <guid[]>] [[-Name] <string[]>] [[-Forest] <string>] [[-ExcludeDomains] <string[]>] [[-IncludeDomains] <string[]>] [[-ExtendedForestInformation] <IDictionary>] [-AsHashtable] [<CommonParameters>]
```

## DESCRIPTION
Get Group Policy WMI filter

## EXAMPLES

### EXAMPLE 1
```powershell
PS > Get-GPOZaurrWMI -AsHashtable
```


### EXAMPLE 2
```powershell
PS > Get-GPOZaurrWMI | Format-Table
```


## PARAMETERS

### -AsHashtable
Return output as hashtable

```yaml
Type: SwitchParameter
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -ExcludeDomains
Exclude domain from search, by default whole forest is scanned

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ExtendedForestInformation
Ability to provide Forest Information from another command to speed up processing

```yaml
Type: IDictionary
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Forest
Target different Forest, by default current forest is used

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: ForestName
Possible values: 

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Guid
Search for specific filter using GUID

```yaml
Type: Guid[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -IncludeDomains
Include only specific domains, by default whole forest is scanned

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: Domain, Domains
Possible values: 

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Name
Search for specific filter using Name

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 1
Default value: None
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

