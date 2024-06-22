$paths=$args[0]
write-host $paths
Get-ChildItem "$paths" -Name

Get-ChildItem "$paths" -Name | ForEach-Object -Begin { Start-Sleep -s 10 } -Process { C:\Utils\ffmpeg\bin\ffmpeg -i "$paths\$_" -c:v libx265 "$paths\c265_$_.mkv" } -End { Start-Sleep -s 10 }