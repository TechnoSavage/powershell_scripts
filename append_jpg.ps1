Write-Host "`nThis script will append .jpg to all files in a specified directory.`n"
[string]$folder = Read-Host 'Enter the path to the directory [C:\Users\*youruser*\Desktop\New folder]'
If ($folder -eq "") {
  $folder = "C:\Users\$env:Username\Desktop\New folder"
}
$exists = Test-Path $folder
If ($exists) {
  Set-Location $folder
  $file_list = Get-ChildItem
  Write-Host $file_list
  [string]$confirm = Read-Host 'Are these the files you wish to change the file extension for? [y/n]'
  If ('y', 'yes' -contains $confirm.ToLower()) {
    foreach ($item in $file_list) {
      $old_name = $item.Name
      $new_name = $item.Name + '.jpg'
      Rename-Item $old_name $new_name
    }
  }
  Else {Write-Host 'No changes were made.'}
}
Else {Write-Host 'That directory does not exist'}
