# 🎯 Quick Reference - Portfolio v2.0

## 🚀 Commands

```bash
# Run development server
flutter run -d chrome

# Build for production
flutter build web --release

# Check for issues
flutter analyze

# Update packages
flutter pub upgrade

# Clean build
flutter clean && flutter pub get
```

---

## 📂 Key Files

| File | Purpose |
|------|---------|
| `lib/routes/app_routes.dart` | Route names |
| `lib/routes/app_pages.dart` | Route config |
| `lib/controllers/portfolio_controller.dart` | Data & loading |
| `lib/main.dart` | App entry + routing |
| `lib/config/supabase_config.dart` | Supabase credentials |

---

## 🔀 GetX Navigation

```dart
// Navigate to project
Get.toNamed(AppRoutes.project, parameters: {'id': 'project_123'});

// Go back
Get.back();

// Go to home
Get.offAllNamed(AppRoutes.home);

// Navigate with result
final result = await Get.toNamed(AppRoutes.project);
```

---

## 📊 Loading States

```dart
// In controller
final isLoading = false.obs;

Future<void> loadData() async {
  isLoading.value = true;
  try {
    // Load data
  } finally {
    isLoading.value = false;
  }
}

// In UI
Obx(() {
  if (controller.isLoading) return LoadingWidget();
  if (controller.error != null) return ErrorWidget();
  return ContentWidget();
})
```

---

## 🎨 Color API (New)

```dart
// Old (deprecated)
Colors.black.withOpacity(0.5)

// New (correct)
Colors.black.withValues(alpha: 0.5)
```

---

## 🔄 Route Names

```dart
AppRoutes.home           // '/'
AppRoutes.project        // '/project/:id'
AppRoutes.contact        // '/contact'
AppRoutes.about          // '/about'
AppRoutes.skills         // '/skills'
AppRoutes.projects       // '/projects'
AppRoutes.certificates   // '/certificates'
```

---

## 📈 Current Status

- **Issues:** 5 (all minor)
- **Errors:** 0
- **Dependencies:** 22 updated
- **Status:** ✅ Production Ready

---

## 📚 Documentation

- **Setup:** `SUPABASE_COMPLETE_SETUP.md`
- **Summary:** `COMPLETE_UPGRADE_SUMMARY.md`
- **Checklist:** `UPGRADE_CHECKLIST.md`
- **Examples:** `GETX_EXAMPLES.md`
- **Migration:** `GETX_MIGRATION.md`

---

## 🐛 Troubleshooting

### App not loading?
```bash
flutter clean
flutter pub get
flutter run -d chrome
```

### Routing not working?
- Check `lib/main.dart` has `getPages: AppPages.routes`
- Verify route names in `AppRoutes`

### Loading state stuck?
- Check Supabase credentials
- Look for errors in console
- App should fallback to static data

---

## ✅ Quick Test

```bash
# 1. Run app
flutter run -d chrome

# 2. Check console
✅ Supabase initialized
📊 Using Supabase data (or 📁 using static)

# 3. Test features
- Click project → GetX navigation works
- See loading spinner → Loading state works
- Theme toggle → Theme persists
```

---

**Version:** 2.0  
**Updated:** October 19, 2025  
**Status:** Production Ready ✅
