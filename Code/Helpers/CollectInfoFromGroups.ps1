. "$PSScriptRoot\GetDate.ps1"

function CollectInfoFromGroups {
    param (
        $groupsPath, $infoFilePath
    )

    $folders = Get-ChildItem -Path $groupsPath

    $sb = [System.Text.StringBuilder]::new();

    foreach($folder in $folders) {

        $photos = Get-ChildItem $folder.FullName

        # Append name
        $sb.Append($folder.Name).Append("`t") | Out-Null

        # Append count
        $photosCount = 1
        if ($photos.GetType().FullName -eq "System.Object[]") { 
            $photosCount =  $photos.Length 
        };
        $sb.Append($photosCount).Append("`t") | Out-Null

        # Append date
        if ($photosCount -eq 1) {
            $photoName = $photos.Name
        } else {
            $photoName = $photos[0].Name
        }
        $date = GetDate $photoName
        $sb.Append($date.ToString("yyyy.MM.dd")).Append("`t") | Out-Null
        
        # Append empty range
        $sb.Append("`t`t") | Out-Null

        # Append photo tag
        foreach($photo in $photos){
            if($photo.Name.StartsWith("IMG")) {
                $sb.Append("photo ") | Out-Null
                break;
            }
        }

        # Append video tag
        foreach($photo in $photos){
            if($photo.Name.StartsWith("VID")) {
                $sb.Append("video ") | Out-Null
                break;
            }
        }

        $sb.AppendLine() | Out-Null
    } 

    # Save into file
    $fileName = "ColleсtingInfo.txt"
    if (-Not (Test-Path -Path "$infoFilePath\$fileName" -PathType Leaf)) {
        New-Item -Path $infoFilePath -Name $fileName | Out-Null
    }
    Add-Content -Path "$infoFilePath\$fileName" -Value $sb.ToString() | Out-Null
}