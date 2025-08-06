# Void Builder

This is a fork of VSCodium, which has a nice build pipeline that we're using for Void. Big thanks to the CodeStory team for inspiring this.

The purpose of this VSCodium fork is to run [Github Actions](https://github.com/voideditor/void-builder/actions). These actions build all the Void assets (.dmg, .zip, etc), store these binaries on a release in [`voideditor/binaries`](https://github.com/voideditor/binaries/releases), and then set the latest version in a text file on [`voideditor/versions`](https://github.com/voideditor/versions) so Void knows how to update to the latest version.

The  `.patch` files from VSCodium get rid of telemetry in Void (the core purpose of VSCodium) and change VSCode's auto-update logic so updates are checked against `void` and not `vscode` (we just had to swap out a few URLs). These files are applied when the workflow runs and they're almost entirely straight from VSCodium, minus a few renames to Void.

## Notes

- For an extensive list of all the places we edited inside of this VSCodium fork, search "Void" and "voideditor". We also deleted some workflows we're not using in this VSCodium fork (insider-* and stable-spearhead).

- The workflow that builds Void for Mac is called `stable-macos.sh`. We added some comments so you can understand what's going on. Almost all the code is straight from VSCodium. The Linux and Windows files are very similar.

- If you want to build and compile Void yourself, you just need to fork this repo and run the GitHub Workflows. If you want to handle auto updates too, just search for "Void" and "voideditor" and replace them with your own repo.


