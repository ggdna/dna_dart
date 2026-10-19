# dna_dart

English | [Deutsch](README.de.md)

[![CI](https://github.com/ggdna/dna_dart/actions/workflows/quick_check.yaml/badge.svg)](https://github.com/ggdna/dna_dart/actions/workflows/quick_check.yaml)

Gives a Dart repo the ggdna topic layers plus the Dart editor, launch and
task settings and the SDK update guide.

## Motivation

dna_dart is the Dart layer: it combines the ggdna topic layers with what
only Dart projects need — the Dart editor settings and extensions for
VS Code, a launch configuration for the open test file, a coverage task,
and the guide for updating the Dart and Flutter SDK across the repos of an
organization. A Dart repo gets both with one dependency.

## Usage

Add it and initialize once:

```bash
dart pub add dna_dart dev:helix
helix init
```

`helix init` places `test/dna/dna_test.dart`, a test that instantiates and
verifies the DNA on every test run, and asks for the organization
variables listed below. The test copies the SDK update guide to
`doc/guides/` and `launch.json` and `tasks.json` to `.vscode/`. It merges
the editor settings into `.vscode/settings.json` and appends the extension
recommendations to `.vscode/extensions.json`, both inherited from
dna_vscode. The parent layers add their guides and templates in `doc/`,
their skills in `.claude/skills/`, their scripts in `scripts/`, the quick
check workflow in `.github/workflows/`, and `CLAUDE.md` and the Prettier
configuration at the root.

In VS Code, the launch configuration "Test Current File" runs the open Dart
file, and the default build task `generate_lcov` measures the coverage of
the open test file.

## Guides

- `dna/doc/guides/update-dart-and-flutter-sdk-guide.md` — how to raise the
  Dart and Flutter SDK in all repos of the organization in one gg ticket:
  upgrade the SDK, apply the Dart fixes, upgrade the dependencies, then
  review and publish

## Configuration

- `dna/dot-vscode/settings.overrides.json` — the Dart editor settings:
  format on save and on type, the 80 column ruler, Dart-Code as formatter,
  the import fix on save and the test view on failures; merged into the
  settings of dna_vscode
- `dna/dot-vscode/extensions.overrides.json` — appends the Dart, Flutter
  and dart-import extensions to the recommendations of dna_vscode
- `dna/dot-vscode/launch.json` — the launch configuration "Test Current
  File"
- `dna/dot-vscode/tasks.json` — the default build task `generate_lcov`,
  which runs `dart run coverage:test_with_coverage` on the open file

## Scope

dna_dart carries only what is specific to Dart. The Dart code and test
rules come from dna_clean_code, every other topic from its own layer. It
lists neither dna_ggdna nor dna_helix: the authoring topic of DNA layers is
not part of it.

## Layers

`dna/_dna.json` lists these parents, applied in this order; dna_dart itself
is applied last:

- [dna_readme](https://github.com/ggdna/dna_readme) — the README guides
  and templates, the `/readme` skill and the README check script
- [dna_guides](https://github.com/ggdna/dna_guides) — the rules for
  writing guides and documentation, and the `/guide` skill
- [dna_translate](https://github.com/ggdna/dna_translate) — the rules that
  keep English and German documentation in sync, the German blog template
  and the `/translate` skill
- [dna_index](https://github.com/ggdna/dna_index) — the guide and the
  template of the `index.jsonc` that describes a repo, and the `/index`
  skill
- [dna_blog](https://github.com/ggdna/dna_blog) — the blog guide, the blog
  post template and the `/blog` skill
- [dna_install](https://github.com/ggdna/dna_install) — the install guides
  that set up a development machine, and the `/install` skill
- [dna_vscode](https://github.com/ggdna/dna_vscode) — the shared VS Code
  settings and extensions, the Prettier configuration and the `/vscode`
  skill
- [dna_clean_code](https://github.com/ggdna/dna_clean_code) — the code and
  test guides, language neutral and for Dart and TypeScript, and the
  `/code`, `/test`, `/review-light` and `/review-heavy` skills
- [dna_scripts](https://github.com/ggdna/dna_scripts) — the node scripts
  for the git and GitHub workflow, their shared functions and the
  `/scripts` skill
- [dna_gg](https://github.com/ggsuite/dna_gg) — the gg ticket workflow:
  the develop guides, `CLAUDE.md` and the `/gg` skills; it builds on
  dna_install, dna_index and dna_github, which adds the quick check
  workflow and the GitHub setup script

The two `*.overrides.json` files extend `.vscode/settings.json` and
`.vscode/extensions.json` of dna_vscode: the settings merge object by
object, the `recommendations+` key appends to the inherited list.

## Variables

- `dnaCopyrightHolder` — the holder named in the license header of every
  file
- `dnaCompany` — the company
- `dnaGitOrg` — the GitHub organization; the SDK update guide uses it as
  the name of the gg workspace and of the organization whose repos it adds
- `dnaGitOrgUrl` — the URL of that organization
- `dnaGitQuickCheckPipelineName` — the name of the quick check pipeline
  the branch rules require
- `dnaJiraPrefix` — the prefix of a ticket id

`dna/_vars.json` sets them to the values of ggdna for the instantiation of
this repo. `dna/_dna.json` lifts no duty the topic layers mark
`mustOverride`, so a repo listing dna_dart sets all six in its own
`dna/_vars.json`. `helix init` asks for them, and the DNA test names each
one that is missing.

## Development

The `dna/` folder is hand-authored source and is never generated. The repo
instantiates its own DNA — run `dart test` after changes; commit first, a
file the DNA would overwrite must not carry uncommitted work.

Edit the files below `dna/`, never their copies in `doc/`, `.claude/`,
`scripts/` and `.vscode/`: the test overwrites them. Dotfiles carry a
`dot-` prefix inside `dna/` and lose it when instantiated
(`dna/dot-vscode/` becomes `.vscode/`); without the escape
`dart pub publish` drops them, and the layer would reach consumers
incomplete. During development `gg_localize_refs` points the layer
dependencies at the local checkouts; the DNA configuration never holds
paths.

## License

MIT — see [LICENSE](LICENSE).
