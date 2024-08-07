#!/bin/bash

# reload after deployment
if [ "$ENDPOINT" = "" ]; then
  echo Nothing to run after deploy
else
  if [ "$DEST_HOST" = "" ]; then
    sudo drumee start $ENDPOINT
    sudo drumee start $ENDPOINT/service
  else
    if [ "$DEST_USER" = "" ]; then
      ssh $DEST_HOST sudo drumee start $ENDPOINT
      ssh $DEST_HOST sudo drumee start $ENDPOINT/service
    else
      ssh $DEST_USER@$DEST_HOST sudo drumee start $ENDPOINT
      ssh $DEST_USER@$DEST_HOST sudo drumee start $ENDPOINT/service  
    fi
  fi
fi