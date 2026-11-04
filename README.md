# 🍻 setchy's Homebrew Tap

[![Homebrew tap][homebrew-badge]][homebrew]
[![Renovate enabled][renovate-badge]][renovate]
[![Cask lint][cask-lint-badge]][cask-lint]

A small tap for the Homebrew casks I build and maintain. Install with a single
command, upgrade with the usual Homebrew muscle memory.

## 📦 Install

```sh
brew install --cask setchy/brews/atlassify
```

Homebrew only trusts non-official casks that you install by their fully
qualified name or trust explicitly.

Prefer to tap first?

```sh
brew tap setchy/brews
brew trust --cask setchy/brews/atlassify
brew install --cask atlassify
```

## 🍺 On tap

| Cask | Description | Upstream |
| --- | --- | --- |
| [`atlassify`](Casks/atlassify.rb) | Atlassian notifications in your menu bar | [setchy/atlassify](https://github.com/setchy/atlassify) |

## 🔄 Keeping things fresh

```sh
brew update
brew upgrade --cask atlassify
```

Want the newest build as soon as it ships? Homebrew won't always know about it
straight away — refresh the tap metadata first:

```sh
brew update && brew upgrade --cask atlassify
```

## 🤝 Contributing

Cask changes and new casks are welcome. See [`CONTRIBUTING.md`](CONTRIBUTING.md)
for the repository layout, local checks and release automation.

Versions are bumped automatically by [Renovate](https://docs.renovatebot.com/),
so manual version-only PRs aren't needed.

## 💬 Questions?

Open an [issue](https://github.com/setchy/homebrew-brews/issues) or send a PR.
Bugs in an app itself belong in that app's upstream repository.

<!-- LINK LABELS -->
[cask-lint]: https://github.com/setchy/homebrew-brews/actions/workflows/cask-lint.yml
[cask-lint-badge]: https://img.shields.io/github/actions/workflow/status/setchy/homebrew-brews/cask-lint.yml?branch=main&label=cask%20lint&logo=homebrew&logoColor=white
[homebrew]: https://github.com/setchy/homebrew-brews
[homebrew-badge]: https://img.shields.io/badge/Homebrew-setchy%2Fbrews-FBB040?logo=homebrew&logoColor=white
[renovate]: https://github.com/setchy/homebrew-brews/issues/2
[renovate-badge]: https://img.shields.io/badge/renovate-enabled-brightgreen.svg?logo=renovate&logoColor=white
