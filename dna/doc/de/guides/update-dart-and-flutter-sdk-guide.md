# Dart- und Flutter-SDK aktualisieren

Dart- und Flutter-SDK aktualisieren

Wir wollen alle aktualisieren.

## @ticket In diesem Ticket ersetzen <a id="replace-in-this-ticket"></a>

- `134` durch die Nummer des eigenen Tickets


## @ticket-2 Ein Ticket anlegen <a id="create-a-ticket"></a>

Es gibt bereits einen gg-Workspace namens dnaGitOrg.
Alle dnaGitOrg-Repos sind dem Master hinzugefügt.

```bash
cd ~/dev/dnaGitOrg
gg do create ticket 134 -m"Update dart and flutter"
cd 134
```

## @dnagitorg Alle dnaGitOrg-Repos zum Ticket hinzufügen <a id="add-all-dnagitorg-repos-to-the-ticket"></a>

Da der Copyright-Header die Abhängigkeiten nicht beeinflusst, können die
Repos mit der Option `--no-localize` hinzugefügt werden.

```bash
gg do add --org dnaGitOrg --no-localize
```

## @dart Dart auf die neueste Version aktualisieren <a id="update-dart-to-latest-version"></a>

```bash
flutter upgrade
dart pub global activate gg
pana
dart --version
flutter --version
```

Sage Claude:

```
In all pubspec.yaml files, fix the sdk to the latest version:

sdk: ">=3.13.0<4.0.0"

Update also flutter SDK to the latest version.
```

## @dart-auto Dart-Auto-Fixes anwenden <a id="apply-dart-auto-fixes"></a>

```bash
gg do exec cmd "dart fix --apply"
```


## @upgrade Alle Abhängigkeiten aktualisieren <a id="upgrade-all-dependencies"></a>

```bash
gg do upgrade deps
```

## @publish Veröffentlichen ohne Upload in die Registry <a id="publish-without-uploading-to-registry"></a>

Committe die Änderungen in allen hinzugefügten Repos

```bash
 gg do commit -m"Update dart and flutter"
```

## @pull Einen Pull-Request anlegen <a id="create-a-pull-request"></a>

```bash
 gg do review
```

## @pull-request Einen Pull-Request anlegen <a id="create-a-pull-request"></a>

```bash
 gg do publish
```

