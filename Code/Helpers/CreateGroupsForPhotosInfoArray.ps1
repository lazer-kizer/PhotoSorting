function CreateGroupsForPhotosInfoArray {
    param (
        $photosInfo, $rootPath
    )
 
    for ($i = 1; $i -le $photosInfo[$photosInfo.Count-1].Group; $i++) {
        New-Item -ItemType Directory -Path "$rootPath\$i" | Out-Null
    }
}