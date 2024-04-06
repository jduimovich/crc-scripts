#!/bin/bash


SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

shopt -s extglob

OS=$(uname -a)
PROGRAM="" 
case "$OS" in 
*microsoft*) PROGRAM="powershell.exe" ;; 
esac

if [ -z ${PROGRAM} ]; then
    echo "No resize needed on this platform"
else  
    DISKSIZE=$(crc status | grep Disk | xargs  echo | cut -d ' ' -f 5)
    echo "Current Disksize = $DISKSIZE"
    if [ "$DISKSIZE" == "549.2GB" ]; then
        echo "Disk is ok, no restart needed"
        exit 0
    fi   
    (cd $SCRIPTDIR; powershell.exe -File  crc-resize.ps1) 
fi