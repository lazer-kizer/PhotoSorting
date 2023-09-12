function RenameFoldersWithGuid {
    param (
        $pathToFolders
    )
    
    $folders = Get-ChildItem $pathToFolders

    foreach ($folder in $folders) {
        $guid = [guid]::NewGuid().ToString();
        Rename-Item -LiteralPath $folder.FullName -NewName $guid
    }
}