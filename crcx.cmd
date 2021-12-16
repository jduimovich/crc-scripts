@echo off 


echo crc start -p %~dp0pull-secret.txt --disk-size 100
crc start   -p   %~dp0pull-secret.txt --disk-size 100

FOR /f "tokens=*" %%i IN ('crc oc-env') DO @call %%i 

rem CRC does no honour disk request so this manual first time
rem in POWERSHELL FFS Resize-VHD -Path C:\Users\jduim\.crc\machines\crc\crc.vhdx -SizeBytes 200GB

crc console --credentials  -o json  | jq .clusterConfig.adminCredentials.password >crc.info
set /P LOGINQ=< crc.info
del crc.info
Set LOGIN=%LOGINQ:"=%

crc console --credentials  -o json  | jq  .clusterConfig.url >crc.info
set /P URLQ=< crc.info
del crc.info
Set URL=%URLQ:"=%

oc login --insecure-skip-tls-verify=true -u kubeadmin -p %LOGIN% %URL% 

call crcpw.cmd		 
crc console 

crc status | grep Disk 
echo "If memory is too small, resize the vm using powershell"
echo "Resize-VHD -Path %HOMEDRIVE%%HOMEPATH%\.crc\machines\crc\crc.vhdx -SizeBytes 200GB"
