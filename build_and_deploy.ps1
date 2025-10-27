#!/usr/bin/env pwsh
# Build and Deploy Script for Personal Portfolio
# This script builds the Flutter web app and prepares it for deployment

Write-Host "🧹 Cleaning previous build..." -ForegroundColor Cyan
flutter clean

Write-Host "`n📦 Getting dependencies..." -ForegroundColor Cyan
flutter pub get

Write-Host "`n🔨 Building optimized web app..." -ForegroundColor Cyan
flutter build web --release --base-href "/Personal-Portfolio/" --no-source-maps --output=docs

Write-Host "`n📋 Copying additional files..." -ForegroundColor Cyan
Copy-Item "web/service-worker.js" "docs/" -Force -ErrorAction SilentlyContinue
Copy-Item "web/.htaccess" "docs/" -Force -ErrorAction SilentlyContinue
Copy-Item "web/_headers" "docs/" -Force -ErrorAction SilentlyContinue

Write-Host "`n📊 Build Statistics:" -ForegroundColor Yellow
$size = (Get-ChildItem docs -Recurse | Measure-Object -Property Length -Sum).Sum / 1MB
Write-Host "Total size: $([math]::Round($size, 2)) MB" -ForegroundColor Green

# Check for large images
$largeImages = Get-ChildItem assets/images -Recurse -File -Include *.png,*.jpg,*.jpeg | Where-Object { $_.Length -gt 500KB }
if ($largeImages.Count -gt 0) {
    Write-Host "`n⚠️  Found $($largeImages.Count) large images (>500KB):" -ForegroundColor Yellow
    $largeImages | Select-Object -First 5 | ForEach-Object {
        $sizeKB = [math]::Round($_.Length/1KB, 0)
        Write-Host "   - $($_.Name) ($sizeKB KB)" -ForegroundColor Gray
    }
    Write-Host "`n💡 Run .\optimize_images.ps1 for compression tips" -ForegroundColor Cyan
}

Write-Host "`n✅ Build completed successfully!" -ForegroundColor Green
Write-Host "`nNext steps:" -ForegroundColor Cyan
Write-Host "  1. git add ." -ForegroundColor White
Write-Host "  2. git commit -m 'Update code and rebuild docs'" -ForegroundColor White
Write-Host "  3. git push origin master" -ForegroundColor White
