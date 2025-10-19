# Complete Supabase Setup Guide 🚀

**Last Updated:** October 19, 2025

This guide will walk you through setting up Supabase for your Flutter portfolio, enabling dynamic content management without rebuilding your app.

---

## 📋 Table of Contents

1. [Prerequisites](#prerequisites)
2. [Create Supabase Project](#create-supabase-project)
3. [Database Setup](#database-setup)
4. [Storage Setup](#storage-setup)
5. [Configure Flutter App](#configure-flutter-app)
6. [Test Connection](#test-connection)
7. [Managing Content](#managing-content)
8. [Troubleshooting](#troubleshooting)

---

## 🎯 Prerequisites

- ✅ Supabase account (free tier works perfectly)
- ✅ Basic understanding of SQL databases
- ✅ Your portfolio app already has GetX state management
- ✅ 15-20 minutes of your time

**Note:** Your app works perfectly with static data! This setup is only needed if you want to manage content dynamically.

---

## 1️⃣ Create Supabase Project

### Step 1: Sign Up
1. Go to [https://supabase.com](https://supabase.com)
2. Click **"Start your project"**
3. Sign up with GitHub, Google, or Email

### Step 2: Create New Project
1. Click **"New Project"**
2. Fill in the details:
   - **Name:** `portfolio` (or your choice)
   - **Database Password:** Generate a strong password and **save it!**
   - **Region:** Choose closest to your users
   - **Pricing Plan:** Free (sufficient for portfolios)

3. Click **"Create new project"**
4. Wait 2-3 minutes for project initialization

### Step 3: Get API Credentials
1. Go to **Settings** (⚙️) > **API**
2. Copy these values:
   ```
   Project URL: https://xxxxxxxxxxxxx.supabase.co
   anon/public key: eyJhbGci....
   ```
3. **Save these securely** - you'll need them later

---

## 2️⃣ Database Setup

### Step 1: Open SQL Editor
1. In your Supabase dashboard, click **"SQL Editor"** from the left sidebar
2. Click **"New query"**

### Step 2: Run Database Schema
1. Open the file `database_schema.sql` in your project root
2. **Copy ALL the content** (it's a long file ~300 lines)
3. Paste into the SQL Editor
4. Click **"Run"** (or press Ctrl+Enter)

You should see: **✅ Success. No rows returned**

### Step 3: Verify Tables Created
1. Click **"Table Editor"** from left sidebar
2. You should see these tables:
   - ✅ `personal_info`
   - ✅ `projects`
   - ✅ `certificates`
   - ✅ `skill_categories`
   - ✅ `skills`
   - ✅ `social_links`

---

## 3️⃣ Storage Setup

### Step 1: Create Storage Buckets
1. Click **"Storage"** from left sidebar
2. Click **"New bucket"**
3. Create these three buckets:

#### Bucket 1: projects
```
Name: projects
Public bucket: ✅ Yes
File size limit: 5 MB
Allowed MIME types: image/*, video/*
```

#### Bucket 2: certificates
```
Name: certificates
Public bucket: ✅ Yes
File size limit: 5 MB
Allowed MIME types: image/*, application/pdf
```

#### Bucket 3: profile
```
Name: profile
Public bucket: ✅ Yes  
File size limit: 2 MB
Allowed MIME types: image/*, application/pdf
```

### Step 2: Configure Storage Policies
For each bucket, click the bucket name, then **"Policies"** tab:

1. Click **"New policy"**
2. Choose **"Enable read access for all users"**
3. Click **"Review"**
4. Click **"Save policy"**

This allows public read access (needed for displaying images on your portfolio).

---

## 4️⃣ Configure Flutter App

### Step 1: Update Supabase Config
1. Open `lib/config/supabase_config.dart`
2. Replace with your credentials:

```dart
class SupabaseConfig {
  // Replace these with your actual Supabase credentials
  static const String supabaseUrl = 'https://YOUR_PROJECT_ID.supabase.co';
  static const String supabaseAnonKey = 'YOUR_ANON_KEY_HERE';

  // Storage bucket names (must match what you created)
  static const String projectImagesBucket = 'projects';
  static const String certificateImagesBucket = 'certificates';
  static const String profileImagesBucket = 'profile';
}
```

### Step 2: Verify Dependencies
Your `pubspec.yaml` should already have:
```yaml
dependencies:
  supabase_flutter: ^2.10.3  # ✅ Already added
  get: ^4.6.6                # ✅ Already added
```

---

## 5️⃣ Test Connection

### Method 1: Run the App
```bash
flutter run -d chrome
```

**Check console output:**
- ✅ `✅ Supabase initialized successfully`
- ✅ `✅ Database connection successful`
- ✅ `✅ Storage connection successful`

**If you see errors:**
- ❌ `Database tables not created yet` → Run `database_schema.sql` again
- ❌ `Bucket "projects" missing` → Create storage buckets
- ❌ `Invalid API key` → Check your credentials in `supabase_config.dart`

### Method 2: Use Supabase Test Utility
```bash
# In your terminal
flutter run -d chrome

# Then check debug console for connection test results
```

---

## 6️⃣ Managing Content

### Add Personal Info
1. Go to **Table Editor** > **personal_info**
2. Click **"Insert row"**
3. Fill in your details:
   ```
   full_name: Your Name
   title: Your Professional Title
   subtitle: Your Tagline
   bio: Your professional bio
   email: your@email.com
   phone: +1234567890
   location: Your City, Country
   portfolio_url: https://your-portfolio.com
   resume_url: [Leave empty for now]
   profile_image_url: [Leave empty for now]
   ```
4. Click **"Save"**

### Add Projects
1. Go to **Table Editor** > **projects**
2. Click **"Insert row"**
3. Fill in project details:
   ```
   title: Project Name
   description: Brief description
   detailed_description: Full project description
   technologies: ["Flutter", "Firebase", "GetX"]
   category: Mobile App / Web App / Desktop App
   is_featured: true/false
   github_url: https://github.com/...
   live_url: https://...
   start_date: 2024-01-01
   end_date: 2024-06-01
   ```
4. Click **"Save"**

### Upload Project Images
1. Go to **Storage** > **projects** bucket
2. Create a folder with project ID: `projects/PROJECT_ID/`
3. Upload images:
   - `thumbnail.jpg` - Project thumbnail (required)
   - `screenshot1.jpg`, `screenshot2.jpg`, etc. - Gallery images
4. Copy the public URL and update project's `image_url` and `gallery_images` in Table Editor

### Add Skills
1. Go to **Table Editor** > **skill_categories**
2. Add categories:
   ```
   Languages & Frameworks
   Tools & Technologies
   Soft Skills
   ```

3. Go to **skills** table
4. Add skills with:
   - `category_id` (from skill_categories)
   - `name`: Skill name
   - `proficiency`: 1-100 (percentage)

### Add Certificates
1. Go to **Table Editor** > **certificates**
2. Add certificates:
   ```
   title: Certificate Name
   issuer: Organization Name
   issue_date: 2024-01-01
   description: What you learned
   credential_url: https://...
   ```

3. Upload certificate images to **Storage** > **certificates** bucket

### Add Social Links
1. Go to **Table Editor** > **social_links**
2. Add your social profiles:
   ```
   platform: GitHub
   url: https://github.com/YourUsername
   icon: github
   order_index: 1
   ```

---

## 7️⃣ Verify Everything Works

### Test 1: Check Data Loading
```bash
flutter run -d chrome
```

**Console should show:**
```
✅ Supabase initialized successfully
✅ Database connection successful
📊 Using Supabase data
```

### Test 2: Check UI
1. Your portfolio should now display:
   - ✅ Projects from Supabase
   - ✅ Certificates from Supabase
   - ✅ Skills from Supabase
   - ✅ Personal info from Supabase

### Test 3: Fallback Behavior
1. Intentionally break Supabase URL in `supabase_config.dart`
2. Run app again
3. Should see:
   ```
   📁 Using static data (Supabase unavailable)
   ```
4. App should work with static data from `portfolio_data.dart`
5. Fix the URL back

---

## 8️⃣ Troubleshooting

### Issue: "Database tables not created"
**Solution:**
1. Go to SQL Editor
2. Run this query to check tables:
   ```sql
   SELECT table_name FROM information_schema.tables 
   WHERE table_schema = 'public';
   ```
3. If empty, run `database_schema.sql` again

### Issue: "Storage bucket not found"
**Solution:**
1. Go to **Storage** in Supabase dashboard
2. Create missing buckets: `projects`, `certificates`, `profile`
3. Make sure all buckets are **public**

### Issue: "Invalid API key"
**Solution:**
1. Go to **Settings** > **API**
2. Copy the **anon/public** key (not service_role!)
3. Update `supabase_config.dart`
4. Restart your app

### Issue: "Images not loading"
**Solution:**
1. Check storage bucket policies - must allow public read
2. Verify image URLs in database match storage paths
3. Example correct URL: `https://xxxxx.supabase.co/storage/v1/object/public/projects/project1/image.jpg`

### Issue: "App still using static data"
**Solution:**
1. Make sure you have at least ONE row in each table
2. Check console logs for "📊 Using Supabase data"
3. If you see "📁 Using static data", check:
   - Supabase credentials are correct
   - Tables have data
   - No connection errors in console

---

## 🎉 Success Checklist

Before you finish, verify:

- [ ] ✅ Supabase project created
- [ ] ✅ Database schema executed successfully  
- [ ] ✅ All 6 tables visible in Table Editor
- [ ] ✅ 3 storage buckets created (projects, certificates, profile)
- [ ] ✅ Storage policies set to public read
- [ ] ✅ `supabase_config.dart` updated with your credentials
- [ ] ✅ App runs without errors
- [ ] ✅ Console shows "Using Supabase data"
- [ ] ✅ Personal info displays correctly
- [ ] ✅ At least one project added
- [ ] ✅ At least one certificate added
- [ ] ✅ Skills display correctly
- [ ] ✅ Social links work

---

## 📚 Next Steps

### Option 1: Build Admin Dashboard
- Create admin UI for content management
- Use Supabase Auth for authentication
- Implement CRUD operations via GetX controllers
- Add image upload functionality

### Option 2: Add Real-time Features
```dart
// Subscribe to changes
supabase
  .from('projects')
  .stream(primaryKey: ['id'])
  .listen((List<Map<String, dynamic>> data) {
    // Update UI in real-time
    _projects.value = data.map((e) => Project.fromJson(e)).toList();
  });
```

### Option 3: Advanced Queries
```dart
// Filter projects by technology
final flutterProjects = await supabase
  .from('projects')
  .select()
  .contains('technologies', ['Flutter'])
  .order('created_at', ascending: false);
```

---

## 🆘 Need Help?

### Resources:
- **Supabase Docs:** https://supabase.com/docs
- **Flutter Integration:** https://supabase.com/docs/guides/getting-started/quickstarts/flutter
- **GetX Docs:** https://github.com/jonataslaw/getx
- **Your Project Docs:** Check `GETX_MIGRATION.md`, `IMPROVEMENTS_LOG.md`

### Common Commands:
```bash
# Run app
flutter run -d chrome

# Check for issues
flutter analyze

# Update dependencies
flutter pub upgrade

# Clean and rebuild
flutter clean && flutter pub get && flutter run
```

---

## 💡 Pro Tips

1. **Use Supabase Auth** for admin access:
   ```dart
   // Add authentication for admin features
   await supabase.auth.signInWithPassword(
     email: 'admin@example.com',
     password: 'securepassword',
   );
   ```

2. **Optimize Images** before uploading:
   - Max size: 500KB for thumbnails, 2MB for full images
   - Format: WebP for best compression
   - Dimensions: 1920x1080 max for projects

3. **Backup Your Data**:
   ```bash
   # Export from Supabase dashboard
   # Settings > Database > Export to CSV
   ```

4. **Row Level Security (RLS)**:
   - Enable for production
   - Allows public read, but requires auth for write
   - Configure in Supabase > Authentication > Policies

---

## 📝 Summary

**What You Accomplished:**
- ✅ Set up Supabase backend (< 15 minutes)
- ✅ Created database with 6 tables
- ✅ Configured 3 storage buckets
- ✅ Connected Flutter app to Supabase
- ✅ App gracefully handles Supabase availability
- ✅ Ready to manage content dynamically!

**What Your App Can Now Do:**
- 📊 Load content from Supabase
- 📁 Fallback to static data if Supabase unavailable
- 🔄 Update content without rebuilding app
- 📸 Store and serve images efficiently
- 🚀 Scale to thousands of portfolio items

**Your portfolio is now a full-stack application! 🎉**

---

*Need to revert to static data only? Simply comment out Supabase credentials in `supabase_config.dart` and your app will automatically use static data from `portfolio_data.dart`.*
