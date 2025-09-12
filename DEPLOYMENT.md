# Deployment Guide

This guide provides step-by-step instructions for deploying your Flutter portfolio to various platforms.

## 🚀 Quick Deploy Options

### Option 1: GitHub Pages (Recommended)

**Automatic deployment via GitHub Actions:**

1. **Push to GitHub**:
   ```bash
   git add .
   git commit -m "Deploy portfolio"
   git push origin main
   ```

2. **Enable GitHub Pages**:
   - Go to repository settings
   - Navigate to "Pages" section
   - Source: "Deploy from a branch"
   - Branch: `gh-pages`
   - Save

3. **Access your site**:
   - URL: `https://yourusername.github.io/repository-name/`
   - Custom domain supported (add CNAME)

### Option 2: Vercel (1-Click Deploy)

[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https://github.com/YoussefSalem582/Personal-Portfolio)

**Manual setup:**

1. **Connect repository** to Vercel
2. **Configure build settings**:
   - Build Command: `flutter build web --release`
   - Output Directory: `build/web`
   - Install Command: `flutter pub get`
3. **Deploy**

### Option 3: Netlify

**Drag & Drop:**
1. Build locally: `flutter build web --release`
2. Drag `build/web` folder to Netlify

**Git Integration:**
1. Connect repository to Netlify
2. Build settings:
   - Build command: `flutter build web --release`
   - Publish directory: `build/web`

### Option 4: Firebase Hosting

1. **Install Firebase CLI**:
   ```bash
   npm install -g firebase-tools
   ```

2. **Initialize Firebase**:
   ```bash
   firebase login
   firebase init hosting
   ```

3. **Configure firebase.json**:
   ```json
   {
     "hosting": {
       "public": "build/web",
       "ignore": ["firebase.json", "**/.*", "**/node_modules/**"],
       "rewrites": [
         {
           "source": "**",
           "destination": "/index.html"
         }
       ]
     }
   }
   ```

4. **Deploy**:
   ```bash
   flutter build web --release
   firebase deploy
   ```

## 🔧 Build Optimization

### Performance Build
```bash
flutter build web --release --web-renderer html --dart-define=FLUTTER_WEB_USE_SKIA=false
```

### SEO-Optimized Build
```bash
flutter build web --release --web-renderer html --source-maps
```

## 🌐 Custom Domain Setup

### GitHub Pages
1. Add `CNAME` file to `static/` folder with your domain
2. Configure DNS: `CNAME` record pointing to `username.github.io`

### Vercel
1. Add domain in Vercel dashboard
2. Configure DNS as instructed

### Netlify
1. Add domain in site settings
2. Configure DNS records

## 📊 Performance Monitoring

### Lighthouse Audit
```bash
npm install -g lighthouse
lighthouse https://yoursite.com --view
```

### Web Vitals
- Monitor Core Web Vitals in deployment
- Use tools like PageSpeed Insights
- Set up Real User Monitoring (RUM)

## 🔒 Security Headers

Add these headers for better security:

```
Content-Security-Policy: default-src 'self'; script-src 'self' 'unsafe-inline'; style-src 'self' 'unsafe-inline'
X-Frame-Options: DENY
X-Content-Type-Options: nosniff
Referrer-Policy: strict-origin-when-cross-origin
```

## 🐛 Troubleshooting

### Common Issues

1. **Assets not loading**:
   - Check `pubspec.yaml` asset paths
   - Verify case-sensitive file names
   - Ensure assets are in `build/web/assets/`

2. **Routing issues**:
   - Use hash routing for static hosting
   - Configure server rewrites for path-based routing

3. **Large bundle size**:
   - Enable tree-shaking: `--tree-shake-icons`
   - Remove unused dependencies
   - Optimize images

### Build Errors

```bash
# Clean build
flutter clean
flutter pub get
flutter build web --release

# Debug mode for error details
flutter build web --debug
```

## 📱 Mobile Testing

Test on actual devices:
- iOS Safari
- Chrome Mobile
- Firefox Mobile
- Samsung Internet

Use browser dev tools:
- Device simulation
- Network throttling
- Performance profiling

## 🔄 CI/CD Pipeline

The included GitHub Actions workflow:
1. ✅ Runs tests
2. ✅ Builds web app
3. ✅ Deploys to GitHub Pages
4. ✅ Runs Lighthouse audit

Customize in `.github/workflows/flutter-web.yml`

## 📈 Analytics Setup

### Google Analytics 4
Add to `web/index.html`:
```html
<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=GA_MEASUREMENT_ID"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'GA_MEASUREMENT_ID');
</script>
```

### Plausible Analytics (Privacy-friendly)
```html
<script defer data-domain="yourdomain.com" src="https://plausible.io/js/script.js"></script>
```

## 🎯 Checklist Before Deploy

- [ ] All tests passing
- [ ] Build completes without errors
- [ ] Images optimized and loading correctly
- [ ] Resume PDF accessible
- [ ] Contact form working (if applicable)
- [ ] Social links correct
- [ ] SEO meta tags updated
- [ ] Performance optimized
- [ ] Mobile responsive
- [ ] Cross-browser tested

## 📞 Support

If you encounter issues:
1. Check the troubleshooting section
2. Review Flutter web documentation
3. Open an issue in the repository
4. Contact: youssef.salem.hassan582@gmail.com

---

**Happy Deploying! 🚀**
