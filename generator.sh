#!/bin/bash

set -eu -o pipefail

VERSIONS="${1:-versions.txt}"

while read -r VERSION; do
  echo "+ building version ${VERSION}"
  docker build --pull -t $IMAGE_NAME:$VERSION --build-arg ASDF_VERSION=$VERSION .
  docker push $IMAGE_NAME:$VERSION
done < "${VERSIONS}"
