# Jotr Homebrew Tap

This repository is the public Homebrew tap for Jotr.

## Install

```sh
brew tap jotr-ai/apps
brew install --cask jotr
```

## Update

Jotr includes its own in-app updater. This tap is updated for each public release so new Homebrew installs receive the latest signed and notarized DMG.

```sh
brew update
brew upgrade --cask --greedy jotr
```

## Repository Scope

This repository only contains Homebrew distribution metadata:

- `Casks/jotr.rb`
- release process notes under `docs/`
- public version records under `docs/versions/`

Jotr app source code, backend infrastructure, private signing assets, and release binaries are not stored here.

## Links

- Website: https://jotr.ai/
- Download: https://jotr.ai/download/mac
- Direct release asset: https://downloads.jotr.ai/releases/Jotr-1.0.9-build11.dmg
