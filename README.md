# Okode Orbs

A set of orbs for continuous integration for Okode projects.

## Publishing

```
$ brew install circleci
$ circleci setup
$ circleci orb publish [orb.yml] okode/[name]@dev:first
$ circleci orb publish promote okode/[name]@dev:first patch
```

## Orbs

### stack

Build and publish fullstack applications based on Ionic and Spring Boot.

```
$ circleci orb publish stack/orb.yml okode/stack@dev:first
$ circleci orb publish promote okode/stack@dev:first patch
```

### ionic

Build and publish hybrid Apps based on Ionic for iOS / Android.

```
$ circleci orb publish ionic/orb.yml okode/ionic@dev:first
$ circleci orb publish promote okode/ionic@dev:first patch
```