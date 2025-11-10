# Flutter Web Build Optimization Script for GitHub Pages
# This script builds your Flutter web app with maximum optimization

Write-Host "🚀 Starting Optimized Flutter Web Build..." -ForegroundColor Cyan
Write-Host ""

# Step 1: Clean previous builds
Write-Host "🧹 Cleaning previous builds..." -ForegroundColor Yellow
flutter clean
if ($LASTEXITCODE -ne 0) { 
    Write-Host "❌ Clean failed" -ForegroundColor Red
    exit 1 
}

# Step 2: Get dependencies
Write-Host "📦 Getting dependencies..." -ForegroundColor Yellow
flutter pub get
if ($LASTEXITCODE -ne 0) { 
    Write-Host "❌ Pub get failed" -ForegroundColor Red
    exit 1 
}

# Step 3: Build with optimizations
Write-Host "🔨 Building optimized web app..." -ForegroundColor Yellow
Write-Host "   - Using HTML renderer (faster initial load)" -ForegroundColor Gray
Write-Host "   - Enabling tree-shaking" -ForegroundColor Gray
Write-Host "   - Minifying assets" -ForegroundColor Gray
Write-Host "   - Removing source maps" -ForegroundColor Gray
Write-Host ""

flutter build web `
    --release `
    --web-renderer html `
    --base-href "/Youssef-Hassan-Portfolio/" `
    --no-source-maps `
    --dart-define=FLUTTER_WEB_USE_SKIA=false `
    --dart-define=FLUTTER_WEB_CANVASKIT_URL=https://unpkg.com/canvaskit-wasm@latest/bin/

if ($LASTEXITCODE -ne 0) { 
    Write-Host "❌ Build failed" -ForegroundColor Red
    exit 1 
}

Write-Host ""
Write-Host "✅ Build completed successfully!" -ForegroundColor Green
Write-Host ""

# Step 4: Copy to docs for GitHub Pages
Write-Host "📋 Copying to docs folder for GitHub Pages..." -ForegroundColor Yellow
if (Test-Path "docs") {
    Remove-Item -Recurse -Force "docs"
}
Copy-Item -Recurse -Force "build\web" "docs"

Write-Host "✅ Copied to docs folder" -ForegroundColor Green
Write-Host ""

# Step 5: Get build size
$buildSize = (Get-ChildItem -Path "build\web" -Recurse | Measure-Object -Property Length -Sum).Sum / 1MB
Write-Host "📊 Build Statistics:" -ForegroundColor Cyan
Write-Host "   Total Size: $([math]::Round($buildSize, 2)) MB" -ForegroundColor White

# Step 6: Create .nojekyll file (important for GitHub Pages)
Write-Host ""
Write-Host "📝 Creating .nojekyll file..." -ForegroundColor Yellow
New-Item -Path "docs\.nojekyll" -ItemType File -Force | Out-Null
Write-Host "✅ .nojekyll created" -ForegroundColor Green

# Step 7: Optimization tips
Write-Host ""
Write-Host "💡 Performance Tips:" -ForegroundColor Cyan
Write-Host "   ✓ HTML renderer enabled (faster than CanvasKit)" -ForegroundColor Green
Write-Host "   ✓ Tree-shaking enabled (removes unused code)" -ForegroundColor Green
Write-Host "   ✓ Source maps removed (smaller bundle)" -ForegroundColor Green
Write-Host "   ✓ Assets minified automatically" -ForegroundColor Green
Write-Host ""
Write-Host "🌐 Ready to deploy to GitHub Pages!" -ForegroundColor Cyan
Write-Host ""
Write-Host "📤 Next Steps:" -ForegroundColor Yellow
Write-Host "   1. git add ." -ForegroundColor White
Write-Host "   2. git commit -m `"Deploy optimized build`"" -ForegroundColor White
Write-Host "   3. git push origin master" -ForegroundColor White
Write-Host ""
Write-Host "🎉 Done! Your site will be live at:" -ForegroundColor Green
Write-Host "   https://youssefsalem582.github.io/Youssef-Hassan-Portfolio/" -ForegroundColor Cyan
Write-Host ""
