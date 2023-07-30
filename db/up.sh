#!/bin/bash

read NAME

cd ~/Desktop/infra/db/$NAME

$(docker-compose up -d)

echo "$NAME database is started!!"
