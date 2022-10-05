#!/bin/bash


SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

 shopt -s extglob

OS=$(uname -a)
PROGRAM=""
 
case "$OS" in 
*microsoft*) PROGRAM="powershell.exe" ;; 
esac

if [ -z ${PROGRAM+x} ]; then
    echo "No resize needed on this platform"
else 
crc stop
# cannot pass a mount drive to the exe so cd first and pass file with no path
(cd $SCRIPTDIR; powershell.exe -File  crc-resize.ps1)
crc start
fi