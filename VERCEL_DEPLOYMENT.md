# Vercel Deployment Guide

## Quick Start

1. **Sign up**: Go to [vercel.com](https://vercel.com) and sign in with GitHub

2. **Import Project**:
   - Click "Add New Project"
   - Select your GitHub repository: `Personal-Portfolio`
   - Vercel will auto-detect settings

3. **Deploy**: Click "Deploy" and wait ~2 minutes

## Build Configuration

If auto-detection doesn't work, use these settings:

- **Framework Preset**: Other
- **Build Command**: `flutter build web --release --web-renderer canvaskit`
- **Output Directory**: `build/web`
- **Install Command**: `flutter pub get`

## Environment Variables (Optional)

If you need to add any API keys or secrets:
- Go to Project Settings → Environment Variables
- Add variables like `EMAILJS_PUBLIC_KEY`, etc.

## Custom Domain

1. Go to Project Settings → Domains
2. Add your custom domain (e.g., `youssefhassan.com`)
3. Follow DNS configuration instructions
4. SSL certificate is automatic!

## Automatic Deployments

- **Production**: Every push to `master` branch
- **Preview**: Every pull request gets a preview URL
- **Instant Rollback**: Click on any previous deployment to rollback

## Useful Commands

```bash
# Install Vercel CLI
npm install -g vercel

# Deploy to preview
vercel

# Deploy to production
vercel --prod

# Check deployment status
vercel ls

# View logs
vercel logs
```

## Benefits Over GitHub Pages

✅ Global CDN with edge caching  
✅ Automatic HTTPS  
✅ Preview deployments for PRs  
✅ Built-in analytics  
✅ Better performance  
✅ Serverless functions support  
✅ Environment variables  
✅ Instant rollbacks  
✅ Real-time logs  

## URLs

- **Production**: `https://your-project.vercel.app`
- **Custom Domain**: `https://yourdomain.com` (if configured)
- **Preview**: `https://your-project-git-branch.vercel.app`

## Next Steps

After deploying to Vercel:

1. Update README.md with new URL
2. Update social media links (LinkedIn, GitHub, etc.)
3. Update meta tags in `web/index.html` with new URL
4. Configure custom domain (optional)
5. Enable Web Analytics in Vercel dashboard

## Troubleshooting

**Build fails?**
- Check Flutter version compatibility
- Ensure `pubspec.yaml` is valid
- Check build logs in Vercel dashboard

**Routing issues?**
- The `vercel.json` handles SPA routing automatically
- All routes redirect to `index.html`

**Performance issues?**
- Vercel automatically optimizes assets
- Enable edge caching in vercel.json
- Use WebP images where possible

## Support

- Vercel Documentation: https://vercel.com/docs
- Flutter Web Deployment: https://docs.flutter.dev/deployment/web
- Vercel Support: https://vercel.com/support
