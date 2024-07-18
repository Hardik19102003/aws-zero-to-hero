#!/bin/bash
set -e


# Stop the running container (if any)
containerid=$(docker ps -q)  # Get the ID of the running container
if [ -n "$containerid" ]; then  # Check if there is a running container
    docker rm -f $containerid  # Forcefully remove the running container
fi
