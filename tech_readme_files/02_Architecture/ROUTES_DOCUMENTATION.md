# Routes Documentation

## Overview
Complete routing system for the portfolio application using GetX navigation with enhanced transitions, deep linking support, and SEO-friendly URLs.

## 📁 Route Files

### `app_routes.dart`
Defines all route name constants and helper methods.

### `app_pages.dart`
Configures GetPage routes with transitions, bindings, and middleware.

## 🛣️ Available Routes

### Main Routes

#### Home Route
```dart
AppRoutes.home = '/'
```
- **Page**: PortfolioScreen
- **Binding**: InitialBindings
- **Transition**: fadeIn (400ms)
- **Description**: Main landing page with all portfolio sections

### Project Routes

#### Project by ID
```dart
AppRoutes.project = '/project/:id'
```
- **Page**: ProjectCaseStudy
- **Transition**: rightToLeftWithFade (400ms)
- **Parameters**: `id` (project identifier)
- **Example**: `/project/123abc`
- **Features**:
  - Automatic 404 redirect if project not found
  - Uses `firstWhereOrNull` for safe navigation
  - Cupertino parallax effect enabled

**Usage:**
```dart
Get.toNamed(AppRoutes.getProjectRoute('project_id'));
// Or
Get.toNamed('/project/123abc');
```

#### Project by Slug (SEO Friendly)
```dart
AppRoutes.projectSlug = '/project/:slug'
```
- **Page**: ProjectCaseStudy
- **Transition**: rightToLeftWithFade (400ms)
- **Parameters**: `slug` (URL-friendly project name)
- **Example**: `/project/flutter-portfolio-app`
- **Features**:
  - SEO-optimized URLs
  - Matches project title (lowercase, spaces replaced with hyphens)
  - Graceful fallback to home if not found

**Usage:**
```dart
Get.toNamed(AppRoutes.getProjectSlugRoute('my-awesome-project'));
```

### Section Routes (Deep Linking)

All section routes redirect to PortfolioScreen and can be enhanced with scroll-to-section functionality.

#### About Section
```dart
AppRoutes.about = '/about'
```

#### Skills Section
```dart
AppRoutes.skills = '/skills'
```

#### Projects Section
```dart
AppRoutes.projects = '/projects'
```

#### Certificates Section
```dart
AppRoutes.certificates = '/certificates'
```

#### Experience Section
```dart
AppRoutes.experience = '/experience'
```

#### Education Section
```dart
AppRoutes.education = '/education'
```

#### Services Section
```dart
AppRoutes.services = '/services'
```

#### Contact Section
```dart
AppRoutes.contact = '/contact'
```

#### Blog Section
```dart
AppRoutes.blog = '/blog'
```

### Legal & Info Routes

#### Privacy Policy
```dart
AppRoutes.privacy = '/privacy'
```

#### Terms of Service
```dart
AppRoutes.terms = '/terms'
```

### Error Routes

#### 404 Not Found
```dart
AppRoutes.notFound = '/404'
```
- **Page**: PortfolioScreen (fallback)
- **Transition**: fadeIn (200ms)

## 🎬 Transition Types

### Available Transitions

| Route | Transition | Duration | Curve |
|-------|-----------|----------|-------|
| Home | fadeIn | 400ms | easeInOut |
| Project | rightToLeftWithFade | 400ms | easeInOutCubic |
| Sections | fadeIn | 400ms | default |
| Error | fadeIn | 200ms | default |

### Transition Options

```dart
// Default transition duration
static const transitionDuration = Duration(milliseconds: 400);

// Available GetX transitions:
- Transition.fadeIn
- Transition.rightToLeft
- Transition.rightToLeftWithFade
- Transition.leftToRight
- Transition.topLevel
- Transition.zoom
- Transition.cupertino
```

## 🔧 Helper Methods

### Navigation Helpers

```dart
// Get project route by ID
AppRoutes.getProjectRoute(String id)
// Returns: '/project/$id'

// Get project route by slug
AppRoutes.getProjectSlugRoute(String slug)
// Returns: '/project/$slug'

// Get blog post route
AppRoutes.getBlogPostRoute(String id)
// Returns: '/blog/$id'

// Get section route
AppRoutes.getSectionRoute(String section)
// Returns: '/$section'

// Check if route is a section
AppRoutes.isSectionRoute(String route)
// Returns: bool
```

### Usage Examples

```dart
// Navigate to project by ID
Get.toNamed(AppRoutes.getProjectRoute('abc123'));

// Navigate to project by slug
Get.toNamed(AppRoutes.getProjectSlugRoute('my-portfolio'));

// Navigate to section
Get.toNamed(AppRoutes.about);

// Check if current route is a section
if (AppRoutes.isSectionRoute(Get.currentRoute)) {
  // Do something
}
```

## 🚀 Advanced Features

### Prevent Duplicates
```dart
preventDuplicates: true
```
All main routes have duplicate prevention enabled to avoid navigation stack issues.

### Cupertino Parallax
```dart
showCupertinoParallax: true
```
Project routes include iOS-style parallax effect for smoother transitions.

### Opaque Routes
```dart
opaque: true
```
Project routes are opaque for better performance.

### Custom Transition Builder
```dart
AppPages.customTransition(String routeName)
```
Returns custom transition function for specific routes (currently for project routes with slide + fade).

## 🎯 Navigation Examples

### Basic Navigation

```dart
// Go to home
Get.toNamed(AppRoutes.home);

// Go to about section
Get.toNamed(AppRoutes.about);

// Go to project
Get.toNamed(
  AppRoutes.project,
  parameters: {'id': 'project123'},
);
```

### Advanced Navigation

