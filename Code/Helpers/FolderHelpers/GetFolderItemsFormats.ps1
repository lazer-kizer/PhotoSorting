function GetFolderItemsFormats {
    param (
        $folderPath
    )

    $formats = New-Object System.Collections.Generic.HashSet[string]

    $items = Get-ChildItem $folderPath

    foreach ($item in $items){
        $formats.Add($item.Extension)
    }
    
    return $formats
}

GetFolderItemsFormats C:\Users\Andrei\Desktop\test