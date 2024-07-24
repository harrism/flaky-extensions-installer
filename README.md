# VSCode Extension Installer for Unreliable Networks

When using a Dev Container in vscode on a remote server with an unreliable network connection,
I often get network connection resets in the middle of installing extensions.
VSCode Dev Containers attempt to batch install extensions, and when one fails, it stops
installing the rest. So I was ending up with incomplete extensions when rebuilding the
dev container.

This script takes a simple text file with a list of vscode extension names, and installs
them one at a time, retrying multiple times upon failure. I find that this approach is sufficient to get all the extensions successfully installed.

## Usage

Modify the file `extensions.txt` to contain your list of extensions. Run the script
inside the Dev Container (it should also work on bare metal vscode):

```
$ ./install.sh
```

To uninstall all extensions in the list:

```
$ ./uninstall.sh
```
