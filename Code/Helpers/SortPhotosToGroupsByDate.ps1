. "$PSScriptRoot\GetSortedPhotosInfoArray.ps1"
. "$PSScriptRoot\UpdateGroupForPhotosInfoArray.ps1"
. "$PSScriptRoot\CreateGroupsForPhotosInfoArray.ps1"

function SortPhotosToGroupsByDate {
    param (
        $pathToPhotos, $pathToGroups
    )

    $photosInfo = GetSortedPhotosInfoArray $pathToPhotos

    UpdateGroupForPhotosInfoArray $photosInfo

    if (-Not (Test-Path "$pathToGroups\*")) {
        CreateGroupsForPhotosInfoArray $photosInfo $pathToGroups
    }

    foreach($photoInfo in $photosInfo) {
        Copy-Item -LiteralPath "$pathToPhotos\$($photoInfo.Name)" -Destination "$pathToGroups\$($photoInfo.Group)"
    }
}