@echo off

kubectl get secret openshift-gitops-cluster -n openshift-gitops -ojsonpath='{.data.admin\.password}' > b64.txt

set /P DATAQ=< b64.txt
Set DATA=%DATAQ:'=% 
echo %DATA% > b64.txt
certutil -decode b64.txt data.txt > nul
set /P ARGOPW=< data.txt 
del  b64.txt data.txt 
echo password is %ARGOPW% and is in your clipboard
echo|set /p=%ARGOPW%| clip

 
argocd login openshift-gitops-server-openshift-gitops.apps-crc.testing --insecure --grpc-web --username admin --password %ARGOPW%
