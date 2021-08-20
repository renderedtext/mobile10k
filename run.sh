#!/bin/bash

mkdir -p apps batches

APP_COUNT=$(wc -l apps.txt | cut -d' ' -f1)
BATCH_SIZE=$(divide=$APP_COUNT; by=$SEMAPHORE_JOB_COUNT; (( result=(divide+by-1)/by )); echo $result)

cp apps.txt batches/apps.txt
cd batches
split -l$BATCH_SIZE apps.txt
rm -f apps.txt
cd ..

BATCH=$(ls -1 batches/ | sed "${SEMAPHORE_JOB_INDEX}q;d")

echo "Current batch: $BATCH"

cat batches/$BATCH | while read line 
do
  export APP_NAME=$line
  cat build-app.bats | envsubst > apps/$line.bats
done

