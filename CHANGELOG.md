# Changelog

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
