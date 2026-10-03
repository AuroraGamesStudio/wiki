cd $PSScriptRoot
git add -A
$stat = git diff --cached --stat
if ([string]::IsNullOrWhiteSpace($stat)) {
    Write-Host "No changes to commit."
    exit 0
}
git commit -m $args[0]
git push origin main
Write-Host "Push complete."
