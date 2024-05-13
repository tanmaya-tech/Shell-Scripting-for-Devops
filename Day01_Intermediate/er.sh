#!/bin/bash
#This file explains error handling in shell sripting.

create_directory(){
	mkdir demo
}
#Handling error as once demo is made then if code is run again error of recreation of dir with same name should be handled.
if ! create_directory; then
	echo "The code is being exited as the dir already exists"
	exit 1
fi

echo "This should not work because the code is interupted"

