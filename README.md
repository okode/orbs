# Okode Orbs

A set of orbs for continuous integration for Okode projects.

## Setup

```
$ brew install circleci
$ circleci setup
```
The token can be retrieved from 1Password

## Creating

```sh
$ circleci orb create okode/<orb>
```
Also modify the release.sh script in order to add the publish command corresponding to the new orb.

## Testing

> **IMPORTANT:** Do not commit any of this changes! The proper way to publish on `dev:first` version
> is to have its own branch.

To test the modified orbs you need to publish them directly using the `circleci` command and setting
its version to `dev:first`, e.g.:

```sh
$ circleci orb publish common/orb.yml okode/common@dev:first
```

If the orb you are going to test has dependencies over other orbs that you have also modified, then
remember to set their versions to 'dev:first' too before publishing them. That said, if you have
modified the `common` orb and want to test it using the `stack` orb, then remember to publish the
`common` orb as `dev:first` but also to publish the `stack` orb as `dev:first` with its dependencies
to the `common` orb changed to `dev:first` too:

- Publish `common` orb as `dev:frist`

```sh
$ circleci orb publish common/orb.yml okode/common@dev:first
```

- Change `stack` orb dependencies over `common` orb to `dev:first`
```yml
orbs:
  common: okode/common@dev:first # This line!
  node: circleci/node@4
```

- Publish the `stack` orb as `dev:first`

```sh
$ circleci orb publish stack/orb.yml okode/stack@dev:first
```

Remember also to set the `dev:first` orb version at the config.yml template of the proyect that is going to be used to test.

## Publishing

```sh
$ ./release.sh $VERSION
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
