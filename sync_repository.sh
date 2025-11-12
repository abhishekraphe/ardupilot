#!/bin/bash
# Script to complete the ArduPilot repository sync
# This script should be run with proper GitHub authentication

set -e  # Exit on error

echo "ArduPilot Repository Sync Script"
echo "================================="
echo ""

# Check if we're in the right directory
if [ ! -d ".git" ]; then
    echo "Error: Not in a git repository. Please run this script from the repository root."
    exit 1
fi

# Verify upstream remote exists
if ! git remote | grep -q "^upstream$"; then
    echo "Error: Upstream remote not found. Please run the setup first."
    exit 1
fi

echo "Step 1: Checking out master branch..."
if git show-ref --verify --quiet refs/heads/master; then
    git checkout master
    echo "✓ Master branch exists, checked out"
else
    echo "Creating master branch from upstream/master..."
    git checkout -b master upstream/master
    echo "✓ Master branch created"
fi

echo ""
echo "Step 2: Ensuring master is up to date with upstream..."
git fetch upstream master
git reset --hard upstream/master
echo "✓ Master branch synchronized with upstream"

echo ""
echo "Step 3: Pushing master branch to origin..."
if git push origin master --verbose; then
    echo "✓ Master branch pushed successfully"
else
    echo "✗ Failed to push master branch"
    echo "Please ensure you have push access to the repository"
    exit 1
fi

echo ""
echo "Step 4: Pushing all tags to origin..."
if git push origin --tags --verbose; then
    echo "✓ All tags pushed successfully"
else
    echo "✗ Failed to push tags"
    echo "Please ensure you have push access to the repository"
    exit 1
fi

echo ""
echo "Step 5: Verifying sync..."
echo "Fetching from origin to verify..."
git fetch origin

# Count tags on origin
ORIGIN_TAGS=$(git ls-remote --tags origin | wc -l)
UPSTREAM_TAGS=$(git tag | wc -l)

echo "Tags on upstream: $UPSTREAM_TAGS"
echo "Tags pushed to origin: $ORIGIN_TAGS"

echo ""
echo "================================="
echo "Sync completed successfully!"
echo "================================="
echo ""
echo "Your forked repository is now synchronized with the upstream ArduPilot repository."
echo "Master branch and all tags have been pushed."
echo ""
echo "You can verify the sync at: https://github.com/abhishekraphe/ardupilot"
