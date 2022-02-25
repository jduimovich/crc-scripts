#!/bin/bash
SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
# cannot pass a mount drive to the exe so cd first and pass file with no path
(cd $SCRIPTDIR; powershell.exe -File  crc-resize.ps1)
 
