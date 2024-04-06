
crc stop
Resize-VHD -Path  $HOME\.crc\machines\crc\crc.vhdx -SizeBytes 512GB
 
Get-VHD  -Path  $HOME\.crc\machines\crc\crc.vhdx

crc start