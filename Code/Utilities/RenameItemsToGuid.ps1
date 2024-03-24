function RenameItemsToGuid {
    param ( [string]$parentFolder, [bool]$applyOnlyForFolders = $true)

    $items = Get-ChildItem $parentFolder

    foreach ($item in $items) {

        $isFolder = Test-Path -Path $item.FullName -Type Container

        if (-not $applyOnlyForFolders -or $isFolder) {

            $newGuid = [System.Guid]::NewGuid().ToString()
            Rename-Item -Path $item.FullName -NewName $newGuid
        }
    }
}