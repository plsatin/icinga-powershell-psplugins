
# Invoke-IcingaSoftwareLicensingProduct

## Description

Get Software licensing product status

The script returns ok warning or critical depending on the status of the license. Also returns the total number of licensed software products. To obtain data, use the SoftwareLicensingProduct class. More Information on https://docs.microsoft.com/en-us/previous-versions/windows/desktop/sppwmi/softwarelicensingproduct

## Arguments

| Argument | Type | Required | Default | Description |
| ---      | ---  | ---      | ---     | ---         |
| ProductFilter | Array | false |  | The parameter is used to filter software products. |
| NoPerfData | SwitchParameter | false | False |  |
| Verbosity | Int32 | false | 3 |  |

## Examples

### Example Command 1

```powershell
Invoke-IcingaSoftwareLicensingProduct
```

### Example Output 1

```powershell
[OK] Check package "SoftwareLicensingProduct" (Match All)\_ [OK] - Total licenses: 3\_ [OK] Office 15, OfficeProPlusVL_KMS_Client edition (Volume:GVLK): Licensed: 1\_ [OK] Office 15, OfficeVisioProVL_KMS_Client edition (Volume:GVLK): Licensed: 1\_ [OK] Windows(R), ServerStandard edition (Volume:GVLK): Licensed: 1
```
