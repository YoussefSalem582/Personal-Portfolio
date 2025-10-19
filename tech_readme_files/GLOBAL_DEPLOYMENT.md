# 🌍 Global Deployment Guide

This guide provides comprehensive instructions for deploying your Flutter portfolio globally across multiple platforms.

## 📋 Table of Contents

- [Prerequisites](#prerequisites)
- [Environment Configuration](#environment-configuration)
- [Build for Production](#build-for-production)
- [Deployment Platforms](#deployment-platforms)
  - [GitHub Pages](#github-pages)
  - [Firebase Hosting](#firebase-hosting)
  - [Vercel](#vercel)
  - [Netlify](#netlify)
  - [AWS Amplify](#aws-amplify)
  - [Docker Deployment](#docker-deployment)
- [CI/CD Setup](#cicd-setup)
- [Performance Optimization](#performance-optimization)
- [SEO & Analytics](#seo--analytics)

---

## Prerequisites

Before deploying globally, ensure you have:

- ✅ Flutter SDK installed (>=3.3.0)
- ✅ Git configured
- ✅ Supabase project set up
- ✅ Environment variables configured
- ✅ All dependencies installed

```bash
flutter --version
flutter pub get
```

---

## Environment Configuration

### 1. Setup Environment Variables

Copy `.env.example` to `.env` and fill in your credentials:

```bash
cp .env.example .env
```

Edit `.env` with your actual values:

```env
SUPABASE_URL=https://your-project.supabase.co
SUPABASE_ANON_KEY=your-anon-key-here
GA_MEASUREMENT_ID=GA_MEASUREMENT_ID
APP_URL=https://your-domain.com
```

### 2. Verify Configuration

```bash
flutter test
flutter analyze
```

---

## Build for Production

### Web Build (Optimized)

```bash
# Clean previous builds
flutter clean

# Get dependencies
flutter pub get

# Build optimized web version
flutter build web --release --web-renderer canvaskit

# Or use html renderer (smaller size, less features)
flutter build web --release --web-renderer html

# Build with specific base href (for subdirectories)
flutter build web --release --base-href "/Personal-Portfolio/"
```

**Build outputs to:** `build/web/`

### Performance Build Options

```bash
# Tree-shake icons to reduce size
flutter build web --release --tree-shake-icons

# Enable source maps for debugging
flutter build web --release --source-maps

# Obfuscate code (security)
flutter build web --release --obfuscate --split-debug-info=build/debug-info
```

---

## Deployment Platforms

### 🐙 GitHub Pages

**Best for:** Free hosting, easy setup, automatic SSL

#### Method 1: Manual Deployment

```bash
# Build with correct base href
flutter build web --release --base-href "/Personal-Portfolio/"

# Push to gh-pages branch
cd build/web
git init
git add .
git commit -m "Deploy to GitHub Pages"
git branch -M gh-pages
git remote add origin https://github.com/YoussefSalem582/Personal-Portfolio.git
git push -f origin gh-pages
```

#### Method 2: GitHub Actions (Automatic)

See [CI/CD Setup](#cicd-setup) section below.

**Access:** `https://youssefsalem582.github.io/Personal-Portfolio/`

---

### 🔥 Firebase Hosting

**Best for:** Fast CDN, SSL, custom domains, analytics integration

#### Setup

```bash
# Install Firebase CLI
npm install -g firebase-tools

# Login to Firebase
firebase login

# Initialize Firebase in your project
firebase init hosting
```

**Select options:**
- Public directory: `build/web`
- Configure as single-page app: `Yes`
- Set up automatic builds: `No` (we'll use GitHub Actions)

#### Deploy

```bash
# Build the app
flutter build web --release

# Deploy to Firebase
firebase deploy --only hosting

# Deploy with preview URL
firebase hosting:channel:deploy preview
```

**Access:** `https://your-project.web.app`

#### Custom Domain

```bash
firebase hosting:sites:create your-domain-com
firebase target:apply hosting your-domain your-domain-com
firebase deploy --only hosting:your-domain
```

---

### ⚡ Vercel

**Best for:** Fastest deployments, edge network, serverless functions

#### Setup

```bash
# Install Vercel CLI
npm i -g vercel

# Login
vercel login
```

#### Create `vercel.json`:

```json
{
  "version": 2,
  "builds": [
    {
      "src": "build/web/**",
      "use": "@vercel/static"
    }
  ],
  "routes": [
    {
      "src": "/(.*)",
      "dest": "/build/web/$1"
    },
    {
      "handle": "filesystem"
    },
    {
      "src": "/.*",
      "dest": "/build/web/index.html"
    }
  ]
}
```

#### Deploy

```bash
# Build first
flutter build web --release

# Deploy
vercel --prod
```

**Or connect GitHub repo in Vercel dashboard for automatic deployments.**

---

### 🌐 Netlify

**Best for:** Simple setup, form handling, serverless functions

#### Method 1: Drag & Drop

1. Build: `flutter build web --release`
2. Go to [Netlify Drop](https://app.netlify.com/drop)
3. Drag `build/web` folder

#### Method 2: Netlify CLI

```bash
# Install Netlify CLI
npm install -g netlify-cli

# Login
netlify login

# Initialize
netlify init

# Deploy
flutter build web --release
netlify deploy --prod --dir=build/web
```

#### Create `netlify.toml`:

```toml
[build]
  command = "flutter build web --release"
  publish = "build/web"

[[redirects]]
  from = "/*"
  to = "/index.html"
  status = 200

[build.environment]
  FLUTTER_VERSION = "3.3.0"
```

---

### ☁️ AWS Amplify

**Best for:** AWS integration, scalability, enterprise features

#### Setup

```bash
# Install Amplify CLI
npm install -g @aws-amplify/cli

# Configure
amplify configure

# Initialize
amplify init
```

#### Create `amplify.yml`:

```yaml
version: 1
frontend:
  phases:
    preBuild:
      commands:
        - git clone https://github.com/flutter/flutter.git -b stable
        - export PATH="$PATH:`pwd`/flutter/bin"
        - flutter precache
        - flutter pub get
    build:
      commands:
        - flutter build web --release
  artifacts:
    baseDirectory: build/web
    files:
      - '**/*'
  cache:
    paths:
      - flutter/**/*
```

#### Deploy

```bash
# Add hosting
amplify add hosting

# Publish
amplify publish
```

---

### 🐳 Docker Deployment

**Best for:** Self-hosting, Kubernetes, any cloud platform

#### Create `Dockerfile`:

```dockerfile
# Build stage
FROM cirrusci/flutter:stable AS build

WORKDIR /app
COPY . .

# Get dependencies and build
RUN flutter pub get
RUN flutter build web --release

# Production stage
FROM nginx:alpine

# Copy built files
COPY --from=build /app/build/web /usr/share/nginx/html

# Copy nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
```

#### Create `nginx.conf`:

```nginx
server {
    listen 80;
    server_name _;
    root /usr/share/nginx/html;
    index index.html;

    # Gzip compression
    gzip on;
    gzip_vary on;
    gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript;

    # Cache static assets
    location ~* \.(js|css|png|jpg|jpeg|gif|ico|svg|woff|woff2|ttf|eot)$ {
        expires 1y;
        add_header Cache-Control "public, immutable";
    }

    # SPA fallback
    location / {
        try_files $uri $uri/ /index.html;
    }
}
```

#### Create `docker-compose.yml`:

```yaml
version: '3.8'

services:
  portfolio:
    build: .
    ports:
      - "80:80"
    restart: unless-stopped
    environment:
      - NODE_ENV=production
```

#### Deploy with Docker

```bash
# Build image
docker build -t portfolio-web .

# Run container
docker run -d -p 80:80 --name portfolio portfolio-web

# Or use docker-compose
docker-compose up -d
```

#### Deploy to Cloud

**Google Cloud Run:**
```bash
gcloud builds submit --tag gcr.io/PROJECT_ID/portfolio
gcloud run deploy --image gcr.io/PROJECT_ID/portfolio --platform managed
```

**AWS ECS / Digital Ocean / etc:**
- Push to Docker registry
- Deploy from registry

---

## CI/CD Setup

### GitHub Actions Workflow

Create `.github/workflows/deploy.yml`:

```yaml
name: Deploy to GitHub Pages

on:
  push:
    branches: [ master ]
  workflow_dispatch:

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v3
    
    - name: Setup Flutter
      uses: subosito/flutter-action@v2
      with:
        flutter-version: '3.3.0'
        channel: 'stable'
    
    - name: Get dependencies
      run: flutter pub get
    
    - name: Run tests
      run: flutter test
    
    - name: Build web
      run: flutter build web --release --base-href "/Personal-Portfolio/"
    
    - name: Deploy to GitHub Pages
      uses: peaceiris/actions-gh-pages@v3
      with:
        github_token: ${{ secrets.GITHUB_TOKEN }}
        publish_dir: ./build/web
        cname: your-custom-domain.com  # Optional
```

### Firebase Hosting CI/CD

Create `.github/workflows/firebase-deploy.yml`:

```yaml
name: Deploy to Firebase Hosting

on:
  push:
    branches: [ production ]

jobs:
  deploy:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v3
    
    - name: Setup Flutter
      uses: subosito/flutter-action@v2
      with:
        flutter-version: '3.3.0'
    
    - name: Build
      run: |
        flutter pub get
        flutter build web --release
    
    - name: Deploy to Firebase
      uses: FirebaseExtended/action-hosting-deploy@v0
      with:
        repoToken: '${{ secrets.GITHUB_TOKEN }}'
        firebaseServiceAccount: '${{ secrets.FIREBASE_SERVICE_ACCOUNT }}'
        channelId: live
        projectId: your-project-id
```

---

## Performance Optimization

### 1. Enable Compression

Most platforms auto-enable, but for nginx:

```nginx
gzip on;
gzip_comp_level 6;
gzip_types text/plain text/css application/json application/javascript text/xml application/xml;
```

### 2. Add Caching Headers

```nginx
location ~* \.(js|css|png|jpg|jpeg|gif|ico|svg)$ {
    expires 1y;
    add_header Cache-Control "public, immutable";
}
```

### 3. Use CDN

- **Cloudflare:** Free tier with global CDN
- **AWS CloudFront:** Integrate with S3/Amplify
- **Vercel/Netlify:** Built-in edge network

### 4. Optimize Assets

```bash
# Optimize images
find assets/images -name "*.png" -exec optipng {} \;
find assets/images -name "*.jpg" -exec jpegoptim {} \;

# Use WebP format
cwebp input.png -o output.webp
```

### 5. Lazy Loading

Images already use `LazyImage` widget - ensure all heavy assets load lazily.

---

## SEO & Analytics

### 1. Google Analytics Setup

Replace `GA_MEASUREMENT_ID` in `web/index.html` with your actual ID.

### 2. Google Search Console

1. Go to [Google Search Console](https://search.google.com/search-console)
2. Add your property
3. Verify ownership
4. Submit sitemap

### 3. Create Sitemap

Create `web/sitemap.xml`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <url>
    <loc>https://youssefsalem582.github.io/Personal-Portfolio/</loc>
    <changefreq>weekly</changefreq>
    <priority>1.0</priority>
  </url>
  <url>
    <loc>https://youssefsalem582.github.io/Personal-Portfolio/#/projects</loc>
    <changefreq>monthly</changefreq>
    <priority>0.8</priority>
  </url>
</urlset>
```

### 4. robots.txt

Create `web/robots.txt`:

```
User-agent: *
Allow: /

Sitemap: https://youssefsalem582.github.io/Personal-Portfolio/sitemap.xml
```

---

## 🎯 Quick Start Checklist

- [ ] Configure `.env` file
- [ ] Update meta tags in `web/index.html`
- [ ] Set up Google Analytics
- [ ] Build: `flutter build web --release`
- [ ] Choose deployment platform
- [ ] Set up CI/CD (optional but recommended)
- [ ] Configure custom domain (optional)
- [ ] Submit to search engines
- [ ] Monitor analytics

---

## 🆘 Troubleshooting

### Build Errors

```bash
# Clean and rebuild
flutter clean
flutter pub get
flutter build web --release --verbose
```

### Routing Issues

Ensure base href matches your deployment path:
- Root: `--base-href "/"`
- Subdirectory: `--base-href "/subdirectory/"`

### Environment Variables Not Loading

Web builds need compile-time env vars. Use build arguments or rebuild after changing `.env`.

### Performance Issues

- Use CanvasKit for better graphics: `--web-renderer canvaskit`
- Enable tree-shaking: `--tree-shake-icons`
- Compress assets before building

---

## 📚 Additional Resources

- [Flutter Web Deployment](https://docs.flutter.dev/deployment/web)
- [GitHub Pages Documentation](https://pages.github.com/)
- [Firebase Hosting Guide](https://firebase.google.com/docs/hosting)
- [Vercel Flutter Guide](https://vercel.com/guides/deploying-flutter-with-vercel)
- [Netlify Flutter Guide](https://docs.netlify.com/integrations/frameworks/flutter/)

---

## 🚀 Need Help?

- **Issues:** [GitHub Issues](https://github.com/YoussefSalem582/Personal-Portfolio/issues)
- **Discussions:** [GitHub Discussions](https://github.com/YoussefSalem582/Personal-Portfolio/discussions)
- **Email:** ${SupabaseConfig.email}

---

**Built with ❤️ using Flutter & GetX**
