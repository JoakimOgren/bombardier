#!/bin/bash

count=$(jq '.platforms | length' target_platforms.json)
mkdir -p ./build
echo "generating binaries for bombardier..."

for ((i=0; i<$count; i++)); do
    os=`jq -r '.platforms['$i'].os' target_platforms.json`
    arch=`jq -r '.platforms['$i'].arch' target_platforms.json`

    if [ $os = 'windows' ]; then
      ext='.exe'
    else
      ext=''
    fi

    GOOS=$os GOARCH=$arch go build -o ./build/bombardier-$os-$arch$ext
done