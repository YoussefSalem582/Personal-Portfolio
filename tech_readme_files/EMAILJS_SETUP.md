# EmailJS Setup Guide for Contact Form

This guide will help you set up EmailJS to make your contact form functional and receive emails at `youssef.salem.hassan582@gmail.com`.

## Step 1: Create EmailJS Account

1. Go to [https://www.emailjs.com/](https://www.emailjs.com/)
2. Click **Sign Up** (it's free for up to 200 emails/month)
3. Verify your email address

## Step 2: Add Email Service

1. After logging in, go to **Email Services** in the sidebar
2. Click **Add New Service**
3. Select **Gmail** (recommended)
4. Connect your Gmail account: `youssef.salem.hassan582@gmail.com`
5. Click **Create Service**
6. **Copy the Service ID** (e.g., `service_abc123`)

## Step 3: Create Email Template

1. Go to **Email Templates** in the sidebar
2. Click **Create New Template**
3. Replace the template content with:

```
Subject: New Portfolio Contact: {{subject}}

From: {{from_name}}
Email: {{from_email}}

Message:
{{message}}

---
This message was sent from your portfolio website contact form.
```

4. In the **To Email** field, you can use: `{{to_email}}` (we send this from the form)
5. Or directly set it to: `youssef.salem.hassan582@gmail.com`
6. Click **Save**
7. **Copy the Template ID** (e.g., `template_xyz789`)

## Step 4: Get Your Public Key

1. Go to **Account** → **General** in the sidebar
2. Find your **Public Key** (also called User ID)
3. **Copy the Public Key** (e.g., `user_DEFghi456`)

## Step 5: Update Your Code

Open `lib/widgets/contact_section/contact_form_widget.dart` and replace these lines:

```dart
const serviceId = 'YOUR_SERVICE_ID'; // Replace with your Service ID
const templateId = 'YOUR_TEMPLATE_ID'; // Replace with your Template ID
const publicKey = 'YOUR_PUBLIC_KEY'; // Replace with your Public Key
```

With your actual values:

```dart
const serviceId = 'service_abc123'; // Your actual Service ID
const templateId = 'template_xyz789'; // Your actual Template ID
const publicKey = 'user_DEFghi456'; // Your actual Public Key
```

## Step 6: Test Your Form

1. Run your Flutter app:
   ```bash
   flutter run -d chrome
   ```

2. Navigate to the Contact section
3. Fill out the form and submit
4. Check your email at `youssef.salem.hassan582@gmail.com`

## Template Variables Reference

The form sends these variables to EmailJS:

- `{{from_name}}` - Name from the form
- `{{from_email}}` - Email from the form
- `{{subject}}` - Subject from the form
- `{{message}}` - Message from the form
- `{{to_email}}` - Your email (youssef.salem.hassan582@gmail.com)

## Troubleshooting

### Form not sending
- Check browser console for errors
- Verify all three credentials (Service ID, Template ID, Public Key) are correct
- Make sure you've connected your Gmail account to EmailJS

### Not receiving emails
- Check spam/junk folder
- Verify the template has correct "To Email" field
- Ensure Gmail account is properly connected in EmailJS dashboard

### Error messages
- **401 Unauthorized**: Wrong Public Key
- **400 Bad Request**: Wrong Service ID or Template ID
- **Network Error**: Check internet connection

## Alternative: Using Formspree (Simpler)

If you prefer a simpler setup:

1. Go to [https://formspree.io/](https://formspree.io/)
2. Create account and verify email
3. Create a new form
4. Get your form endpoint (e.g., `https://formspree.io/f/abc123xyz`)
5. Replace the `_submitContactForm` method with:

```dart
Future<void> _submitContactForm(ContactForm form) async {
  final url = Uri.parse('https://formspree.io/f/YOUR_FORM_ID');
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'name': form.name,
      'email': form.email,
      'subject': form.subject,
      'message': form.message,
    }),
  );

  if (response.statusCode != 200) {
    throw Exception('Failed to send message');
  }
}
```

## Free Tier Limits

- **EmailJS**: 200 emails/month free
- **Formspree**: 50 submissions/month free

Both are sufficient for portfolio websites!

## Security Note

The credentials in your code are **public keys** meant to be used in client-side applications. They are safe to include in your repository. However, consider setting up rate limiting in the EmailJS dashboard to prevent abuse.

---

**Need Help?**
- EmailJS Documentation: https://www.emailjs.com/docs/
- Formspree Documentation: https://help.formspree.io/
