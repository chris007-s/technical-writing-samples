#!/bin/bash
# setup_and_push_docs.sh
# Safe, one-command setup for your technical writing portfolio repo

# --- CONFIGURE ---
GITHUB_REPO_URL="https://github.com/chris007-s/technical-writing-samples.git"
COMMIT_MSG="Add product and internal documentation samples"
BRANCH_NAME="main"

echo "Starting repo setup..."

# Step 1: Remove any existing outer Git repo to avoid nested repo issues
if [ -d ".git" ]; then
    echo "Removing existing .git folder..."
    rm -rf .git
fi

# Step 2: Ensure docs are in the current folder
echo "Ensuring all docs are in repo root..."
# Adjust paths if your docs are in subfolders outside current dir
for folder in product-docs internal-docs; do
    if [ -d "../$folder" ]; then
        mv ../$folder ./
        echo "Moved $folder into repo root"
    fi
done

# Step 3: Initialize new Git repo
echo "Initializing new Git repository..."
git init
git branch -M $BRANCH_NAME

# Step 4: Add remote
git remote remove origin 2>/dev/null
git remote add origin $GITHUB_REPO_URL

# Step 5: Stage all files
echo "Adding files..."
git add .

# Step 6: Commit
echo "Committing..."
git commit -m "$COMMIT_MSG"

# Step 7: Push to GitHub
echo "Pushing to GitHub..."
git push -u origin $BRANCH_NAME --force

echo "✅ Repo setup and push complete!"
echo "Use your GitHub username and Personal Access Token (PAT) if prompted."
