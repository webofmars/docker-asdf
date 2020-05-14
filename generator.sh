#!/bin/bash

while read VERSION; do
  docker build --pull -t $IMAGE_NAME:$VERSION --build-arg ASDF_VERSION=$VERSION .
  docker push $IMAGE_NAME:$VERSION
done < <(git ls-remote https://github.com/asdf-vm/asdf.git | grep -o -E 'refs/tags/v[A-Za-z0-9\.-]*' | sed 's:refs/tags/v::' | sort -V)
