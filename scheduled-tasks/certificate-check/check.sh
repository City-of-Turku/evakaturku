#!/bin/sh
topic=$(aws sns list-topics --output text | grep cert-topic | sed 's/TOPICS//' | tr -d '[:blank:]')

if [ -n "$topic" ]; then
  aws sns publish --topic-arn $topic --message "foobar"
  echo "message sent"
else
  echo "no sns topic, message not sent"
fi
