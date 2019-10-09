#!/usr/bin/env bash

echo "building..."
docker build -t 09esiegel/mm_ui_utsw:latest . && docker push 09esiegel/mm_ui_utsw:latest

echo ""
echo "copying docker-compose..."
scp /Users/ethansiegel/code/mm-devops/demo/docker-compose.yml esiegel@35.193.82.240:/home/esiegel/

echo ""
echo "deploying..."
ssh -t esiegel@35.193.82.240  'bash -ic "docker kill mm_ui; docker rm mm_ui; dc pull mm_ui; dc up -d mm_ui"' ;
