using namespace System.Net
param($Request, $TriggerMetadata)

[void](Import-Module Pswritehtml -Force)
$getempdata = Get-Content C:\Projects\newcontoso\database\employees.json | ConvertFrom-Json

$body = New-HTML -TitleText "Identity" {
    New-HTMLSection -HeaderText '<h1>Test</h1>' {
        New-HTMLContent -HeaderText "Biswajit" -CanCollapse -HeaderTextColor Black -HeaderBackGroundColor PaleGoldenrod {
            New-HTMLTable -Title "Copper" -DataTable $getempdata -HideFooter -PagingOptions @(50, 100, 500, 1000) {
                #TableConditionalFormatting -Name 'KerbType' -ComparisonType number -Operator eq -Value 0x12 -Color Black -BackgroundColor PaleGreen
                #TableConditionalFormatting -Name 'KerbType' -ComparisonType string -Operator eq -Value '0xffffffff' -Color White -BackgroundColor Red
                #TableConditionalFormatting -Name 'KerbType' -ComparisonType number -Operator eq -Value 0x17 -Color Black -BackgroundColor Orange
            
            } 
        }
        
    }

}
# Associate values to output bindings by calling 'Push-OutputBinding'.
Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
        headers    = @{'content-type' = 'text/html' }
        StatusCode = [httpstatuscode]::OK
        Body       = $body
    })
