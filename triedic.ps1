$files = New-Object System.Collections.ArrayList
$files.Clear()

ls -Recurse -Path .\unsorted | % {
	if($_.Attributes -ne "Directory") {
		$files.Add($_.FullName) > $null
	}
}

$dirnum = 1
$filesindir = 0
mkdir $dirnum

do {
	$filecount = $files.Count
	$file = Random($filecount)
	Copy-Item $files[$file] $dirnum > $null
	$files.RemoveAt($file)
	$filesindir = (ls $dirnum).Count
	if ($filesindir -eq 200) {
		$filesindir = 0
		$dirnum++
		mkdir $dirnum
	}
} while ($files.Count -gt 0)