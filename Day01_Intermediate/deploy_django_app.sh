#!/bin/bash

<< task
Deploy a Django notes app(code I have on my Github, you will get all libraries and all information from Readme file on github) and handle the code for errors (while cloning from git 1st time no error but if script is ran twice then error as code is cloned once.
task

code_clone(){
	echo "Cloning the Django app..."
	git clone https://github.com/tanmaya-tech/django-notes-app.git
}

install_requirements(){
	echo "Installing Dependencies"
	sudo apt-get install docker.io nginx -y
}

required_restarts(){
	sudo chown $USER /var/run/docker.io
	sudo systemctl enable docker
	sudo systemctl enable nginx
        sudo systemctl restart docker
}

deploy(){
	sudo docker build -t notes-app .
	sudo docker run -d -p 8000:8000 notes-app:latest
	#docker-compose up -d
}

echo "*************** DEPLOYMENT STARTED *******************"
#Handling error that once git clone is done and someone runs again then we need not clone again but just move in Django apps folder to access all my code for deployment.
if ! code_clone; then
	echo "The code directory already exists"
	cd django-notes-app
fi

#Error handling for other functions
if ! install_requirements; then
	echo "Installation failed"
	exit 1
fi
if ! required_restarts; then
	echo "System falult identified"
	exit 1
fi
if ! deploy; then
	echo "Deployment failed, mailing the admin"
	#send mail 
	exit 1
fi

echo "*****************DEPLOYMENT FINISHED *********************"

