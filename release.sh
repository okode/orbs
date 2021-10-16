#!/bin/bash
set -eo pipefail

if [[ $# -ne 1 ]]; then
  echo "Syntax: release.sh [VERSION]"
  exit 1
fi

TAG=$1
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

if [[ (-n $(git status -z)) ]]; then
  echo "Repository not clean, ensure you have committed all your changes"
  exit 1
fi

git checkout -b version/$TAG

find . -type f -name '*.yml' -exec sed -i '' "s/okode\/common@1/okode\/common@${TAG}/" {} +

git commit -a -m"Bumped version $TAG"
git tag $TAG -m $TAG

circleci orb publish common/orb.yml okode/common@$TAG
circleci orb publish ionic/orb.yml okode/ionic@$TAG
circleci orb publish angular/orb.yml okode/angular@$TAG
circleci orb publish stack/orb.yml okode/stack@$TAG

git checkout $CURRENT_BRANCH
git branch -D version/$TAG
git push --tags
