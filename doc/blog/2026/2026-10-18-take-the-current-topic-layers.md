<!--
@license
Copyright (c) ggdna

Use of this source code is governed by terms that can be
found in the LICENSE file in the root of this package.
-->

# Take the current topic layers

## Motivation

- `dna_dart` is the Dart layer: it combines the ggdna topic layers with
  what is special about Dart projects.
- Its topic layers were several minor versions behind. Repos built on it
  missed, among others, the scoped blog rules of the blog layer.
- The goal: `dna_dart` passes on the current state of every topic layer.

## Strategy

- Raise all ggdna topic layers and helix to their current versions
- Set the organization variables the newer layers require
- Let the DNA test instantiate and verify the result

## Implementation 1: Raise the topic layers

- `dna_readme`, `dna_guides`, `dna_translate`, `dna_index`, `dna_blog`,
  `dna_install`, `dna_vscode`, `dna_clean_code`, `dna_scripts` and
  `dna_gg` are raised to their current versions, `helix` to 1.12
- The instantiated guides, templates, skills and scripts of this repo are
  regenerated from them

## Implementation 2: Organization variables

- The newer topic layers mark the organization variables `mustOverride`:
  `dnaCopyrightHolder`, `dnaCompany`, `dnaGitOrg`, `dnaGitOrgUrl`,
  `dnaGitQuickCheckPipelineName` and `dnaJiraPrefix`
- `dna_dart` now sets them in its own `dna/_vars.json`, with the values
  of its own organization ggdna
- The duty is passed on: every layer built on `dna_dart` sets these
  variables in its own `dna/_vars.json`; the DNA test names each missing
  one

## Dependency updates

- `dna_blog` 0.3.0: one post per repo, only its own changes and what
  updated dependencies changed for it, no mention of the repos that use
  it; posts are filed under `doc/blog/<yyyy>`
- `dna_translate` 0.3.0: german posts are filed under
  `doc/de/blog/<yyyy>`
- `dna_gg` 0.10.0: the publish step runs `/blog` in every repo of the
  ticket that has the blog guide
- `helix` 1.12: enforces `mustOverride`, which is why the variables above
  had to be set
- The other topic layers bring their updated guides, skills and scripts

## Open Points

- Layers built on `dna_dart` must set the six organization variables
  before they can take this version, so it is released as a major
  version
