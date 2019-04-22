#!/usr/bin/env bash

# https://gist.github.com/bastman/5b57ddb3c11942094f8d0a97d461b430


# see: http://stackoverflow.com/questions/32723111/how-to-remove-old-and-unused-docker-images
docker rm $(docker ps -qa --no-trunc --filter "status=exited")

# see: https://github.com/chadoe/docker-cleanup-volumes
docker volume rm $(docker volume ls -qf dangling=true)
docker volume ls -qf dangling=true | xargs -r docker volume rm


# see: http://stackoverflow.com/questions/32723111/how-to-remove-old-and-unused-docker-images

docker images
docker rmi $(docker images --filter "dangling=true" -q --no-trunc)

docker images | grep "none"
docker rmi $(docker images | grep "none" | awk '/ / { print $3 }')




