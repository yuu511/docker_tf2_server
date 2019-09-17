#!/bin/sh

RED='\033[0;31m'
YELLOW='\033[0;33m'

if [ ! -f $STEAMCMD ]; then
  echo "${RED} Could not find STEAMCMD.sh."
  exit 1
fi

$STEAMCMD +login anonymous +force_install_dir $GAME_PATH +APP_UPDATE $APPID +quit 
