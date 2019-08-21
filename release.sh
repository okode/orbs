#!/bin/bash
set -eo pipefail

if [[ $# -ne 1 ]]; then
  echo "Syntax: release.sh [VERSION]"
  exit 1
fi

TAG=$1

if [[ ($TAG != "dev:first") && (-n $(git status -z))]]; then
  echo "Repository not clean, ensure you have committed all your changes"
  exit 1
fi

if [[ $TAG == "dev:first" ]]; then
  find . -type f -name '*.yml' -exec sed -i '' 's/volatile/dev:first/' {} +
fi

circleci orb publish common/orb.yml okode/common@$TAG
circleci orb publish ionic/orb.yml okode/ionic@$TAG
circleci orb publish angular/orb.yml okode/angular@$TAG
circleci orb publish stack/orb.yml okode/stack@$TAG

if [[ $TAG != "dev:first" ]]
then
  
  git tag $TAG -m $TAG
  git push --tags

else
  find . -type f -name '*.yml' -exec sed -i '' 's/dev:first/volatile/' {} +
fi
