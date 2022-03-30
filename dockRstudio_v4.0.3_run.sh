#!/bin/bash
 
# Description: bash script to start docker Rstudio server
#    Rstudio docker image: prepiscak/them6-project:4.0.3-v1
#    based on: ccribioinf/dockrstudio:4.0.3-v1
#    which is based on tidyverse: rocker/tidyverse:4.0.3
#
# Usage: bash dockRstudio_v4.0.3_run.sh
#
# Parameters:
#    new_port (-p ${new_port}:8787) Map TCP port 8787 (default for Rstudio server) in the container to port $new_port on the Docker host.
#    -e USERID; -e GROUPID - specifying user id and group id for correct file ownership
#    -e PASSWORD - password for the Rstudio server; default user is 'rstudio', but this can be changed using, for example, -e USER=$(whoami) 
#    --volume - binding volumes for persistent data storage
#    --workdir - specifying working directory; this may not work in Rstudio server!

new_port=7667

docker run --rm \
  -p ${new_port}:8787 \
  --name rstudio_${new_port} \
  -e USERID=$(id -u) \
  -e GROUPID=$(id -g) \
  -e PASSWORD=them6 \
  --volume=$(pwd):"/home/rstudio/workspace" \
  --workdir="/home/rstudio/workspace" \
  prepiscak/them6-project:4.0.3-v1

