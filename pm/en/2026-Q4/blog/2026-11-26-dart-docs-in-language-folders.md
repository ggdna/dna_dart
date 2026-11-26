<!--
@license
Copyright (c) ggdna

Use of this source code is governed by terms that can be
found in the LICENSE file in the root of this package.
-->

# Dart docs in language folders

## Motivation

- Docs are now kept per language below `doc/<lang>/`, planning below
  `pm/<lang>/<yyyy>-Q<n>/`
- Goal: this layer ships its own guide and all inherited docs in the new
  layout, in English, German and Farsi

## Strategy

- Move the own guide to `dna/doc/en/guides`
- Take the new layout from the updated layers
- Adjust the ignore files to all language folders

## Own guide

- `update-dart-and-flutter-sdk-guide.md` moved to `dna/doc/en/guides`
- German and Farsi copies in `dna/doc/de/guides` and `dna/doc/fa/guides`

## Generated docs

- All guides and templates now live in `doc/en/`, `doc/de/` and
  `doc/fa/`
- The German blog template is `doc/de/templates/blog-template.md`
- Skills and `CLAUDE` notes point to `doc/en/guides`
- `.pubignore` and `.prettierignore` cover `doc/*/guides/` and
  `doc/*/templates/`

## Dependency updates

- dna_readme: `check-readme.js` checks `README.<lang>.md` for every
  language of `dnaLanguages`
- dna_translate: new variable `dnaLanguages`, default `en`
- dna_blog: posts go into `pm/<lang>/<yyyy>-Q<n>/blog`
- dna_guides, dna_index, dna_install, dna_clean_code, dna_scripts,
  dna_vscode: guides in `doc/en`, `doc/de` and `doc/fa`
- dna_gg 1.9.1 → 1.9.2

## Open Points

- `pubspec_overrides.yaml` points to the local layer checkouts until
  the layers are published
