#!/bin/bash
set -eo pipefail

find . -type f -name '*.yml' -exec sed -i '' "s/okode\/common@1/okode\/common@dev:first/" {} +

circleci orb publish common/orb.yml okode/common@dev:first
circleci orb publish ionic/orb.yml okode/ionic@dev:first

find . -type f -name '*.yml' -exec sed -i '' 's/okode\/common@dev:first/okode\/common@1/' {} +