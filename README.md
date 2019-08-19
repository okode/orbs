# Okode Orbs

A set of orbs for continuous integration for Okode projects.

## Setup

```
$ brew install circleci
$ circleci setup
```
The token can be retrieved from 1Password

## Creating

```
$ circleci orb create okode/<orb>
```
Also modify the release.sh script in order to add the publish command corresponding to the new orb.

## Testing

```
$ ./release.sh dev:first
```
Remember to set the `dev:first` orb version at the config.yml template of the proyect that is going to be used to test.

## Publishing

```
$ ./release.sh [VERSION]
```

## Orbs

### common

Common commands for building Okode projects.

### stack

Build and publish fullstack applications based on Ionic and Spring Boot.

### ionic

Build and publish hybrid Apps based on Ionic for iOS / Android.

### angular

Build and publish Ionic/Angular libraries.
