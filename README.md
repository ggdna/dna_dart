# dna_dart

The DNA of all of our Dart projects. Builds on
[base_dna](https://github.com/ggsuite/base_dna) and adds the
Dart-specific layer, inherited via
[gg_dna](https://github.com/ggsuite/gg_dna):

- `dna/.vscode/settings.overrides.json` — Dart editor settings merged
  into the base settings
- `dna/.vscode/extensions.overrides.json` — Dart extension
  recommendations (array join)
- `dna/.vscode/launch.json`, `tasks.json` — Dart launch/test tooling
- `dna/doc/develop.overrides.md` — Dart commands for the ticket
  workflow (pub upgrade, analyze/test, publish)
- `dna/test/dna/dna-test.dart` — the DNA wrapper test shipped to Dart
  consumers (instantiated as `test/dna/dna_test.dart`)

## Usage

```bash
dart pub add dev:dna_dart dev:gg_dna
gg_dna init
```

The placed test instantiates and verifies the DNA on every test run
(base_dna is pulled in transitively).

## Development

`role: "dna"`: the `dna/` folder is authored by hand. The repo
instantiates its own DNA — run `dart test` after changes; commit first
(a file the DNA would overwrite must not carry uncommitted work). The
workspace override in `.gg/dna.json` points at `../base_dna` during
development.
