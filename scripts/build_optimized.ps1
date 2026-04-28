# Optimized Flutter Web build for GitHub Pages (Windows)
# Mirrors .github/workflows/deploy.yml core steps (base-href + service worker copy).

$ErrorActionPreference = "Stop"
$RepoRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
Set-Location $RepoRoot

Write-Host ">> flutter pub get"
flutter pub get

Write-Host ">> flutter clean"
flutter clean

Write-Host ">> flutter build web --release"
$defineArgs = @()
if ($env:FORMSPREE_ENDPOINT) {
  $defineArgs += "--dart-define=FORMSPREE_ENDPOINT=$($env:FORMSPREE_ENDPOINT)"
}
if ($env:CONTACT_RECIPIENT_EMAIL) {
  $defineArgs += "--dart-define=CONTACT_RECIPIENT_EMAIL=$($env:CONTACT_RECIPIENT_EMAIL)"
}
flutter build web `
  --release `
  --base-href "/Youssef-Hassan-Portfolio/" `
  --no-source-maps `
  @defineArgs

$webOut = Join-Path $RepoRoot "build\web"
if (-not (Test-Path $webOut)) {
  Write-Error "build/web not found after build."
}

Write-Host ">> Copy service worker / headers"
Copy-Item -Force (Join-Path $RepoRoot "web\service-worker.js") $webOut
if (Test-Path (Join-Path $RepoRoot "web\.htaccess")) {
  Copy-Item -Force (Join-Path $RepoRoot "web\.htaccess") $webOut
}
if (Test-Path (Join-Path $RepoRoot "web\_headers")) {
  Copy-Item -Force (Join-Path $RepoRoot "web\_headers") $webOut
}

New-Item -ItemType File -Path (Join-Path $webOut ".nojekyll") -Force | Out-Null

Write-Host ">> Done. Output: $webOut"
