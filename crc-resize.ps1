
crc stop
Resize-VHD -Path  $HOME\.crc\machines\crc\crc.vhdx -SizeBytes 200GB
 
Get-VHD  -Path  $HOME\.crc\machines\crc\crc.vhdx

crc start