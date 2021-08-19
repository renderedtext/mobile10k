#!/bin/bash

sleep $1
echo "Slept $1"
sed 's/APP_NAME/$1/g' junit-template.xml > $APP_NAME.xml

