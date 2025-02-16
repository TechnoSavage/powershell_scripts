#Powershell functions to make life easier

#Function to streamline validating hashes and checksums
function Test-Hashes {
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
#Little function to make opening file in vim a bit quicker
function vim {
	param (
		[parameter(Mandatory=$true)]
		[string]$filename
	)
	bash -c "vim $filename"
}
