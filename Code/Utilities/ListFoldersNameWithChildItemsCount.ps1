function ListFoldersNameWithChildItemsCount {
    param ( [string]$parentFolder)

    $items = Get-ChildItem $parentFolder

    $result = [System.Text.StringBuilder]::new()

    foreach ($item in $items) {

        $filesCount = (Get-ChildItem $item.FullName | Measure-Object).Count

        $isFolder = Test-Path -Path $item.FullName -Type Container

        if ($isFolder) {
            $result.Append($item.Name) | Out-Null
            $result.Append("`t") | Out-Null
            $result.AppendLine($filesCount) | Out-Null
        }
    }

    return $result.ToString()
}