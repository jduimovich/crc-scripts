echo %~dp0 
crc stop
powershell.exe -File %~dp0\crc-resize.ps1
crc start