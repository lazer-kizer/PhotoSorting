function UpdateGroupForPhotosInfoArray {
    param (
        $photosInfo
    )
 
    for($i = 0; $i -lt $photosInfo.Count - 1; $i++) {
        $diff = New-TimeSpan -Start $photosInfo[$i].Date -End $photosInfo[$i + 1].Date
    
        if ([math]::Abs($diff.TotalMinutes) -le 10) {
            $photosInfo[$i + 1].Group = $photosInfo[$i].Group
        } else {
            $photosInfo[$i + 1].Group = $photosInfo[$i].Group + 1
        }
    }
}