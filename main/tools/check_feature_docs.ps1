param(
    [switch]$StagedOnly
)

$ErrorActionPreference = "Stop"

$projectRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
$diffArgs = @("diff", "--name-only")

if ($StagedOnly) {
    $diffArgs += "--cached"
} else {
    $diffArgs += "HEAD"
}

$diffArgs += "--"
$diffArgs += "."

try {
    $changedFiles = git -C $projectRoot @diffArgs
} catch {
    Write-Host "Unable to read git diff. Run this check from a git worktree."
    exit 1
}

if (-not $changedFiles) {
    Write-Host "No changed files detected in main/."
    exit 0
}

$featureFilePattern = "^(main/)?(Scenes|Scripts|ui|art|data)/"
$docFilePattern = "^(main/)?docs/product/(feature-ledger|game-vision)\.md$"

$featureFiles = @($changedFiles | Where-Object { $_ -match $featureFilePattern })
$docFiles = @($changedFiles | Where-Object { $_ -match $docFilePattern })

if ($featureFiles.Count -gt 0 -and $docFiles.Count -eq 0) {
    Write-Host "Feature-facing files changed without a product documentation update:"
    $featureFiles | ForEach-Object { Write-Host " - $_" }
    Write-Host ""
    Write-Host "Update docs/product/feature-ledger.md before finishing."
    Write-Host "If the core fantasy, tone, setting, or art direction changed, update docs/product/game-vision.md too."
    exit 1
}

Write-Host "Feature documentation check passed."
