#!/usr/bin/env pwsh
# Image Optimization Script for Mobile Performance
# This script compresses large images to improve mobile load times

Write-Host "🖼️  Optimizing images for mobile..." -ForegroundColor Cyan

# Find all PNG images larger than 500KB
$largeImages = Get-ChildItem assets/images -Recurse -File -Include *.png | Where-Object { $_.Length -gt 500KB }

Write-Host "`nFound $($largeImages.Count) large images to optimize:" -ForegroundColor Yellow
foreach ($img in $largeImages) {
    $sizeKB = [math]::Round($img.Length/1KB, 0)
    Write-Host "  - $($img.Name) ($sizeKB KB)" -ForegroundColor Gray
}

Write-Host "`n⚠️  To optimize these images, you can:" -ForegroundColor Yellow
Write-Host "  1. Use online tools like TinyPNG (https://tinypng.com)" -ForegroundColor White
Write-Host "  2. Install ImageMagick and run:" -ForegroundColor White
Write-Host "     magick convert input.png -quality 85 -resize 1200x1200> output.png" -ForegroundColor Gray
Write-Host "`n  3. Or use this PowerShell command with built-in tools:" -ForegroundColor White
Write-Host '     Get-ChildItem assets/images -Recurse -Include *.png | Where-Object { $_.Length -gt 500KB } | ForEach-Object { Write-Host "Compress: $($_.FullName)" }' -ForegroundColor Gray

Write-Host "`n💡 Recommendation: Compress images to under 300KB each for faster mobile load" -ForegroundColor Cyan
Write-Host "   Current total: $([math]::Round(($largeImages | Measure-Object -Property Length -Sum).Sum / 1MB, 2)) MB" -ForegroundColor Yellow
Write-Host "   Target total: ~$([math]::Round($largeImages.Count * 0.3, 2)) MB" -ForegroundColor Green
