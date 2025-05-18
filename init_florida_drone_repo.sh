#!/bin/bash
set -e

REPO_NAME="FloridaAmphibiousDrone"

# Create repository directory if it doesn't exist
[ -d "$REPO_NAME" ] || mkdir "$REPO_NAME"
cd "$REPO_NAME"

# Create project sub-directories
mkdir -p docs hardware firmware edge-compute cloud-server frontend simulations scripts test assets config

# Create README and LICENSE
printf '# Florida Amphibious Drone Project\n' > README.md
printf 'MIT License\n' > LICENSE

# Generate .gitignore
cat > .gitignore <<'GI'
# Python
__pycache__/
*.py[cod]
venvs

# Node/TypeScript
node_modules/
dist/
npm-debug.log*

# Arduino build artifacts
*.ino.*
*.elf
*.hex

# Jetson/AI / ML artifacts
*.log
*.pth
runs/
wandb/

# Cloud/IaC secrets
*.tfstate
*.pem
secrets.json
config.env

# OS cruft
.DS_Store
Thumbs.db
GI

# Initialize git repo and commit
[ -d .git ] || git init
git add .
if ! git diff --cached --quiet; then
  git commit -m "Initial commit with project structure and .gitignore"
fi

# Create GitHub repository and push
if ! git remote | grep -q origin; then
  gh repo create "$REPO_NAME" --public --source=. --remote=origin --push
else
  git push origin main 2>/dev/null || git push -u origin main
fi

# Success message
echo "✅ Repository '$REPO_NAME' has been created and pushed to GitHub!"

