Docker gets for parent image openjdk:11 
Copies backend dir in host to docker working 
directory 
Runs a command to build code with grandle wrapper and skips tests (because in this case, with tests build fails)
Exposes 8080 port in container
Entrypoint starts application from builded jar file
