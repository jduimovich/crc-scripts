@echo off
rem clean daemon 
rem taskkill /IM crc.exe /F /FI "STATUS eq RUNNING"
rem start /min crc.exe daemon
rem timeout /t 2

FOR /f "tokens=*" %%i IN ('crc oc-env') DO @call %%i


echo crc start -p %~dp0pull-secret.txt
crc start   -p   %~dp0pull-secret.txt
 
crc console --credentials  -o json  | jq .clusterConfig.adminCredentials.password >crc.info
set /P LOGINQ=< crc.info
del crc.info
Set LOGIN=%LOGINQ:"=%

crc console --credentials  -o json  | jq  .clusterConfig.url >crc.info
set /P URLQ=< crc.info
del crc.info
Set URL=%URLQ:"=%

oc login --insecure-skip-tls-verify=true -u kubeadmin -p %LOGIN% %URL%
rem oc login --insecure-skip-tls-verify=true --token=%LOGIN% --server=%URL% 

call crcpw.cmd		 
crc console 