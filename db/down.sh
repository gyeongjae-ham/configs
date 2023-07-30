#!/bin/bash

read NAME

cd ~/Desktop/infra/db/$NAME

$(docker-compose down)

echo "$NAME database is shut down!!"
