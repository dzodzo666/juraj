Get-ChildItem "C:\Users\psychonaut\Pictures\Exported Videos\" -Name | ForEach-Object {
  C:\Utils\ffmpeg\bin\ffmpeg -i "C:\Users\psychonaut\Pictures\Exported Videos\$_" -vcodec libx265 "C:\Users\psychonaut\Pictures\Exported Videos\c265_$_"
}