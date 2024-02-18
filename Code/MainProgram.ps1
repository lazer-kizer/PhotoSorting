# NOTE the folders should exists
. "$PSScriptRoot\Helpers\SortPhotosToGroupsByDate.ps1"
. "$PSScriptRoot\Helpers\RenameFoldersWithGuid.ps1"
. "$PSScriptRoot\Helpers\CollectInfoFromGroups.ps1"
. "$PSScriptRoot\Helpers\CollectInfoFromFoldersAndRename.ps1"

# settings
$pathToPhotos = "D:\VideoSorting2\Unsorted"
$pathToGroups = "D:\VideoSorting2\Sorted"
$pathToInfoFile = "D:\VideoSorting2"
$movePhoto = $true

Write-Host 'START' -ForegroundColor Green

if ($movePhoto) {
    SortPhotosToGroupsByDate $pathToPhotos $pathToGroups
    RenameFoldersWithGuid $pathToGroups
}

CollectInfoFromGroups $pathToGroups $pathToInfoFile

Write-Host 'END' -ForegroundColor Green