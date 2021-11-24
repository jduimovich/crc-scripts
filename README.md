
CRC scripts

Scripts for CRC providing setup and login with CRC and ArgoCD. Each command has a windows (.cmd) equivalent 

# crcx
Starts crc, puts the kubeadmin password in clipboard and takes you to the console.
This is the default start and login flow for crc with the password ready to paste into the password prompt in the browser. 

# crck
Login to crc as kubeadmin, place password in clipboard for easy login to console. Same flow as crcx without a crc start. 

# crcpw
Echo the password for kubeadmin and place in clipboard for easy login to console.
When CRC prompts for the kubeadmin password, open a shell run crcpw and paste in the window. 
Same flow as crck, except no login in the cli. Use when you need to login as kubeadmin in the console but want to leave your shell / cli as whatever user you were already logged in. 

# crcd
Login to CRC as developer, no clipboard changes.  
 
# argopw
Echo the password for argo admin user and place in clipboard for easy login to console
When CRC prompts for the kubeadmin password, open a shall run crcpw and paste in the window. 


