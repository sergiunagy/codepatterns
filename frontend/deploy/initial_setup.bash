# #################################
# Project initialization script
#
# This script will perform the following:
# - build a nodeJS image with and installed Angular client
# - initialize  the project using a client default setup. This will create the defauls Angular app folder structure in the app folder
# #############################################

# script constants
IMG_NAME="sergiunb/copat-angular-ui"
APP_NAME="copat"
CONTAINER_PATH_APP="/home/node/app"

# Generation options selected for base:
# - disable strict mode during early dev and experimentation stages.
# - skip automatic creation of a git repo. This is done externally so we can just diable it here
# - disable default routing generation. We'll set up routing manually once the design is clear. 
APP_GENERATION_OPTS="--strict false --skip-git --routing false"

# Libraries selected for base:
# - use class-transformer for POJO support (data storage, JSON serialization.. even if temporary).
# - class-validator data validation features (for inputs validation)
# - moment for  time and date ops
# - d3 for graphs and visual representation
APP_EXTRA_PCKGS="class-validator class-transformer moment @angular/material d3 @types/d3"

# build the image up to base level. The Dev setup is in the following steps
# The base will set up Angular Cli and base folders and permissions
echo -------------------------------------
echo Building image ..
docker build --no-cache -t $IMG_NAME --target base .

# run initial project creation using an ephemeral container.
# Note: 
#  - use a non-root user to avoid permission issues when bind-mounting to host local drive
#  - this bind-mounts to the local drive.
#  - the app configuration is pretty basic and is hardcoded here. 
echo Running initial project generation to $(pwd)/../app
docker run --rm -u node -v $(pwd)/../app:$CONTAINER_PATH_APP $IMG_NAME ng new $APP_NAME $APP_GENERATION_OPTS

# ----------------------
# Setup extra packages - separate steps, for easy tailoring
docker run --rm -u node -v $(pwd)/../app:$CONTAINER_PATH_APP $IMG_NAME sh -c "cd $APP_NAME && npm install --save $APP_EXTRA_PCKGS"

# Remove base image and build the development image
# We do this because the base image does not contain installed modules and we want the same
# start procedure for both initial pj setup and a regular clone from the repository.
echo -------------------------------------
echo Building the development image ..
# remove the base image
docker rmi $IMG_NAME
# build the development: here we need to pass the context on a different level than the Dockerfile
# so that we are able to access source files for COPY operations (from Dockerfile)
docker build --no-cache -t $IMG_NAME --target development -f ./Dockerfile ..

echo BUILD COMPLETE !!
echo you can user Docker Compose to launch services from the pj deploy folder
# #########################################
# RUN
# From Ubuntu or WSL2 terminal run with :
# bash initial_setup.bash 

# After init
# - once the first init is complete, you can user Docker Compose to launch services and serve the web app.