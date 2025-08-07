# Void Builder

This is a fork of VSCodium, which has a nice build pipeline that we're using for Void. Big thanks to the CodeStory team for inspiring this.

The purpose of this VSCodium fork is to run [Github Actions](https://github.com/voideditor/void-builder/actions). These actions build all the Void assets (.dmg, .zip, etc), store these binaries on a release in [`voideditor/binaries`](https://github.com/voideditor/binaries/releases), and then set the latest version in a text file on [`voideditor/versions`](https://github.com/voideditor/versions) so Void knows how to update to the latest version.

The  `.patch` files from VSCodium get rid of telemetry in Void (the core purpose of VSCodium) and change VSCode's auto-update logic so updates are checked against `void` and not `vscode` (we just had to swap out a few URLs). These changes described by the `.patch` files are applied to `void/` during the workflow run, and they're almost entirely straight from VSCodium, minus a few renames to Void.

## Notes

- For an extensive list of all the places we edited inside of this VSCodium fork, search "Void" and "voideditor". We also deleted some workflows we're not using in this VSCodium fork (insider-* and stable-spearhead).

- The workflow that builds Void for Mac is called `stable-macos.sh`. We added some comments so you can understand what's going on. Almost all the code is straight from VSCodium. The Linux and Windows files are very similar.

- If you want to build and compile Void yourself, you just need to fork this repo and run the GitHub Workflows. If you want to handle auto updates too, just search for caps-sensitive "Void" and "voideditor" and replace them with your own repo.

## Rebasing
- We often need to rebase `void` and `void-builder` onto `vscode` and `vscodium` to keep our build pipeline working when deprecations happen, but this is pretty easy. All the changes we made in `void/` are commented with the caps-sensitive word "Void" (except our images, which need to be done manually), so rebasing just involves copying the `vscode/` repo and searching "Void" to re-make all our changes. The same exact thing holds for copying the `vscodium/` repo onto this repo and searching "Void" and "voideditor" to keep our changes. Just make sure the vscode and vscodium versions align.
