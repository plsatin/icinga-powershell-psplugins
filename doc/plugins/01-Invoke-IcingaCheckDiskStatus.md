
# Invoke-IcingaCheckDiskStatus

## Description

Checks Disk Drive status

Invoke-IcingaCheckDiskStatus returns either 'OK', 'WARNING' or 'CRITICAL'

## Arguments

| Argument | Type | Required | Default | Description |
| ---      | ---  | ---      | ---     | ---         |
| NoPerfData | SwitchParameter | false | False |  |
| Verbosity | Int32 | false | 3 |  |

## Examples

### Example Command 1

```powershell
Invoke-IcingaCheckDiskStatus -NoPerfData
```

### Example Output 1

```powershell
[OK] Check package "Disk Drives Status" (Match All)\_ [OK] Disk Drive "\\.\PHYSICALDRIVE0" (WDC WD10EZRZ-00Z5HB0): 0\_ [OK] Disk Drive "\\.\PHYSICALDRIVE1" (WDC WD1003FBYX-01Y7B0): 0\_ [OK] Disk Drive "\\.\PHYSICALDRIVE2" (WDC WD1002FBYS-02A6B0): 0\_ [OK] Disk Drive "\\.\PHYSICALDRIVE3" (WDC WD1003FBYX-01Y7B0): 0
```
