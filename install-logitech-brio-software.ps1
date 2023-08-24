$path = "C:\temp\LogiTune"
If(!(test-path -PathType container $path))
{
      New-Item -ItemType Directory -Path $path
}

# version 3.3.32 - 2023-07-11
curl https://software.vc.logitech.com/downloads/tune/LogiTuneInstall.exe --output $path\LogiTuneInstall.exe

Start-Process "$path\LogiTuneInstall.exe" -Wait

Remove-Item -Path $path -Force -Recurse