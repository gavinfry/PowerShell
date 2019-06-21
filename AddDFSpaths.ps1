#Import-CSV of DFS path and target path

$path     = Split-Path -parent $MyInvocation.MyCommand.Definition 
$newpath  = $path + "\DFSpath-test.csv"
$csv      = @()
$csv      = Import-Csv -Path $newpath

#Loop through items in the CSV
ForEach ($item In $csv)
{
#Add the DFS paths and mark as online
Set-DfsnFolderTarget -path $item.Path -TargetPath $item.TargetPath -State Online
}
