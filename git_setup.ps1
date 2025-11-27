# Git setup script for SBM documentation
$ErrorActionPreference = "Stop"

# Get the script directory
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
$sbmPath = $scriptPath

Write-Host "Initializing git repository in: $sbmPath"

# Change to SBM directory
Set-Location $sbmPath

# Initialize git if not already initialized
if (-not (Test-Path ".git")) {
    git init
    Write-Host "Git repository initialized"
} else {
    Write-Host "Git repository already exists"
}

# Add all files
git add .
Write-Host "Files added to staging"

# Create initial commit
git commit -m "Initial commit: SBM documentation and meeting preparation files"
Write-Host "Initial commit created"

# Add remote if not exists
$remoteExists = git remote | Select-String -Pattern "origin"
if (-not $remoteExists) {
    git remote add origin https://github.com/rs-vynt/sbm_doc.git
    Write-Host "Remote 'origin' added"
} else {
    Write-Host "Remote 'origin' already exists"
    git remote set-url origin https://github.com/rs-vynt/sbm_doc.git
}

# Set main branch
git branch -M main
Write-Host "Branch set to 'main'"

# Push to remote
Write-Host "Pushing to remote repository..."
git push -u origin main
Write-Host "Done!"

