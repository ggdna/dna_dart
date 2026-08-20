# Update Dart and Flutter SDK

Update Dart and Flutter SDK

We want to update all of them.

## Replace in this ticket

- `134` by the number of your ticket


## Create a ticket

We have already a gg workspace called ggsuite.
All ggsuite repos are added to the master.

```bash
cd ~/dev/ggsuite
gg do create ticket 134 -m"Update dart and flutter"
cd 134
```

## Add all ggsuite repos to the ticket

Because copy right header do not affect dependencies, we can add the
repos with option `--no-localize`.

```bash
gg do add --org ggsuite --no-localize
```

## Update dart to latest version

```bash
flutter upgrade
dart pub global activate gg
pana
dart --version
flutter --version
```

Tell claude:

```
In all pubspec.yaml files, fix the sdk to the latest version:

sdk: ">=3.13.0<4.0.0"

Update also flutter SDK to the latest version.
```

## Apply dart auto-fixes

```bash
gg do exec cmd "dart fix --apply"
```


## Upgrade all dependencies

```bash
gg do upgrade deps
```

## Publish without uploading to registry

Commit the changes in all added repos

```bash
 gg do commit -m"Update dart and flutter"
```

## Create a pull request

```bash
 gg do review
```

## Create a pull request

```bash
 gg do publish
```

