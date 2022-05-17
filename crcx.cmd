@echo off 
rem start, login a kubeadmin, get the pw for console login
echo crc start -p %~dp0pull-secret.txt --disk-size 200
crc start   -p   %~dp0pull-secret.txt --disk-size 200

FOR /f "tokens=*" %%i IN ('crc oc-env') DO @call %%i 

call crck.cmd		
call crcpw.cmd		 
crc console 

crc status | grep Disk 
echo "If memory is too small, resize the vm using powershell"
echo "Resize-VHD -Path %HOMEDRIVE%%HOMEPATH%\.crc\machines\crc\crc.vhdx -SizeBytes 200GB"
