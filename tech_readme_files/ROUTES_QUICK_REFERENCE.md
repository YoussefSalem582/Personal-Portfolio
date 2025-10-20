# Routes Quick Reference

## 🚀 Quick Navigation Cheat Sheet

### Basic Navigation
```dart
// Go to home
Get.toNamed(AppRoutes.home);

// Go to section
Get.toNamed(AppRoutes.about);
Get.toNamed(AppRoutes.skills);
Get.toNamed(AppRoutes.projects);
Get.toNamed(AppRoutes.certificates);
Get.toNamed(AppRoutes.contact);
```

### Project Navigation
```dart
// By ID
Get.toNamed('/project/abc123');

// By Slug (SEO friendly)
Get.toNamed('/project/my-awesome-app');

// Using helper
Get.toNamed(AppRoutes.getProjectRoute('project-id'));
```

### Advanced Navigation
```dart
// Replace current route
Get.offNamed(AppRoutes.home);

// Clear stack and go
Get.offAllNamed(AppRoutes.home);

// Go back
Get.back();

// Check current route
if (Get.currentRoute == AppRoutes.home) { }
```

## 📋 All Routes

| Route | Path | Screen | Transition |
|-------|------|--------|-----------|
| Home | `/` | PortfolioScreen | fadeIn |
| Project (ID) | `/project/:id` | ProjectCaseStudy | rightToLeftWithFade |
| Project (Slug) | `/project/:slug` | ProjectCaseStudy | rightToLeftWithFade |
| About | `/about` | PortfolioScreen | fadeIn |
| Skills | `/skills` | PortfolioScreen | fadeIn |
| Projects | `/projects` | PortfolioScreen | fadeIn |
| Certificates | `/certificates` | PortfolioScreen | fadeIn |
| Experience | `/experience` | PortfolioScreen | fadeIn |
| Education | `/education` | PortfolioScreen | fadeIn |
| Services | `/services` | PortfolioScreen | fadeIn |
| Contact | `/contact` | PortfolioScreen | fadeIn |
| Blog | `/blog` | PortfolioScreen | fadeIn |
| Privacy | `/privacy` | PortfolioScreen | fadeIn |
| Terms | `/terms` | PortfolioScreen | fadeIn |
| 404 | `/404` | PortfolioScreen | fadeIn |

## 🎬 Transition Times

- **Standard**: 400ms
- **Error pages**: 200ms
- **Curve**: easeInOutCubic (projects), easeInOut (others)

## 🔧 Helper Methods

```dart
AppRoutes.getProjectRoute(id)           // '/project/:id'
AppRoutes.getProjectSlugRoute(slug)     // '/project/:slug'
AppRoutes.getBlogPostRoute(id)          // '/blog/:id'
AppRoutes.getSectionRoute(section)      // '/:section'
AppRoutes.isSectionRoute(route)         // bool
```

## 🎯 Common Patterns

### Navigate to Project
```dart
final projectId = 'abc123';
Get.toNamed(AppRoutes.getProjectRoute(projectId));
```

### Navigate with Parameters
```dart
Get.toNamed(
  AppRoutes.project,
  parameters: {'id': 'project-123'},
);
```

### Navigate with Arguments
```dart
Get.toNamed(
  AppRoutes.project,
  arguments: {'project': projectObject},
);
```

### Get Arguments in Destination
```dart
final args = Get.arguments;
final params = Get.parameters;
```

## 🔍 Route Checking

```dart
// Current route
Get.currentRoute

// Previous route
Get.previousRoute

// Is current route
Get.currentRoute == AppRoutes.home

// Route exists
AppRoutes.isSectionRoute('/about')
```

## 📱 Deep Links

### Web URLs
```
https://portfolio.com/
https://portfolio.com/project/flutter-app
https://portfolio.com/about
https://portfolio.com/contact
```

### App Scheme (Future)
```
myapp://project/123
myapp://about
```

## 🎨 Custom Transitions

```dart
Get.toNamed(
  AppRoutes.project,
  transition: Transition.zoom,
  duration: Duration(milliseconds: 500),
  curve: Curves.easeInOut,
);
```

### Available Transitions
- `fadeIn` - Fade transition
- `rightToLeft` - Slide from right
- `rightToLeftWithFade` - Slide + fade
- `leftToRight` - Slide from left
- `upToDown` - Slide from top
- `downToUp` - Slide from bottom
- `zoom` - Scale in
- `cupertino` - iOS style
- `native` - Platform native

## ⚡ Performance Tips

```dart
// Prevent duplicate navigation
preventDuplicates: true

// Maintain state
maintainState: true

// Opaque routes (better performance)
opaque: true

// Preload heavy screens
Get.lazyPut(() => HeavyController());
```

## 🐛 Debugging

```dart
// Print navigation info
print('Current: ${Get.currentRoute}');
print('Previous: ${Get.previousRoute}');
print('Arguments: ${Get.arguments}');
print('Parameters: ${Get.parameters}');

// Navigation observer
Get.routing.isBack     // Is going back
Get.routing.current    // Current route
Get.routing.previous   // Previous route
```

## 🔒 Protected Routes (Future)

```dart
// Add middleware
middlewares: [
  AuthMiddleware(),
  LoggingMiddleware(),
]

// Check auth in middleware
class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return !isLoggedIn ? RouteSettings(name: '/login') : null;
  }
}
```

## 📊 Route Analytics (Future)

```dart
// Track route changes
Get.routing.route?.name  // Current route name

// Send to analytics
Analytics.logScreenView(
  screenName: Get.currentRoute,
);
```

## ✅ Best Practices Checklist

- ✅ Use `AppRoutes` constants (never hardcode)
- ✅ Handle null/not-found cases
- ✅ Use helper methods for dynamic routes
- ✅ Add transitions for smooth UX
- ✅ Prevent duplicate navigation
- ✅ Dispose controllers properly
- ✅ Test deep links
- ✅ Document custom routes

## ❌ Common Mistakes

- ❌ Hardcoding route strings
- ❌ Not handling 404 cases
- ❌ Creating navigation loops
- ❌ Forgetting to add bindings
- ❌ Ignoring transition durations
- ❌ Not testing on all platforms

---

**Quick Start**: Import routes and navigate!
```dart
import 'routes/app_routes.dart';

// Navigate anywhere
Get.toNamed(AppRoutes.home);
```

🚀 **That's it!** Happy navigating!