```dart
// Navigate with transition override
Get.toNamed(
  AppRoutes.project,
  parameters: {'id': 'abc'},
  transition: Transition.zoom,
  duration: Duration(milliseconds: 500),
);

// Navigate and remove previous routes
Get.offAllNamed(AppRoutes.home);

// Navigate and remove until
Get.offNamedUntil(
  AppRoutes.home,
  ModalRoute.withName(AppRoutes.home),
);
```

### Deep Linking

```dart
// Browser URL: https://portfolio.com/project/flutter-app
// Automatically routes to ProjectCaseStudy with slug 'flutter-app'

// Browser URL: https://portfolio.com/about
// Routes to PortfolioScreen with About section
```

## 🔒 Route Guards (Future Enhancement)

### Middleware Example
```dart
class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (!isAuthenticated) {
      return RouteSettings(name: AppRoutes.home);
    }
    return null;
  }
}

// Add to route:
GetPage(
  name: '/admin',
  page: () => AdminScreen(),
  middlewares: [AuthMiddleware()],
)
```

## 🎨 Route Configuration

### Adding New Routes

1. **Add route name to `app_routes.dart`:**
```dart
static const newRoute = '/new-route';
```

2. **Add GetPage to `app_pages.dart`:**
```dart
GetPage(
  name: AppRoutes.newRoute,
  page: () => const NewScreen(),
  binding: NewBindings(),
  transition: Transition.fadeIn,
  transitionDuration: transitionDuration,
),
```

3. **Add helper method (optional):**
```dart
static String getNewRoute(String param) => '/new-route/$param';
```

## 📊 Route Analytics

### Track Navigation
```dart
// In GetMaterialApp
navigatorObservers: [
  GetObserver(
    (routing) {
      print('Route: ${routing?.current}');
      // Send to analytics
    },
  ),
],
```

## 🐛 Debugging Routes

### Print Current Route
```dart
print('Current route: ${Get.currentRoute}');
```

### Print Route History
```dart
print('Route history: ${Get.routing}');
```

### Get Previous Route
```dart
final previous = Get.previousRoute;
```

## 🔍 SEO Optimization

### URL Structure
```
✅ Good: /project/flutter-portfolio-app
❌ Bad:  /project/12345

✅ Good: /about
❌ Bad:  /#about

✅ Good: /certificates
❌ Bad:  /portfolio?section=certificates
```

### Meta Tags
Routes can be enhanced with meta tags for better SEO:
```dart
GetPage(
  name: AppRoutes.about,
  page: () => const PortfolioScreen(),
  metadata: {
    'title': 'About - Portfolio',
    'description': 'Learn more about me',
  },
)
```

## 📱 Mobile Deep Links

### Android Configuration
Add to `AndroidManifest.xml`:
```xml
<intent-filter>
  <action android:name="android.intent.action.VIEW" />
  <category android:name="android.intent.category.DEFAULT" />
  <category android:name="android.intent.category.BROWSABLE" />
  <data
    android:scheme="https"
    android:host="yourportfolio.com" />
</intent-filter>
```

### iOS Configuration
Add to `Info.plist`:
```xml
<key>CFBundleURLTypes</key>
<array>
  <dict>
    <key>CFBundleURLSchemes</key>
    <array>
      <string>https</string>
    </array>
  </dict>
</array>
```

## 🎯 Best Practices

### ✅ Do's
- Use named routes for navigation
- Always handle 404 cases
- Use helper methods for dynamic routes
- Keep route names consistent
- Add transitions for better UX
- Implement proper error handling
- Use bindings for dependency injection

### ❌ Don'ts
- Don't hardcode route strings
- Don't ignore null safety
- Don't skip transition configurations
- Don't forget to dispose controllers
- Don't create route loops
- Don't ignore deep linking setup

## 🔮 Future Enhancements

### Planned Features
1. **Section Scrolling**: Auto-scroll to section when using section routes
2. **Route Middleware**: Authentication and authorization
3. **Nested Navigation**: Tabs within routes
4. **Route Caching**: Cache project pages
5. **Animated Transitions**: More custom transitions
6. **Route Analytics**: Track popular routes
7. **Breadcrumbs**: Navigation breadcrumb trail
8. **Route History**: Back/forward navigation support

### Implementation Ideas

#### Auto-scroll to Section
```dart
GetPage(
  name: AppRoutes.about,
  page: () => PortfolioScreen(scrollToSection: 'about'),
)
```

#### Route Middleware
```dart
middlewares: [
  RateLimitMiddleware(),
  LoggingMiddleware(),
],
```

#### Route Caching
```dart
GetPage(
  name: AppRoutes.project,
  page: () => ProjectCaseStudy(...),
  maintainState: true, // Keep state when navigating away
)
```

## 📚 References

### GetX Navigation
- [GetX Documentation](https://pub.dev/packages/get)
- [Named Routes](https://github.com/jonataslaw/getx#named-routes)
- [Route Management](https://github.com/jonataslaw/getx#route-management)

### Flutter Navigation
- [Navigator 2.0](https://flutter.dev/docs/development/ui/navigation)
- [Deep Linking](https://flutter.dev/docs/development/ui/navigation/deep-linking)

---

**Last Updated**: October 20, 2025  
**Version**: 2.0  
**Status**: Production Ready ✅

## Summary

The routing system now includes:
- **16+ defined routes** (home, projects, sections, legal)
- **Enhanced transitions** with customizable durations and curves
- **SEO-friendly URLs** with slug support
- **Deep linking** for all sections
- **Error handling** with 404 fallback
- **Helper methods** for dynamic route generation
- **Type-safe navigation** with route constants
- **Future-proof architecture** for easy expansion

All routes are production-ready with proper error handling, transitions, and navigation flows! 🚀
