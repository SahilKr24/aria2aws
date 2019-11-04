#!/bin/bash

ArialocalFolder="${HOME}/torrent"
AriauncompleteExt='.aria2'

function UploadToGoogle() {
	count=`ls /home/sahil/torrent/*.aria2 2>/dev/null | wc -l`
	if [ $count != 0 ]
	then
		echo 'Download in progress'
	else
        	gdrive sync upload ${HOME}/torrent 1ssniNl0SunY3xoFVS_mkr_K5_EvU4pSu
	        rm -rf ${HOME}/torrent/*
	fi
}
#UploadToGoogle $BDlocalFolder $BDuncompleteExt
UploadToGoogle $ArialocalFolder $AriauncompleteExt

