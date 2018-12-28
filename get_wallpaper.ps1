Write-Host "`nThis script will append .jpg to all files in a specified directory
and discard any images smaller than 1920x1080 in size.`n"
[string]$folder = Read-Host 'Enter the path to the directory [C:\Users\*youruser*\Desktop\New folder]'
If ($folder -eq "") {
  $folder = "C:\Users\$env:Username\Desktop\New folder"
}
$exists = Test-Path $folder
If ($exists) {
  Set-Location $folder
  $file_list = Get-ChildItem
  Write-Host $file_list
  [string]$confirm = Read-Host 'Are these the files you wish to retrieve wallpaper from? [y/n]'
  If ('y', 'yes' -contains $confirm.ToLower()) {
    foreach ($item in $file_list) {
      $old_name = $item.Name
      $new_name = $item.Name + '.jpg'
      Rename-Item $old_name $new_name
    }
    $(Get-ChildItem -Filter *.jpg).FullName | ForEach-Object {
      [void][reflection.assembly]::loadwithpartialname("system.drawing")
      $img = [Drawing.Image]::FromFile($_)
      $dimensions = [string]$img.Width + ' x ' + [string]$img.Height
      If ($dimensions -ne "1920 x 1080") {
        Remove-Item $_
      }
    }
  }
  Else {Write-Host 'No changes were made.'}
}
Else {Write-Host 'That directory does not exist'}
