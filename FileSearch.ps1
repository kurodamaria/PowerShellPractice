# This script searches for files with given extension in a directory and its subdirectories.

$folder = Read-Host "Enter the folder path"
$extension = Read-Host "Enter the extension"

Get-ChildItem -Path $folder -Recurse -Filter *.$extension | ForEach-Object -Process { Write-Host $_.FullName }