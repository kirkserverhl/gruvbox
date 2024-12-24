#!/bin/bash

# Variables
DOTFILES_DIR="$HOME/.dotfiles"
REPO_DIR="$DOTFILES_DIR"
GITHUB_USERNAME="kirkserverhl" # Replace with your GitHub username
REPO_NAME="dotfiles"           # Replace with your GitHub repo name

# Navigate to the dotfiles directory
if [ ! -d "$REPO_DIR" ]; then
    echo "Error: Directory $REPO_DIR does not exist."
    exit 1
fi

cd "$REPO_DIR" || exit

# Check if the directory is a Git repository
if [ ! -d ".git" ]; then
    echo "Initializing a new Git repository."
    git init
    git remote add origin "https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"
fi

# Add changes to git
echo "Adding changes..."
git add .

# Commit changes
echo "Committing changes..."
COMMIT_MSG="Update: $(date)"
git commit -m "$COMMIT_MSG"

# Push changes to GitHub
echo "Pushing changes to GitHub..."
git branch --show-current &>/dev/null || git branch -M main
git push -u origin main

echo "Push completed successfully!"

