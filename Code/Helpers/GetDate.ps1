function GetDate {
    param (
        $fullName
    )
    
    $fullName -match '\d{8}_\d{6}' | Out-Null
    $datePartString = $Matches[0]
    return [datetime]::ParseExact($datePartString, 'yyyyMMdd_HHmmss', $null)
}