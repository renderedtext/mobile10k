#!/bin/bash

mkdir -p apps

cat apps.txt | while read line 
do
  export APP_NAME=$line
  cat build-app.bats | envsubst > apps/$line.bats
done

