# 🚀 Quick Deploy - Static Portfolio

**One-page guide to deploy your static portfolio to GitHub Pages**

---

## 📋 Prerequisites

✅ Flutter installed  
✅ Git installed  
✅ GitHub repository exists  

---

## 🎯 Deploy in 5 Minutes

### Step 1: Build Production Version
```powershell
flutter clean
flutter pub get
flutter build web --release --web-renderer canvaskit
```

### Step 2: Copy Build to Docs Folder
```powershell
# Remove old docs folder if exists
if (Test-Path docs) { Remove-Item -Recurse -Force docs }

# Copy new build
Copy-Item -Recurse build/web docs
```

### Step 3: Fix Base Href
Edit `docs/index.html` and change:
```html
<base href="/">
```
To:
```html
<base href="/Personal-Portfolio/">
```

### Step 4: Commit and Push
```powershell
git add .
git commit -m "Deploy static portfolio to GitHub Pages"
git push origin master
```

### Step 5: Enable GitHub Pages
1. Go to https://github.com/YoussefSalem582/Personal-Portfolio/settings/pages
2. Under **Source**, select:
   - Branch: `master`
   - Folder: `/docs`
3. Click **Save**

### Step 6: Access Your Portfolio
Wait 1-2 minutes, then visit:
```
https://youssefsalem582.github.io/Personal-Portfolio/
```

---

## ✅ Done!

Your portfolio is now live! 🎉

---

## 📝 Update Content Later

Edit data in `lib/utils/portfolio_data.dart`, then:

```powershell
# Build
flutter build web --release

# Copy
Copy-Item -Recurse -Force build/web docs

# Deploy
git add docs
git commit -m "Update portfolio content"
git push origin master
```

Changes appear in 1-2 minutes!

---

## 🐛 Not Working?

**Blank page?**
- Check `docs/index.html` has correct base href: `/Personal-Portfolio/`
- Wait a few minutes after pushing

**Images not loading?**
- Check files exist in `assets/` folder
- Rebuild: `flutter clean && flutter build web --release`

**Still broken?**
- Check browser console (F12) for errors
- See `STATIC_DEPLOYMENT_GUIDE.md` for detailed troubleshooting

---

## 📚 More Info

- **Full Deployment Guide:** `STATIC_DEPLOYMENT_GUIDE.md`
- **Conversion Details:** `STATIC_CONVERSION_SUMMARY.md`
- **Other Hosting Options:** Netlify, Firebase, Vercel (see full guide)

---

**That's it! Your static portfolio is deployed! 🚀**
