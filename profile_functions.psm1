function Compare-Hash {
		param (
			[parameter(Mandatory=$true)]
			[string]$algorithm,
			[string]$provided_hash,
			[string]$filename)
		$calculated = Get-FileHash $filename -a $algorithm
		Write-Host "`nFile hashed is" $calculated.Path
		Write-Host "Hash is" $calculated.Hash
		Write-Host "Hash algorithm is" $calculated.Algorithm
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
