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

circleci orb publish common/orb.yml okode/common@$TAG
circleci orb publish ionic/orb.yml okode/ionic@$TAG
circleci orb publish angular/orb.yml okode/angular@$TAG
circleci orb publish stack/orb.yml okode/stack@$TAG

if [[ $TAG != "dev:first" ]]
then
  if [[ -n $(git status -z) ]]; then
    echo "Repository not clean, ensure you have committed all your changes"
    exit 1
  fi
  
  git tag $TAG -m $TAG
  git push --tags

fi