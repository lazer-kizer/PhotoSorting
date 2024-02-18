function GetFileDateTaken {
    param (
        $filePath
    )

    $file = Get-Item $filePath
    $shellObject = New-Object -ComObject Shell.Application
    $directoryObject = $shellObject.NameSpace($file.Directory.FullName)
    $fileObject = $directoryObject.ParseName($file.Name)

    $dateTakenString = $mediaCreatedString = $date = $null
    for ($index = 0; $null -eq $dateTakenString -or $null -eq $mediaCreatedString; $index++) { 
        if ($directoryObject.GetDetailsOf($directoryObject.Items, $index) -eq "Date taken") {
            $dateTakenString = $directoryObject.GetDetailsOf($fileObject, $index)
            $dateTakenString = [System.Text.RegularExpressions.Regex]::Replace($dateTakenString,"\p{C}+",'')
            
            if(-not [System.String]::IsNullOrEmpty($dateTakenString)) {
                $date = [datetime]::ParseExact($dateTakenString, "M/d/yyyy h:mm tt", $null)
            }
        }

        if ($directoryObject.GetDetailsOf($directoryObject.Items, $index) -eq "Media created") {
            $mediaCreatedString = $directoryObject.GetDetailsOf($fileObject, $index)
            $mediaCreatedString = [System.Text.RegularExpressions.Regex]::Replace($mediaCreatedString,"\p{C}+",'')

            if(-not [System.String]::IsNullOrEmpty($mediaCreatedString)) {
                $date = [datetime]::ParseExact($mediaCreatedString, "M/d/yyyy h:mm tt", $null)
            }
        }
    } 
    
    return $date
}