# 🔐 Admin Credentials (PRIVATE - DO NOT COMMIT)

**⚠️ IMPORTANT: Keep this file private! Add to .gitignore**

---

## Admin Access

**Email:** `youssef.salem.hassan582@gmail.com`  
**Password:** `211000582#Cs`

---

## Setup Instructions

### 1. Create Admin User in Supabase

1. **Go to Supabase Dashboard**
   - URL: https://supabase.com/dashboard
   - Sign in to your account

2. **Open Your Portfolio Project**
   - Select the portfolio project

3. **Navigate to Authentication**
   - Click **"Authentication"** in left sidebar
   - Click **"Users"** tab

4. **Add Admin User**
   - Click **"Add user"** button (top right)
   - Select **"Create new user"**
   - Fill in:
     ```
     Email address: youssef.salem.hassan582@gmail.com
     Password: 211000582#Cs
     Auto Confirm User: ✅ YES (important!)
     ```
   - Click **"Create user"**

5. **Verify User Created**
   - User should appear in users list
   - Status: "Confirmed" ✅
   - Email: youssef.salem.hassan582@gmail.com

---

## Access URLs

### Local Development
```
http://localhost:YOUR_PORT/admin/login
```

### Production (GitHub Pages)
```
https://youssefsalem582.github.io/Personal-Portfolio/admin/login
```

### Custom Domain (if configured)
```
https://your-domain.com/admin/login
```

---

## Security Notes

### ⚠️ Important Security Practices

1. **Never commit this file to Git**
   - Add `ADMIN_CREDENTIALS.md` to `.gitignore`
   - Keep credentials private

2. **Use HTTPS only**
   - Never login over HTTP in production
   - GitHub Pages uses HTTPS by default

3. **Sign out after use**
   - Always sign out when done
   - Don't leave admin panel open

4. **Secure your email**
   - Enable 2FA on Gmail account
   - Use strong email password
   - Monitor login activity

5. **Password security**
   - Don't share password with anyone
   - Don't save in browser on public computers
   - Change password if compromised

---

## Password Change (If Needed)

### Via Supabase Dashboard

1. Go to **Authentication** > **Users**
2. Find user: youssef.salem.hassan582@gmail.com
3. Click on user
4. Click **"Reset password"**
5. User will receive password reset email
6. Follow link to set new password

### Via Admin Panel

1. Login to admin panel
2. Go to **Profile** (when implemented)
3. Click **"Change Password"**
4. Enter current and new password
5. Save changes

---

## Troubleshooting

### Can't Sign In

**Problem:** "Invalid credentials" error

**Solution:**
1. Double-check email is exactly: `youssef.salem.hassan582@gmail.com`
2. Double-check password is exactly: `211000582#Cs`
3. Verify user exists in Supabase > Authentication > Users
4. Check user status is "Confirmed"
5. Try password reset if needed

---

### User Not Found

**Problem:** User doesn't exist in Supabase

**Solution:**
1. Go through setup instructions above
2. Make sure to click "Create user"
3. Verify user appears in users list
4. Check "Auto Confirm" was enabled

---

### Access Denied

**Problem:** Can access login but dashboard redirects

**Solution:**
1. Check Supabase credentials in `lib/config/supabase_config.dart`
2. Verify Supabase project is active
3. Check browser console for errors
4. Sign out and sign in again

---

## Quick Login Test

### Test Locally

1. **Run app:**
   ```bash
   flutter run -d chrome
   ```

2. **Navigate to admin:**
   - URL appears in terminal (usually http://localhost:XXXXX)
   - Add `/admin/login` to URL
   - Example: `http://localhost:12345/admin/login`

3. **Sign in:**
   - Email: `youssef.salem.hassan582@gmail.com`
   - Password: `211000582#Cs`
   - Click "Sign In"

4. **Verify:**
   - Should redirect to `/admin/dashboard`
   - Should see statistics cards
   - Should see "Welcome back!"

---

## Backup Access

### If You Forget Password

1. **Request password reset:**
   - Click "Forgot password?" on login screen
   - Enter email: youssef.salem.hassan582@gmail.com
   - Check email inbox for reset link
   - Click link and set new password

2. **Via Supabase Dashboard:**
   - Go to Supabase Dashboard
   - Authentication > Users
   - Find your user
   - Click "Reset password" or "Delete user" and recreate

---

## Admin User Details

**Email:** youssef.salem.hassan582@gmail.com  
**Role:** Super Admin (full access)  
**Permissions:** 
- ✅ Create/Edit/Delete Projects
- ✅ Create/Edit/Delete Certificates
- ✅ Upload Images
- ✅ Manage Skills (when implemented)
- ✅ Update Personal Info (when implemented)

---

## Security Checklist

Before going live:

- [ ] Admin user created in Supabase
- [ ] Can sign in successfully
- [ ] Dashboard loads correctly
- [ ] Can add/edit/delete content
- [ ] Images upload successfully
- [ ] Tested sign out
- [ ] This file added to .gitignore
- [ ] Never committed credentials to Git
- [ ] Using HTTPS in production
- [ ] 2FA enabled on email account

---

## Contact for Issues

If you have issues accessing admin:

1. Check all troubleshooting steps above
2. Verify Supabase configuration
3. Check browser console (F12) for errors
4. Review `ADMIN_DASHBOARD_GUIDE.md` for detailed help

---

**Last Updated:** October 20, 2025  
**Status:** Admin user ready to create  

---

## ⚠️ REMINDER

**DO NOT COMMIT THIS FILE TO GIT!**

Add this line to `.gitignore`:
```
tech_readme_files/ADMIN_CREDENTIALS.md
```

---

*Keep this file safe and private!* 🔒
