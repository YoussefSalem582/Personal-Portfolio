# 🚀 Supabase Integration Setup Guide

This guide will help you set up Supabase for your Flutter portfolio project to manage dynamic content and store images.

## 📋 Prerequisites

1. **Supabase Account**: Create a free account at [supabase.com](https://supabase.com)
2. **Flutter Project**: This setup assumes you already have the portfolio project

## 🏗️ Step 1: Create Supabase Project

1. **Sign in to Supabase Dashboard**
   - Go to [app.supabase.com](https://app.supabase.com)
   - Sign in with your GitHub account

2. **Create New Project**
   - Click "New Project"
   - Choose your organization
   - Enter project name: `portfolio-backend`
   - Enter database password (save this!)
   - Select region closest to you
   - Click "Create new project"

3. **Wait for Setup** (2-3 minutes)
   - Your project will be provisioned automatically

## 🔧 Step 2: Configure Project Settings

1. **Get Project Credentials**
   - Go to Settings > API
   - Copy your **Project URL**
   - Copy your **anon/public key**

2. **Update Configuration**
   - Open `lib/config/supabase_config.dart`
   - Replace the placeholder values:
   ```dart
   static const String supabaseUrl = 'YOUR_ACTUAL_PROJECT_URL';
   static const String supabaseAnonKey = 'YOUR_ACTUAL_ANON_KEY';
   ```

## 🗃️ Step 3: Create Database Schema

1. **Open SQL Editor**
   - Go to SQL Editor in Supabase dashboard
   - Click "New query"

2. **Execute Schema**
   - Copy the entire content of `database_schema.sql`
   - Paste into the SQL editor
   - Click "Run" to execute

3. **Verify Tables**
   - Go to Table Editor
   - You should see these tables:
     - `personal_info`
     - `social_links` 
     - `skill_categories`
     - `skills`
     - `projects`
     - `certificates`

## 📦 Step 4: Create Storage Buckets

1. **Go to Storage**
   - Click on Storage in the sidebar
   - Click "Create bucket"

2. **Create Required Buckets**
   Create these buckets with **public** access:
   
   **Bucket 1: project-images**
   - Name: `project-images`
   - Public: ✅ Yes
   - File size limit: 50MB
   - Allowed file types: `image/*`

   **Bucket 2: certificate-images**
   - Name: `certificate-images`
   - Public: ✅ Yes
   - File size limit: 50MB
   - Allowed file types: `image/*, application/pdf`

   **Bucket 3: profile-images**
   - Name: `profile-images`
   - Public: ✅ Yes
   - File size limit: 10MB
   - Allowed file types: `image/*, application/pdf, application/msword`

3. **Configure Bucket Policies**
   - For each bucket, go to Policies tab
   - Ensure "Public read access" is enabled
   - If not, create policy:
   ```sql
   CREATE POLICY "Public read access" ON storage.objects
   FOR SELECT USING (bucket_id = 'bucket-name');
   ```

## 📝 Step 5: Populate Initial Data

### Personal Information
1. Go to Table Editor > `personal_info`
2. Click "Insert row"
3. Fill in your details:
```sql
INSERT INTO personal_info (
    full_name, title, subtitle, bio, email, phone, location, 
    portfolio_url, resume_url, profile_image_url
) VALUES (
    'Your Full Name',
    'Your Professional Title',
    'Your Subtitle',
    'Your bio description...',
    'your@email.com',
    '+1234567890',
    'Your City, Country',
    'https://yourportfolio.com',
    'https://your-resume-url.pdf',
    'assets/profile.jpeg'
);
```

### Social Links
1. Go to Table Editor > `social_links`
2. Add your social media links:
```sql
INSERT INTO social_links (platform, url, icon, order_index) VALUES 
('GitHub', 'https://github.com/yourusername', 'github', 1),
('LinkedIn', 'https://linkedin.com/in/yourusername', 'linkedin', 2),
('Portfolio', 'https://yourportfolio.com', 'web', 3);
```

### Skill Categories
1. Go to Table Editor > `skill_categories`
2. Create skill categories:
```sql
INSERT INTO skill_categories (name, icon, description, order_index) VALUES
('Mobile Development', 'phone_android', 'Cross-platform mobile app development', 1),
('Programming Languages', 'code', 'Programming languages and frameworks', 2),
('AI & Machine Learning', 'psychology', 'Artificial intelligence and ML technologies', 3),
('Tools & Technologies', 'build', 'Development tools and technologies', 4);
```

### Skills
1. Go to Table Editor > `skills`
2. Add skills for each category:
```sql
-- Get category IDs first, then insert skills
INSERT INTO skills (category_id, name, proficiency, description) VALUES
('category-id-here', 'Flutter', 90, 'Cross-platform mobile development'),
('category-id-here', 'Dart', 85, 'Programming language for Flutter'),
-- Add more skills...
```

## 🎯 Step 6: Migrate Existing Projects

1. **Upload Project Images**
   - Go to Storage > project-images
   - Create folders for each project
   - Upload project screenshots

2. **Add Projects to Database**
   - Go to Table Editor > `projects`
   - Insert your existing projects:
```sql
INSERT INTO projects (
    id, title, short_description, description, technologies,
    github_url, demo_url, image_url, gallery_images, 
    created_at, is_featured
) VALUES (
    'project-id',
    'Project Title',
    'Short description',
    'Detailed description...',
    ARRAY['Flutter', 'Dart', 'Firebase'],
    'https://github.com/user/project',
    'https://project-demo.com',
    'https://your-supabase-url/storage/v1/object/public/project-images/project/main.png',
    ARRAY['image1.png', 'image2.png'],
    '2024-01-15',
    true
);
```

## 🧪 Step 7: Test Integration

1. **Run Your App**
   ```bash
   flutter run -d chrome
   ```

2. **Check Data Loading**
   - Open Developer Console
   - Look for Supabase initialization logs
   - Verify data is loading from Supabase

3. **Test Image Loading**
   - Ensure images load from Supabase Storage
   - Check network tab for image requests

## 🔄 Step 8: Toggle Data Sources

Your app now supports both static and dynamic data:

1. **Static Data** (default fallback)
   - Uses local `portfolio_data.dart`
   - Works without internet
   - Images from `assets/`

2. **Supabase Data** (when available)
   - Loads from Supabase database
   - Images from Supabase Storage
   - Real-time updates possible

## 🛠️ Step 9: Development Workflow

### Adding New Projects
1. Upload images to Supabase Storage
2. Add project to `projects` table
3. App automatically displays new content

### Updating Content
1. Edit data directly in Supabase dashboard
2. Changes appear immediately in app
3. No need to rebuild or redeploy

### Managing Images
1. Upload images via Supabase dashboard
2. Copy public URLs
3. Use URLs in database records

## 🔐 Security Considerations

1. **RLS (Row Level Security)**
   - Currently configured for public read access
   - Consider adding write restrictions for production

2. **API Keys**
   - Never commit real API keys to version control
   - Use environment variables in production
   - Consider using `.env` files for local development

3. **Storage Policies**
   - Review bucket policies before production
   - Consider file size and type restrictions
   - Monitor storage usage

## 🚀 Production Deployment

1. **Environment Variables**
   - Set up proper environment configuration
   - Use GitHub Secrets for CI/CD
   - Keep production keys secure

2. **Database Optimization**
   - Add appropriate indexes
   - Monitor query performance
   - Consider connection pooling

3. **Storage Management**
   - Set up automatic backups
   - Monitor storage usage
   - Implement cleanup policies

## 🔧 Troubleshooting

### Common Issues

1. **Supabase Connection Failed**
   - Check URL and API key
   - Verify network connection
   - Check Supabase project status

2. **Images Not Loading**
   - Verify bucket is public
   - Check image URLs
   - Ensure proper file extensions

3. **Data Not Appearing**
   - Check RLS policies
   - Verify table structure
   - Check for JavaScript errors

### Debug Mode
```dart
// Enable debug logging
debugPrint('Supabase data loaded: ${provider.projects.length} projects');
```

## 📚 Next Steps

1. **Content Management**
   - Consider building an admin interface
   - Set up content workflows
   - Plan content update schedules

2. **Advanced Features**
   - Add real-time subscriptions
   - Implement search functionality
   - Add analytics tracking

3. **Performance Optimization**
   - Implement caching strategies
   - Optimize image loading
   - Monitor app performance

## 🎉 Congratulations!

Your Flutter portfolio now has a powerful Supabase backend that allows you to:
- ✅ Manage content dynamically
- ✅ Store images in the cloud
- ✅ Update content without app rebuilds
- ✅ Scale your portfolio easily
- ✅ Have a professional backend infrastructure

Need help? Check the [Supabase documentation](https://supabase.com/docs) or Flutter community resources!
