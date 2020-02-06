#!/bin/bash

ArialocalFolder="${HOME}/downloads"
AriauncompleteExt='.aria2'

function UploadToGoogle() {
	count=`ls ${HOME}/downloads/*.aria2 2>/dev/null | wc -l`
	if [ $count != 0 ]
	then
		echo 'Download in progress'
	else
        	/usr/bin/rclone move ${HOME}/downloads googledrive:
	fi
}
#UploadToGoogle $BDlocalFolder $BDuncompleteExt
UploadToGoogle $ArialocalFolder $AriauncompleteExt

