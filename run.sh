#!/bin/bash

mkdir -p apps batches

cp apps.txt batches/apps.txt
cd batches
split -l3 apps.txt
rm -f apps.txt
cd ..

BATCH=$(ls -1 batches/ | sed "${SEMAPHORE_JOB_INDEX}q;d")

echo "Current batch: $BATCH"

cat batches/$BATCH | while read line 
do
  export APP_NAME=$line
  cat build-app.bats | envsubst > apps/$line.bats
done

