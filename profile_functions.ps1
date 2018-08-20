$env:HostIP = ( `
	Get-NetIPConfiguration | `
	Where-Object { `
	$_.IPv4DefaultGateway -ne $null `
	-and `
	$_.NetAdapter.Status -ne "Disconnected" `
	} `
).IPv4Address.IPAddress

function Compare-Hash {
		param (
			[parameter(Mandatory=$true)]
			[string]$algorithm,
			[string]$provided_hash,
			[string]$filename)
		$calculated = Get-FileHash $filename -a $algorithm
		Write-Host $calculated
		Write-Host "Do hashes match: "
		$test = $provided_hash -eq $calculated.Hash
		Write-Host $test
}

function vim {
	param (
		[parameter(Mandatory=$true)]
		[string]$filename
	)
	bash -c "vim $filename"
}