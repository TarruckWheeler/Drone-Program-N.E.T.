# Drone Program N.E.T.

This repository is intended to hold automation scripts for initializing a new Drone Program N.E.T. project. The script interacts with the GitHub CLI to create and populate repositories.

## Prerequisites
- [GitHub CLI](https://cli.github.com/) (`gh`) installed and authenticated. Run `gh auth login` if you haven't already.
- `git` installed.
- A Unix-like shell capable of running Bash scripts.

## Usage
1. Clone this repository.
2. Execute the setup script from the repository root:
   ```bash
   ./setup.sh <repository-name>
   ```
   Replace `<repository-name>` with the desired GitHub repository name.

The script will create the specified repository under your GitHub account and push initial files to it.
