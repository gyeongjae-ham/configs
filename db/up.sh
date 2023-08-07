#!/bin/bash

read NAME

cd ~/Desktop/dev/db/$NAME

$(docker-compose up -d)

if [ $? -eq 0 ];then
	# 명령어 성공
  echo "                             "
  echo "============================="
	echo "$NAME database is started!!"
  echo "============================="
  echo "                             "
else
	# 명령어 실패 시
  echo "============================="
	echo "   SOMETHING WENT WRONG!!!   "
	echo "  CHECK THE ERROR MESSAGE!!  "
  echo "============================="
	exit 9
fi

