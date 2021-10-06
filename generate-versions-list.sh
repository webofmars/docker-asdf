#!/bin/bash

set -eu -o pipefail

# safer than rm
echo > versions.txt

while read -r VERSION; do
  echo "${VERSION}" >> versions.txt
done < <(git ls-remote https://github.com/asdf-vm/asdf.git | grep -o -E 'refs/tags/v[A-Za-z0-9\.-]*' | sed 's:refs/tags/::' | sort -rV)
