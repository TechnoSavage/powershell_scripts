
function Photo-Folders{
  param([parameter(Mandatory=$true)]
        [string]$Path,
        [string]$Year)
  If (!(Test-Path -Path $Path)) {
    $affirmative = 'y', 'yes'
    $response = Read-Host "$Path does not exist. Create it now? [y/n]"
    If ($affirmative -contains $response) {
      New-Item $Path -ItemType Directory
      Write-Host 'I executed'
    }
  }
  Set-Location $Path
  New-Item -Name $Year -ItemType Directory
  $month_range = (1..12)
  $Months = @()
  $day_range = (1..31)
  $Days = @()
  foreach ($month in $month_range) {
    If ($month.tostring().length -eq 1) {
    $sorted = '0' + [string]$month
    $Months += $sorted
    }
    Else {$Months += [string]$month}
  }
  foreach ($day in $day_range) {
    If ($day.tostring().length -eq 1) {
    $sorted = '0' + [string]$day
    $Days += $sorted
    }
    Else {$Days += [string]$day}
  }
  foreach ($Month in $Months) {
    New-Item -Path $Year\ -Name $Month -ItemType Directory
    foreach ($Day in $Days) {
      New-Item -Path $Year\$Month\ -Name $Day -ItemType Directory
    }
  }
  Remove-Item "$Year\02\29"
  Remove-Item "$Year\02\30"
  Remove-Item "$Year\02\31"
  Remove-Item "$Year\04\31"
  Remove-Item "$Year\06\31"
  Remove-Item "$Year\09\31"
  Remove-Item "$Year\11\31"
}
