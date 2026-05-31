# Homebrew Tap Release SOP

This SOP keeps the Homebrew distribution channel separate from the App and Ops repositories.

## Repository

- Remote: `https://github.com/jotr-ai/homebrew-apps`
- Public tap name: `jotr-ai/apps`
- Local working copy: `/Users/r-mac/Developer/jotr-homebrew-apps`

Do not store release binaries in this repository. The cask must point to immutable DMG URLs under `https://downloads.jotr.ai/releases/`.

## Release Inputs

Each public release needs:

- App version, for example `1.0.9`
- Build number, for example `11`
- Immutable DMG URL, for example `https://downloads.jotr.ai/releases/Jotr-1.0.9-build11.dmg`
- SHA256 of the published DMG
- Confirmation that the DMG is signed, notarized, uploaded, and downloadable

## Update Steps

1. Finish the App release SOP first.
2. Confirm the production DMG URL is immutable and returns HTTP 200.
3. Confirm the DMG SHA256 from the release record.
4. Update `Casks/jotr.rb`:
   - `version "<app_version>,<build_number>"`
   - `sha256 "<published_dmg_sha256>"`
5. Add or update the matching record under `docs/versions/`.
6. Run local validation:

```sh
brew tap jotr-ai/apps
brew audit --cask --strict --online jotr
brew install --cask --dry-run jotr
```

7. Commit and push to `main`.
8. Verify the public install command:

```sh
brew tap jotr-ai/apps
brew install --cask jotr
```

For a real install smoke test, use a clean machine or uninstall the existing app first.

## Retention Rule

Homebrew casks should reference immutable versioned DMG URLs. Do not point the cask at moving URLs such as `https://jotr.ai/download/mac`.

Because older cask revisions may still be checked out by users or caches, keep versioned DMGs referenced by this tap available longer than the website "current plus previous" rolling window.

## Safety Rules

- Do not add private release keys, signing profiles, Apple credentials, Cloudflare tokens, or backend secrets.
- Do not add App source code or backend infrastructure files.
- Do not add user data paths to `zap` unless they are confirmed safe to delete.
- Do not change App business logic from this repository.
