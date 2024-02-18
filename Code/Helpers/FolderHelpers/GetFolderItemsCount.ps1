function GetFolderItemsCount {
    param (
        $folderPath
    )

    $items = Get-ChildItem $folderPath

    if ($null -eq $items) {
        $itemsCount = 0
    }
    elseif ($items.GetType().FullName -eq "System.IO.FileInfo") {
        $itemsCount = 1
    }
    elseif ($items.GetType().FullName -eq "System.Object[]") { 
        $itemsCount = $items.Length 
    };
    
    return $itemsCount
}