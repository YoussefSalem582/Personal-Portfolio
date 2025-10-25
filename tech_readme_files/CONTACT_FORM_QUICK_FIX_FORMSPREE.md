# ⚡ Quick Fix - Contact Form with Formspree

## Problem
Contact form works locally but NOT on GitHub Pages (domain restriction error).

## Solution
Switched from EmailJS to **Formspree** (FREE, no domain restrictions!).

## Setup (2 Minutes)

### 1. Sign Up
https://formspree.io/ → Sign Up → Confirm Email

### 2. Create Form
"+ New Form" → Name: `Portfolio Contact Form` → Email: `youssef.salem.hassan582@gmail.com`

### 3. Copy Form Endpoint
Example: `https://formspree.io/f/xvgopjqr`

### 4. Update Code
File: `lib/config/api_keys.dart`
```dart
static const String formspreeEndpoint = 'https://formspree.io/f/YOUR_FORM_ID';
```

### 5. Build & Deploy
```powershell
flutter build web --release --base-href "/Personal-Portfolio/"
Copy-Item -Path "build\web\*" -Destination "docs\" -Recurse -Force
git add . ; git commit -m "Contact form with Formspree" ; git push
```

### 6. Test
Visit: https://youssefsalem582.github.io/Personal-Portfolio/
Fill form → Send → ✅ Success!

## Why Formspree?
✅ FREE (50 emails/month)
✅ NO domain restrictions
✅ Works on localhost, GitHub Pages, ANY domain
✅ 2-minute setup
✅ Built-in spam protection
✅ Email notifications
✅ Dashboard to view submissions

## Done! 🎉
No more errors. Form works everywhere!

---
Full guide: `FORMSPREE_SETUP_GUIDE.md`
