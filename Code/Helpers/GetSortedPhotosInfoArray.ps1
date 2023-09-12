. "$PSScriptRoot\GetDate.ps1"

Write-Output $PSScriptRoot

function GetSortedPhotosInfoArray {
    param (
        $pathToPhotos
    )
 
    $photos = Get-ChildItem $pathToPhotos 
    $photosInfo = New-Object System.Collections.ArrayList
    foreach($photo in $photos){
        $date = GetDate $photo.Name
        $photosInfo.Add(@{Name=$photo.Name; Date=$date; Group=1}) | Out-Null
    }
    $photosInfo = $photosInfo | Sort-Object -Property { $_['Date'] }

    $photosInfo
}