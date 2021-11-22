
@echo off
crc console --credentials  -o json  | jq .clusterConfig.adminCredentials.password >openshift.login.token
set /P LOGINQ=< openshift.login.token
del openshift.login.token
Set LOGIN=%LOGINQ:"=%
echo "The login token for kubeadmin is in the paste buffer"
echo|set /p=%LOGIN%| clip
echo /%LOGIN%/

oc login --insecure-skip-tls-verify=true -u kubeadmin -p %LOGIN% %URL%