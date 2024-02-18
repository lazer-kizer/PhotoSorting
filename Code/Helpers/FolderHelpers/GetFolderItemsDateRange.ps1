. "$PSScriptRoot\..\PhotoHelpers\GetFileDateTaken.ps1"

function GetFolderItemsDateRange {
    param (
        $folderPath
    )

    $dates = [System.Collections.ArrayList]::new()
    $items = Get-ChildItem $folderPath

    foreach($item in $items) {
        $itemDate = GetFileDateTaken $item.FullName
        $dates.Add($itemDate.Date) | Out-Null
    }
    
    $dates.Sort()
   
    return $dates[0], $dates[-1]
}