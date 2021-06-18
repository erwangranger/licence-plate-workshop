#!/bin/bash

echo "starting stress test"

IMG_PATH=./dataset/images
URL=""

for f in $(ls ${IMG_PATH})
do 
    echo "processing ${IMG_PATH}/${f}"
    ( echo -n '{"image": "'; base64 ${IMG_PATH}/${f}; echo '"}' ) \
       | curl -H "Content-Type: application/json" \
       -d @- ${URL}/predictions &
done
