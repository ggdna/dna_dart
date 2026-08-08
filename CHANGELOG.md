# Changelog

## Unreleased

### Changed

- Increase version
- Publishing dna

### Fixed

- Fix dna issues

## 1.0.2 - 2026-08-08

### Added

- `example/dna_dart_example.dart` — pub.dev expects an example folder, and
the sibling DNA packages ship the same one-liner.
- Add missing example

### Changed

- Resolve DNA like dart or npm packages
- Set version back to 1
- Update dependencies

### Fixed

- Fix issues in markdown overrides
- Fix versions

### Removed

- `dna/doc/develop.overrides.md`. base_dna's `develop.md` describes the
uniform gg workflow (`gg do commit`, `gg do publish`) and carries no
`[@tag]` anchors any more, so the Dart-specific command blocks had
nothing left to override — the engine reported them as skipped on every
run. dna-ts dropped its pnpm counterpart for the same reason.

## 1.0.1 - 2026-08-08

### Changed

- Define dna repos

## 1.0.0 - 2026-08-05

### Added

- Dart layer on top of base_dna (gg_dna 5.0 replica layout)
- `.vscode/settings.overrides.json` + `extensions.overrides.json`
(Dart keys and extensions merged into the base files)
- `launch.json` and `tasks.json` for Dart debugging and coverage
- `doc/develop.overrides.md` — Dart flavor of the ticket workflow
- `test/dna/dna-test.dart` — the DNA wrapper test shipped to consumers
- Pure Dart package (pub.dev), project structure from
gg_template_project; `role: "dna"` with self-instantiation
