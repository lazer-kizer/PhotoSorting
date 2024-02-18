. "$PSScriptRoot\FolderHelpers\GetFolderItemsCount.ps1"
. "$PSScriptRoot\FolderHelpers\RenameFolderWithGuid.ps1"
. "$PSScriptRoot\FolderHelpers\GetFolderItemsDateRange.ps1"

function CollectInfoFromFoldersAndRename {
    param (
        $foldersPath, $resultFilePath
    )

    $folders = Get-ChildItem -Path $foldersPath

    $sb = [System.Text.StringBuilder]::new();
    foreach($folder in $folders) {
        $photosCount = GetFolderItemsCount $folder.FullName
        
        # Commit changes
        # Create separate function
        $minDate, $maxDate = GetFolderItemsDateRange $folder.FullName
        $dateForCSV = ";;"
        if ($null -ne $minDate -and $null -ne $maxDate) {
            $formattedMinDate = $minDate.ToString("yyyy.MM.dd")
            $formattedMaxDate = $maxDate.ToString("yyyy.MM.dd")
            if ($formattedMinDate -eq $formattedMaxDate) {
                $dateForCSV = "$formattedMinDate;;"            
            } else {
                $dateForCSV = ";$formattedMinDate;$formattedMaxDate"
            }
        }

        # $oldName, $newName = RenameFolderWithGuid $folder.FullName
        
        $sb.AppendLine("$newName;$photosCount;$dateForCSV;$oldName") | Out-Null
    } 

    $date = Get-Date
    $fileName = "CollectingInfo_$($date.Ticks).csv"
    New-Item -Path $resultFilePath -Name $fileName | Out-Null
    Add-Content -Path "$resultFilePath\$fileName" -Value $sb.ToString() | Out-Null
}

CollectInfoFromFoldersAndRename C:\Users\Andrei\Desktop\test-1 C:\Users\Andrei\Desktop