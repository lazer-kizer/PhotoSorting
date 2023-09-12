# NOTE the folders should exists
. "$PSScriptRoot\Helpers\SortPhotosToGroupsByDate.ps1"
. "$PSScriptRoot\Helpers\RenameFoldersWithGuid.ps1"
. "$PSScriptRoot\Helpers\CollectInfoFromGroups.ps1"

# settings
$pathToPhotos = "$PSScriptRoot\..\Camera"
$pathToGroups = "$PSScriptRoot\..\Groups"
$movePhoto = $false

Write-Host 'START' -ForegroundColor Green

if ($movePhoto) {
    SortPhotosToGroupsByDate $pathToPhotos $pathToGroups
    RenameFoldersWithGuid $pathToGroups
}

CollectInfoFromGroups $pathToGroups "$PSScriptRoot"

Write-Host 'END' -ForegroundColor Green