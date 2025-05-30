#!/bin/bash

set -euo pipefail

echo "🔧 Updating system packages..."
sudo apt update && sudo apt upgrade -y

echo "📦 Installing essentials (awscli, git, curl, unzip, python3, pip)..."
sudo apt install -y awscli git curl unzip python3 python3-pip

# Define project folders
PROJECT_ROOT=~/aws-mini-projects
PROJECT_FOLDERS=(s3 ec2 iam lambda common)

echo "📁 Creating project directories under $PROJECT_ROOT..."
for folder in "${PROJECT_FOLDERS[@]}"; do
  mkdir -p "$PROJECT_ROOT/$folder"
done

echo "⚙️ Configuring Git global settings..."
# Only set if not already configured
git_user_name=$(git config --global user.name || echo "")
git_user_email=$(git config --global user.email || echo "")

if [ -z "$git_user_name" ]; then
  read -rp "Enter your Git user.name: " input_name
  git config --global user.name "$input_name"
fi

if [ -z "$git_user_email" ]; then
  read -rp "Enter your Git user.email: " input_email
  git config --global user.email "$input_email"
fi

git config --global core.editor "code --wait"
git config --global init.defaultBranch main

echo "💡 Adding helpful aliases to ~/.bashrc (if not present)..."
ALIASES=(
  "alias awsproj='cd ~/aws-mini-projects && ls'"
  "alias ..='cd ..'"
  "alias ll='ls -la'"
)

for alias_cmd in "${ALIASES[@]}"; do
  if ! grep -Fxq "$alias_cmd" ~/.bashrc; then
    echo "$alias_cmd" >> ~/.bashrc
  fi
done

echo "🧽 Reloading shell config..."
source ~/.bashrc

echo "✅ Development environment setup is complete!"
