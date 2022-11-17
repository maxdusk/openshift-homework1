Docker gets 14.18.1 image as parent image (for other versions during yarn build command gets error)
Runs command to update system packages and install nginx service
Creates working dir in conatiner
Copies frontend dir files to working dir in docker container
Runs command to run scripts, install dependencies
Runs command to build code
Copies builded files to nginx default page dir 
Exposes 80 port in container
Entrypoint starts nginx when container starts 
