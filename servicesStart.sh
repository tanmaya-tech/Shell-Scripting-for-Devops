#!/bin/bash
#
#Write a script to automate the starting and stopping of Docker and Jenkins services.

# Function to start docker and Jenkins 

start_services(){
	echo "Starting Docker ..."
	sudo systemctl start docker
	if [ $? -eq 0 ]; then
		echo "Docker service started successfully"
	else
		echo "Failed to start docker service"
	fi

	echo "Starting Jenkins ..."
        sudo systemctl start jenkins
        if [ $? -eq 0 ]; then
                echo "Jenkins service started successfully"
        else    
                echo "Failed to start jenkins service"
        fi 
}

#Function to stop the services

stop_services(){
        echo "Stoping Docker ..."
        sudo systemctl stop docker
        if [ $? -eq 0 ]; then
                echo "Docker service stopped successfully"
        else
                echo "Failed to stop docker service"
        fi

        echo "Stopping Jenkins ..."
        sudo systemctl stop jenkins
        if [ $? -eq 0 ]; then
                echo "Jenkins service stopped successfully"
        else
                echo "Failed to stop jenkins service"
        fi
}

#Main Script Logic

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 {start|stop}"
    exit 1
fi

#Figuring out which function to call based on input from user.
case $1 in
	start)
		start_services
		;;
	stop)
		stop_services
		;;
	*)
		echo "Invalid Option, use start or stop as argument"
		exit 1
		;;
esac
