#!/bin/bash

# safer than rm
echo > versions.txt

while read VERSION; do
  echo "+ testing version $VERSION localy"
  if docker build --pull -t $IMAGE_NAME:$VERSION --build-arg ASDF_VERSION=$VERSION .; then
    echo $VERSION >> versions.txt
  fi
  docker image rm $IMAGE_NAME:$VERSION
done < <(git ls-remote https://github.com/asdf-vm/asdf.git | grep -o -E 'refs/tags/v[A-Za-z0-9\.-]*' | sed 's:refs/tags/::' | sort -rV)
