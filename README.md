# 🍻 setchy's Homebrew Tap

[![Homebrew tap][homebrew-badge]][homebrew]
[![Renovate enabled][renovate-badge]][renovate]

A small tap for the Homebrew casks I build and maintain. Install with a single
command, upgrade with the usual Homebrew muscle memory.

## 📦 Install

```sh
brew install --cask setchy/brews/atlassify
```

Prefer to tap first? Same result, one fewer surprise later:

```sh
brew tap setchy/brews
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

## ⚙️ How this tap works

- **Casks live in [`Casks/`](Casks)** — one file per cask, named after the cask
  token (lowercase, hyphenated, e.g. `Casks/atlassify.rb`).
- **Versions are bumped by [Renovate](https://docs.renovatebot.com/)** — a
  custom regex manager watches upstream GitHub releases and opens a PR, which
  automerges once the new version is available.
- **Renovate config is validated in CI** — see
  [`.github/workflows/renovate.yml`](.github/workflows/renovate.yml).
- **Actions workflows are vetted with [zizmor](https://github.com/zizmorcore/zizmor)** —
  workflow dependencies are hash-pinned, not tag-pinned.

## 🧩 Adding or changing a cask

1. Drop the cask in `Casks/<token>.rb`.
2. Check it locally:

   ```sh
   brew audit --cask --new Casks/<token>.rb
   brew style Casks/<token>.rb
   brew install --cask ./Casks/<token>.rb
   ```

3. Open a PR — CODEOWNERS routes it to [@setchy](https://github.com/setchy).

If the app ships its own updater, `sha256 :no_check` plus `auto_updates true`
is the pragmatic combination (as `atlassify` does). Otherwise, let Renovate
manage the checksum from the release assets.

## 💬 Questions?

Open an [issue](https://github.com/setchy/homebrew-brews/issues) or send a PR.
Bugs in an app itself belong in that app's upstream repository.

<!-- LINK LABELS -->
[homebrew]: https://github.com/setchy/homebrew-brews
[homebrew-badge]: https://img.shields.io/badge/Homebrew-setchy%2Fbrews-FBB040?logo=homebrew&logoColor=white
[renovate]: https://github.com/setchy/homebrew-brews/issues/2
[renovate-badge]: https://img.shields.io/badge/renovate-enabled-brightgreen.svg?logo=renovate&logoColor=white
