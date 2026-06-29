# Discover Improvements Script (PowerShell)
# Finds improvements made to orchestration system in product repos
# and prepares them to be shared back to template repo
#
# Usage: ./discover-improvements.ps1 [-OutputFile FILE] [-GeneratePatch] [-CompareBranch BRANCH]
# Examples:
#   ./discover-improvements.ps1
#   ./discover-improvements.ps1 -OutputFile my-improvements.md -GeneratePatch

param(
    [string]$OutputFile = "improvements.md",
    [switch]$GeneratePatch = $false,
    [string]$CompareBranch = "origin/main",
    [string]$TemplateRepo = "https://github.com/karanbathijawork/ai-software-company.git",
    [string]$TemplateDir = "$env:TEMP\ai-software-company-template"
)

# Color helpers
function Write-Success { Write-Host $args -ForegroundColor Green }
function Write-Info { Write-Host $args -ForegroundColor Cyan }
function Write-Warning { Write-Host $args -ForegroundColor Yellow }
function Write-Error { Write-Host $args -ForegroundColor Red }

# Directories that contain orchestration system (not product code)
$OrchestrationDirs = @(
    "agents/",
    "templates/",
    "workflows/",
    "checklists/",
    "knowledge/",
    "skills/",
    "ai/",
    "mcp/",
    "memory/",
    "docs/getting-started/",
    "docs/architecture/",
    "ORCHESTRATION_SETUP_GUIDE.md",
    "START_BUILD.md",
    "CHOOSE_YOUR_PATH.md",
    "CLEANUP_MANIFEST.md",
    "CLEANUP_PHASE_SUMMARY.md"
)

Write-Info "════════════════════════════════════════════════════════"
Write-Info "Discovering Improvements"
Write-Info "════════════════════════════════════════════════════════"
Write-Host ""

# Get current directory
$ProductRepo = (Get-Location).Path
$ProductName = Split-Path $ProductRepo -Leaf

Write-Warning "Product repo: " -NoNewline
Write-Host $ProductRepo
Write-Warning "Comparing against: " -NoNewline
Write-Host $CompareBranch
Write-Warning "Template repo: " -NoNewline
Write-Host $TemplateRepo
Write-Host ""

# Check if we're in a git repo
if (-not (Test-Path ".git")) {
    Write-Error "Error: Not a git repository"
    exit 1
}

# Clone or update template repo
if (-not (Test-Path $TemplateDir)) {
    Write-Warning "Cloning template repo..."
    git clone --quiet $TemplateRepo $TemplateDir 2>$null
} else {
    Write-Warning "Updating template repo..."
    Push-Location $TemplateDir
    git pull --quiet origin main 2>$null
    Pop-Location
}

Write-Host ""
Write-Info "Scanning for improvements..."
Write-Host ""

# Collect all changes
$ImprovementsFound = 0
$ImprovementsData = @()

# For each orchestration directory, find changes
foreach ($dir in $OrchestrationDirs) {
    # Check if directory/file exists
    if (Test-Path $dir) {
        $TemplatePath = Join-Path $TemplateDir $dir

        # Get diff between template and current
        $Diff = & git diff --no-color $TemplatePath $dir 2>$null

        if ($Diff) {
            $ImprovementsFound++

            # Count lines changed
            $Added = ($Diff | Select-String "^\+" | Measure-Object).Count
            $Removed = ($Diff | Select-String "^-" | Measure-Object).Count

            Write-Success "✓" -NoNewline
            Write-Host " $dir"
            Write-Warning "  Added: " -NoNewline
            Write-Host "$Added lines" -NoNewline
            Write-Warning ", Removed: " -NoNewline
            Write-Host "$Removed lines"

            # Collect data for markdown report
            $DiffPreview = ($Diff | Select-Object -First 20 | Out-String)
            $ImprovementsData += [PSCustomObject]@{
                Directory = $dir
                Added = $Added
                Removed = $Removed
                Diff = $DiffPreview
            }
        }
    }
}

Write-Host ""
Write-Info "════════════════════════════════════════════════════════"

if ($ImprovementsFound -eq 0) {
    Write-Warning "No improvements found in orchestration system"
    exit 0
}

Write-Success "✓ Found $ImprovementsFound improvements"
Write-Host ""

# Generate markdown report
Write-Warning "Generating improvement report..."

$MarkdownContent = @"
# Improvements from $ProductName

**Date:** $(Get-Date -Format 'yyyy-MM-dd')
**Product:** $ProductName
**Template Branch:** $CompareBranch
**Status:** Ready for review

---

## Summary

Found $ImprovementsFound improvements to orchestration system.

These changes improve the system for future products.

---

## Improvements

"@

foreach ($improvement in $ImprovementsData) {
    $MarkdownContent += @"
### $($improvement.Directory)

**Lines changed:** +$($improvement.Added) / -$($improvement.Removed)

\`\`\`diff
$($improvement.Diff)
\`\`\`

---

"@
}

$MarkdownContent += @"
## How to Share Back

1. Create a branch: `git checkout -b improvements/from-$ProductName`
2. Review changes and commit them
3. Create PR at: https://github.com/karanbathijawork/ai-software-company/pulls
4. Include this report in PR description

---

## Checklist

- [ ] Changes are tested in $ProductName build
- [ ] Changes don't include product-specific code
- [ ] Changes improve system for all future products
- [ ] Documentation is clear
- [ ] No secrets or sensitive data included

---

**Template repo:** https://github.com/karanbathijawork/ai-software-company

"@

# Write to file
$MarkdownContent | Out-File -Encoding UTF8 $OutputFile
Write-Success "✓ Report saved to: $OutputFile"

# Generate patch if requested
if ($GeneratePatch) {
    $PatchFile = $OutputFile -replace "\.md$", ".patch"
    Write-Warning "Generating patch file..."

    # Create improvements branch if it doesn't exist
    $BranchExists = & git show-ref --quiet refs/heads/improvements/auto-discovered 2>$null

    if ($LASTEXITCODE -ne 0) {
        git checkout -b improvements/auto-discovered 2>$null
    } else {
        git checkout improvements/auto-discovered 2>$null
    }

    # Create patch for orchestration changes only
    $PatchContent = ""
    foreach ($dir in $OrchestrationDirs) {
        if (Test-Path $dir) {
            $Diff = & git diff $CompareBranch -- $dir 2>$null
            $PatchContent += $Diff + "`n"
        }
    }

    $PatchContent | Out-File -Encoding UTF8 $PatchFile
    Write-Success "✓ Patch saved to: $PatchFile"
    Write-Warning "To apply patch in template repo:"
    Write-Host "  git apply $PatchFile"
}

Write-Host ""
Write-Info "════════════════════════════════════════════════════════"
Write-Success "Next steps:"
Write-Host ""
Write-Host "1. Review the improvements report:"
Write-Info "   Get-Content $OutputFile"
Write-Host ""
Write-Host "2. Create improvements branch:"
Write-Info "   git checkout -b improvements/from-$ProductName"
Write-Host ""
Write-Host "3. Commit improvements:"
Write-Info "   git add agents/ templates/ workflows/ ..."
Write-Info "   git commit -m 'Improvements: [describe changes]'"
Write-Host ""
Write-Host "4. Create PR at template repo:"
Write-Info "   https://github.com/karanbathijawork/ai-software-company/pulls"
Write-Host ""
Write-Info "════════════════════════════════════════════════════════"

# Cleanup
if (Test-Path $TemplateDir) {
    Remove-Item -Recurse -Force $TemplateDir 2>$null
}

Write-Host ""
Write-Success "✓ Discovery complete!"
