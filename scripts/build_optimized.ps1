# Optimized Flutter Web build for production (Windows).
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
if ($env:SITE_BASE_URL) {
  $defineArgs += "--dart-define=SITE_BASE_URL=$($env:SITE_BASE_URL)"
}
flutter build web `
  --release `
  --base-href "/" `
  --no-source-maps `
  @defineArgs

$webOut = Join-Path $RepoRoot "build\web"
if (-not (Test-Path $webOut)) {
  Write-Error "build/web not found after build."
}

Write-Host ">> Copy service worker / headers / vercel.json"
Copy-Item -Force (Join-Path $RepoRoot "web\service-worker.js") $webOut
if (Test-Path (Join-Path $RepoRoot "web\.htaccess")) {
  Copy-Item -Force (Join-Path $RepoRoot "web\.htaccess") $webOut
}
if (Test-Path (Join-Path $RepoRoot "web\_headers")) {
  Copy-Item -Force (Join-Path $RepoRoot "web\_headers") $webOut
}
Copy-Item -Force (Join-Path $RepoRoot "vercel.json") $webOut

Write-Host ">> Done. Output: $webOut"
