#!/bin/bash

while read VERSION; do
  echo "+ building "
  docker build --pull -t $IMAGE_NAME:$VERSION --build-arg ASDF_VERSION=$VERSION .
  echo docker push $IMAGE_NAME:$VERSION
done < <(cat versions.txt)
