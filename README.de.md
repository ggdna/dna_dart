# dna_dart

[English](README.md) | Deutsch

[![CI](https://github.com/ggdna/dna_dart/actions/workflows/quick_check.yaml/badge.svg)](https://github.com/ggdna/dna_dart/actions/workflows/quick_check.yaml)

Gibt einem Dart-Repo die ggdna-Themen-Schichten und dazu die Dart-Editor-,
Start- und Task-Einstellungen sowie den Guide zum SDK-Update.

## Motivation

dna_dart ist die Dart-Schicht: Sie verbindet die ggdna-Themen-Schichten
mit dem, was nur Dart-Projekte brauchen — die Dart-Editor-Einstellungen
und -Erweiterungen für VS Code, eine Startkonfiguration für die offene
Testdatei, einen Coverage-Task und den Guide, mit dem das Dart- und
Flutter-SDK in allen Repos einer Organisation aktualisiert wird. Ein
Dart-Repo bekommt beides mit einer Abhängigkeit.

## Verwendung

Hinzufügen und einmal initialisieren:

```bash
dart pub add dna_dart dev:helix
helix init
```

`helix init` legt `test/dna/dna_test.dart` ab, einen Test, der die DNA bei
jedem Testlauf instanziiert und prüft, und fragt nach den unten genannten
Organisationsvariablen. Der Test kopiert den Guide zum SDK-Update nach
`doc/guides/` sowie `launch.json` und `tasks.json` nach `.vscode/`. Er
führt die Editor-Einstellungen in `.vscode/settings.json` zusammen und
hängt die Erweiterungs-Empfehlungen an `.vscode/extensions.json` an, beide
geerbt von dna_vscode. Die Eltern-Schichten legen ihre Guides und
Templates in `doc/` ab, ihre Skills in `.claude/skills/`, ihre Skripte in
`scripts/`, den Quick-Check-Workflow in `.github/workflows/` sowie
`CLAUDE.md` und die Prettier-Konfiguration im Wurzelverzeichnis.

In VS Code startet die Startkonfiguration „Test Current File“ die offene
Dart-Datei, und der Standard-Build-Task `generate_lcov` misst die
Coverage der offenen Testdatei.

## Guides

- `dna/doc/guides/update-dart-and-flutter-sdk-guide.md` — wie das Dart-
  und Flutter-SDK in allen Repos der Organisation in einem gg-Ticket
  angehoben wird: SDK aktualisieren, die Dart-Fixes anwenden, die
  Abhängigkeiten aktualisieren, dann reviewen und veröffentlichen

## Konfiguration

- `dna/dot-vscode/settings.overrides.json` — die Dart-Editor-
  Einstellungen: Formatieren beim Speichern und Tippen, das Lineal bei 80
  Zeichen, Dart-Code als Formatierer, die Import-Korrektur beim Speichern
  und die Testansicht bei Fehlschlägen; zusammengeführt mit den
  Einstellungen von dna_vscode
- `dna/dot-vscode/extensions.overrides.json` — hängt die Erweiterungen für
  Dart, Flutter und dart-import an die Empfehlungen von dna_vscode an
- `dna/dot-vscode/launch.json` — die Startkonfiguration „Test Current
  File“
- `dna/dot-vscode/tasks.json` — der Standard-Build-Task `generate_lcov`,
  der `dart run coverage:test_with_coverage` auf die offene Datei anwendet

## Umfang

dna_dart trägt nur, was für Dart spezifisch ist. Die Code- und Testregeln
für Dart kommen aus dna_clean_code, jedes andere Thema aus seiner eigenen
Schicht. Sie nennt weder dna_ggdna noch dna_helix: Das Thema, wie man
DNA-Schichten erstellt, gehört nicht dazu.

## Schichten

`dna/_dna.json` nennt diese Eltern, angewendet in dieser Reihenfolge;
dna_dart selbst kommt zuletzt:

- [dna_readme](https://github.com/ggdna/dna_readme) — die README-Guides
  und -Templates, der Skill `/readme` und das Skript, das die README prüft
- [dna_guides](https://github.com/ggdna/dna_guides) — die Regeln für
  Guides und Dokumentation und der Skill `/guide`
- [dna_translate](https://github.com/ggdna/dna_translate) — die Regeln,
  die englische und deutsche Dokumentation synchron halten, das deutsche
  Blog-Template und der Skill `/translate`
- [dna_index](https://github.com/ggdna/dna_index) — der Guide und das
  Template der `index.jsonc`, die ein Repo beschreibt, und der Skill
  `/index`
- [dna_blog](https://github.com/ggdna/dna_blog) — der Blog-Guide, das
  Template für Blogbeiträge und der Skill `/blog`
- [dna_install](https://github.com/ggdna/dna_install) — die
  Installations-Guides, die einen Entwicklungsrechner einrichten, und der
  Skill `/install`
- [dna_vscode](https://github.com/ggdna/dna_vscode) — die gemeinsamen
  VS-Code-Einstellungen und -Erweiterungen, die Prettier-Konfiguration
  und der Skill `/vscode`
- [dna_clean_code](https://github.com/ggdna/dna_clean_code) — die Code-
  und Test-Guides, sprachneutral sowie für Dart und TypeScript, und die
  Skills `/code`, `/test`, `/review-light` und `/review-heavy`
- [dna_scripts](https://github.com/ggdna/dna_scripts) — die Node-Skripte
  für den Git- und GitHub-Workflow, ihre gemeinsamen Funktionen und der
  Skill `/scripts`
- [dna_gg](https://github.com/ggsuite/dna_gg) — der gg-Ticket-Workflow:
  die Entwicklungs-Guides, `CLAUDE.md` und die `/gg`-Skills; sie baut auf
  dna_install, dna_index und dna_github auf, die den Quick-Check-Workflow
  und das GitHub-Setup-Skript beisteuert

Die beiden `*.overrides.json`-Dateien erweitern `.vscode/settings.json`
und `.vscode/extensions.json` von dna_vscode: Die Einstellungen werden
Objekt für Objekt zusammengeführt, der Schlüssel `recommendations+` hängt
an die geerbte Liste an.

## Variablen

- `dnaCopyrightHolder` — der Rechteinhaber im Lizenzkopf jeder Datei
- `dnaCompany` — die Firma
- `dnaGitOrg` — die GitHub-Organisation; der Guide zum SDK-Update nutzt
  sie als Namen des gg-Workspaces und der Organisation, deren Repos er
  hinzufügt
- `dnaGitOrgUrl` — die URL dieser Organisation
- `dnaGitQuickCheckPipelineName` — der Name der Quick-Check-Pipeline, die
  die Branch-Regeln verlangen
- `dnaJiraPrefix` — das Präfix einer Ticket-ID

`dna/_vars.json` setzt sie für die Instanziierung dieses Repos auf die
Werte von ggdna. `dna/_dna.json` hebt keine Pflicht auf, die die
Themen-Schichten mit `mustOverride` markieren, also setzt ein Repo, das
dna_dart einbindet, alle sechs in seiner eigenen `dna/_vars.json`.
`helix init` fragt nach ihnen, und der DNA-Test nennt jede, die fehlt.

## Entwicklung

Der Ordner `dna/` ist handgeschriebene Quelle und wird nie generiert. Das
Repo instanziiert seine eigene DNA — nach Änderungen `dart test` laufen
lassen; vorher committen, denn eine Datei, die die DNA überschreiben
würde, darf keine uncommittete Arbeit enthalten.

Bearbeite die Dateien unter `dna/`, nie ihre Kopien in `doc/`, `.claude/`,
`scripts/` und `.vscode/`: Der Test überschreibt sie. Dotfiles tragen in
`dna/` das Präfix `dot-` und verlieren es beim Instanziieren
(`dna/dot-vscode/` wird zu `.vscode/`); ohne dieses Escape lässt
`dart pub publish` sie weg, und die Schicht käme unvollständig bei den
Nutzern an. Während der Entwicklung lässt `gg_localize_refs` die
Abhängigkeiten auf die lokalen Checkouts zeigen; die DNA-Konfiguration
enthält nie Pfade.

## Lizenz

MIT — siehe [LICENSE](LICENSE).
