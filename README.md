# Void Builder

This is a fork of VSCodium, which has a nice build pipeline that we're using for Void.

Big thanks to the CodeStory team for inspiring this.

## What it does

This repo hosts GitHub Actions. These actions build all the Void assets (.dmg, .zip, etc), and then they store them on a release in the [`voideditor/binaries`](https://github.com/voideditor/binaries/releases) repo, and then they set the latest version in the [`voideditor/versions`](https://github.com/voideditor/versions) repo so the versions can be tracked for updating.

## Auto-updates in Void

VSCodium comes with `.patch` files, including relevant ones to auto-updating, that we manually applied to the `void` repo. See the `.patch` files for more info. 
Also see `abstractUpdateService.ts` in the `void` repo, and look for "updateUrl" and "downloadUrl" in `void-builder`.

The only version that matters for updating is the version in `versions/`. The order of releases in `releases/`, for example, doesn't matter. There is also no comparison between version numbers anywhere; e.g. 1.0.2 is never compared to 1.0.3 and "not updated" because it's a lower version.  

## Docs

See `stable-macos.sh` for one of the main Actions with some comments added by the Void team.

Actions like `stable-macos.sh` run when we manually run them (this might change in the future and be listener-based).

