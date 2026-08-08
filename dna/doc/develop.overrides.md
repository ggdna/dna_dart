## [@updateDependencies] Update dependencies

```bash
dart pub upgrade
```

## [@increaseVersion] Increase version

Increase the `version:` field in `pubspec.yaml` and commit:

```bash
git commit -am"Increase version"
```

## [@runTestsAndBuild] Run tests and build

```bash
dart analyze
dart test
```

## [@publish] Publish

Make sure `CHANGELOG.md` mentions the new version. Then:

```bash
dart pub publish --dry-run
dart pub publish
```
