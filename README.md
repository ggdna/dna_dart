# dna_dart

The DNA of all of our Dart projects. Builds on the ggdna topic layers — see
[dna_ggdna](https://github.com/ggdna/dna_ggdna) for the set — and adds the
Dart-specific layer, inherited via
[helix](https://github.com/ggdna/helix):

- `dna/dot-vscode/settings.overrides.json` — Dart editor settings merged
  into the base settings
- `dna/dot-vscode/extensions.overrides.json` — Dart extension
  recommendations (array join)
- `dna/dot-vscode/launch.json`, `tasks.json` — Dart launch/test tooling
- `dna/test/dna/dna-test.dart` — the DNA wrapper test shipped to Dart
  consumers (instantiated as `test/dna/dna_test.dart`)

Dotfiles carry a `dot-` prefix inside `dna/` and lose it when
instantiated (`dna/dot-vscode/…` → `.vscode/…`). Without the escape
`dart pub publish` drops them, and the layer would reach consumers
incomplete.

## Usage

```bash
dart pub add dna_dart dev:helix
helix init
```

The placed test instantiates and verifies the DNA on every test run (the
topic layers are pulled in transitively).

## Development

`role: "dna"` in `dna/_dna.json`: the `dna/` folder is authored by hand.
The repo instantiates its own DNA — run `dart test` after changes; commit
first (a file the DNA would overwrite must not carry uncommitted work).
During development `gg_localize_refs` points the layer dependencies at the
local checkouts; the DNA config itself never holds paths.
