function RenameFolderWithGuid {
    param (
        $folderPath
    )

    $folder = Get-Item $folderPath
    
    $newName = New-Guid
    $oldName = $folder.Name

    Rename-Item -NewName $newName -LiteralPath $folderPath
    return $oldName, $newName
}