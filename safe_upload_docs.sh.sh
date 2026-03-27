#!/bin/bash
# ------------------------------
# safe_upload_docs.sh
# Push your technical-writing-samples portfolio to GitHub
# ------------------------------

# Config
GITHUB_REPO="https://github.com/chris007-s/technical-writing-samples.git"
BRANCH="main"

# Move to repo folder
cd ~/Downloads/technical-writing-samples/technical-writing-samples/ || exit

# Initialize git if not already
if [ ! -d ".git" ]; then
    echo "Initializing git repository..."
    git init
fi

# Set global identity (skip if already done)
git config --global user.name "Christo Bakas"
git config --global user.email "christo.bakas2@gmail.com"

# Add remote if missing
if ! git remote | grep origin > /dev/null; then
    git remote add origin $GITHUB_REPO
fi

# Stage all changes
git add .

# Commit changes (ignore if nothing new)
git commit -m "Add product and internal documentation samples" 2>/dev/null || echo "No changes to commit"

# Rename branch to main
git branch -M $BRANCH

# Force push to ensure local files overwrite remote safely
echo "Pushing to GitHub... You will be prompted for your username and PAT."
git push -u origin $BRANCH --force

echo "✅ Upload complete! Use your GitHub username and Personal Access Token (PAT) when prompted."
