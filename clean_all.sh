#/bin/bash
# Script to delete containers, images and volumes
# 2022 - By: Paulo Leite
# NOTE:if you have figlet installer uncommentline 7 and coment line 8

clear
#figlet "cleaning docker"
echo "Cleaning docker ecosystem" \ echo "===================================================="

#check if there are running containers to stop
if [ $( docker ps -q | wc -l ) -gt 0 ]; then
  # Stop containers
  echo "Stopping containers"
  docker stop $(docker ps -q)
  echo "Containers stoped!"
  else
  # there are no running containers 
  echo "There are no containers to STOP"
fi

#check if there are stop containers to delete
if [ $( docker ps -aq | wc -l ) -gt 0 ]; then
  # Delete stopped cotainers
  echo "Deleting containers"
  docker rm $(docker ps -aq)
  echo "Containers deleted!"
  else
  # there are no containers to remove
  echo "There are no Containers to Delete!"
fi

#check if there are images
if [ $( docker image ls -q | wc -l ) -gt 0 ]; then
  echo "Delete images"
  docker rmi -f $(docker image ls -q)
  echo "Images deleted!"
  else
  # there are no images
  echo "There are no images to remove"
fi

#check if there are volumes
if [ $( docker volume ls -q | wc -l ) -gt 0 ]; then
  echo "Delete volumes"
  docker volume remove -f $(docker volume ls -q)
  echo "Volumes deleted!"
  else
  # there are no volumes
  echo "There are no volumes to remove"
fi

#check if exists Network
if [ $( docker network ls -q | wc -l ) -gt 0 ]; then
  echo "Delete networks"
  docker network rm $(docker network ls -q)
  echo "Networks deleted!"
  else
  # there are no networks
  echo "There are no Networks to remove"
fi

echo 
echo
echo "Done!"
