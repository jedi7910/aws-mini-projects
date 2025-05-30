# Common Utilities

This folder contains common utility scripts and resources shared across multiple projects.

## setup_dev_env.sh

A bash script to quickly bootstrap and configure your development environment for AWS-focused projects on Linux (tested on Ubuntu/WSL).

### Features

- System update and upgrade
- Installs essential tools: AWS CLI, Git, curl, unzip, Python3, and pip
- Creates base project directories under `~/aws-mini-projects`
- Configures Git global settings (username, email, editor, default branch)
- Adds helpful command aliases to your `~/.bashrc`
- Reloads shell configuration automatically

### Usage

```bash
chmod +x setup_dev_env.sh
./setup_dev_env.sh
```
Follow the prompts for Git user configuration if not already set.

## Notes
- Designed for Ubuntu-bases systems and WSL
- Modify the script as needed to add more tools or project folders
- Run this script whenever setting up a new development machine or environment

## Contribution
Feel free to fork and submit pull requests with improvements or additional setup tasks.