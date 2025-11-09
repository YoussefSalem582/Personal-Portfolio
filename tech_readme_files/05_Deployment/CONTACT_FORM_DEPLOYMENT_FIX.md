# Contact Form Deployment Fix Guide

## Problem
Contact form works locally but fails when deployed to GitHub Pages with error:
> "Error sending message. Please try again or contact me directly at youssef.salem.hassan582@gmail.com"

## Root Cause
EmailJS requires domains to be whitelisted in your account settings. When you test locally (localhost), it works, but when deployed to GitHub Pages, the domain `youssefsalem582.github.io` is not in your allowed domains list, causing EmailJS to reject requests.

## Solution: Add Domain to EmailJS Allowed Domains

### Step 1: Login to EmailJS Dashboard
1. Go to https://dashboard.emailjs.com/
2. Log in with your credentials

### Step 2: Navigate to Account Settings
1. Click on your profile/account icon in the top right
2. Select **"Account"** from the dropdown menu
3. You should be on the **"General"** tab by default

### Step 3: Add Allowed Domains
1. Scroll down to find the **"Allowed Domains"** section
2. You'll see a text field where you can add domains
3. Add the following domains (one per line or separated by commas):
   ```
   youssefsalem582.github.io
   localhost
   127.0.0.1
   ```

### Step 4: Save Changes
1. Click the **"Save"** or **"Update"** button
2. Wait for confirmation that changes were saved

### Step 5: Test Your Deployed Site
1. Go to your GitHub Pages site: https://youssefsalem582.github.io/Personal-Portfolio/
2. Navigate to the Contact section
3. Fill out the form and click "Send Message"
4. You should now receive the success message! ✅

## Understanding Allowed Domains

### What are Allowed Domains?
EmailJS uses domain whitelisting as a security feature to prevent unauthorized use of your email service. Only requests from domains in your allowed list will be processed.

### Domain Format Examples
- ✅ `youssefsalem582.github.io` (without protocol)
- ✅ `localhost` (for local testing)
- ✅ `127.0.0.1` (for local testing)
- ❌ `https://youssefsalem582.github.io` (with protocol - usually not needed)
- ❌ `https://youssefsalem582.github.io/Personal-Portfolio/` (with path - not needed)

### Wildcard Support
If you want to allow all subdomains, you can use wildcards:
- `*.github.io` - allows all GitHub Pages sites
- `*.yourdomain.com` - allows all subdomains of your domain

## Alternative: Disable Domain Restrictions (Not Recommended)

If you want to allow all domains (NOT recommended for production):
1. In EmailJS Account settings
2. Find **"Allowed Domains"** section
3. Leave it empty or add `*` (asterisk)

**Warning**: This makes your EmailJS service public and anyone can use it from any website.

## Troubleshooting

### Still Getting Errors After Adding Domain?

#### 1. Clear Browser Cache
```
Ctrl + Shift + Delete (Chrome/Edge)
Cmd + Shift + Delete (Mac)
```
Clear cached images and files, then reload the page.

#### 2. Wait a Few Minutes
EmailJS may take 1-5 minutes to propagate the domain changes.

#### 3. Check Domain Format
Ensure you added the domain correctly:
- No `https://` prefix
- No trailing slashes `/`
- Exact domain name: `youssefsalem582.github.io`

#### 4. Verify API Keys
Check `lib/config/api_keys.dart`:
```dart
class ApiKeys {
  static const String emailJsServiceId = 'service_bgf2wpr';
  static const String emailJsTemplateId = 'template_bz5u3sw';
  static const String emailJsPublicKey = 'cZy6Pq5CsNS33aWbj';
  static const String recipientEmail = 'youssef.salem.hassan582@gmail.com';
}
```

#### 5. Check Browser Console
1. Open browser DevTools (F12)
2. Go to Console tab
3. Try submitting the form
4. Look for specific error messages:
   - **403 Forbidden** → Domain not whitelisted
   - **404 Not Found** → Service ID or Template ID incorrect
   - **400 Bad Request** → Form data issue
   - **CORS Error** → Domain issue

#### 6. Test EmailJS API Directly
Open browser console on your deployed site and run:
```javascript
emailjs.send('service_bgf2wpr', 'template_bz5u3sw', {
  from_name: 'Test',
  from_email: 'test@example.com',
  subject: 'Test',
  message: 'Testing direct API call',
  to_email: 'youssef.salem.hassan582@gmail.com'
}).then(
  function(response) {
    console.log('SUCCESS!', response.status, response.text);
  },
  function(error) {
    console.log('FAILED...', error);
  }
);
```

## Enhanced Error Messages

The contact form now provides more specific error messages:

### Domain Issues (403/412 errors)
```
"Domain not authorized. The website domain needs to be added to 
EmailJS allowed domains. Please contact me directly at 
youssef.salem.hassan582@gmail.com"
```
**Action**: Add domain to EmailJS allowed domains list.

### Service/Template Not Found (404)
```
"EmailJS service or template not found. Please contact me at 
youssef.salem.hassan582@gmail.com"
```
**Action**: Verify Service ID and Template ID in `api_keys.dart`.

### Network Issues
```
"Network error. Please check your internet connection and try again."
```
**Action**: Check internet connection, try again.

### Server Issues (500)
```
"EmailJS server error. Please try again later or contact me at 
youssef.salem.hassan582@gmail.com"
```
**Action**: Wait and try again, or contact directly.

## Verification Checklist

- [ ] Logged into EmailJS dashboard
- [ ] Navigated to Account → General
- [ ] Added `youssefsalem582.github.io` to Allowed Domains
- [ ] Added `localhost` to Allowed Domains (for local testing)
- [ ] Saved changes
- [ ] Waited 2-3 minutes for changes to propagate
- [ ] Cleared browser cache
- [ ] Tested form on deployed site
- [ ] Received success message
- [ ] Received email at youssef.salem.hassan582@gmail.com

## Additional Security Tips

### 1. Keep API Keys Private
Never commit real API keys to public repositories. Use environment variables for production.

### 2. Monitor Usage
- Check EmailJS dashboard regularly
- Monitor monthly email quota
- Set up usage alerts if available

### 3. Rate Limiting
EmailJS has rate limits:
- Free tier: 200 emails/month
- Consider implementing client-side throttling for high traffic sites

### 4. Backup Contact Method
Always provide direct email link as fallback:
```dart
mailto:youssef.salem.hassan582@gmail.com
```

## Success Indicators

When working correctly, you should see:
1. ✅ Form shows loading spinner when submitting
2. ✅ Success message appears: "Message sent successfully! I'll get back to you soon."
3. ✅ Form fields clear automatically
4. ✅ Email arrives in your Gmail inbox (youssef.salem.hassan582@gmail.com)
5. ✅ Browser console shows: "✅ Email sent successfully via EmailJS"

## Need More Help?

If you're still having issues:
1. Check the browser console for specific error codes
2. Verify your EmailJS template has all required variables:
   - `{{from_name}}`
   - `{{from_email}}`
   - `{{subject}}`
   - `{{message}}`
   - `{{to_email}}`
3. Test the EmailJS template directly in the EmailJS dashboard
4. Ensure your Gmail account is still connected to EmailJS
5. Check if you've exceeded your monthly email quota

## Related Files
- `lib/widgets/contact_section/contact_form_widget.dart` - Form implementation
- `lib/config/api_keys.dart` - API configuration
- `web/index.html` - EmailJS SDK loading
- `docs/index.html` - Deployed version

## Last Updated
October 25, 2025
