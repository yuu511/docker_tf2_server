#!/bin/bash

RED='\033[0;31m'
YELLOW='\033[0;33m'

if [ ! -f $STEAMCMD ]; then
  echo "${RED} Could not find STEAMCMD.sh."
  exit 1
fi

if [ -z "${GAME_PATH}" ]; then
  echo "${RED} please set \$GAME_PATH"
  exit 1
fi

if [ -z "${APP_ID}" ]; then
  echo "${RED} please set \$APP_ID"
  exit 1
fi

output=$($STEAMCMD +login anonymous +app_info_print $APP_ID +quit)

# info not found, try finding info with login instead 
if [[ $output != *"\"$APP_ID\""* ]]; then
  echo "Please login."
  read -p "Username:" username
  read -p "Pasword:" password
fi

# if [ -z "$serr" ]; then
#   echo "Please login."
#   read -p "Username:" username
#   read -p "Pasword:" password
# fi

# $STEAMCMD +login anonymous +force_install_dir $GAME_PATH +APP_UPDATE $APPID +quit 
