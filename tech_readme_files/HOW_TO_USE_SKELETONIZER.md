# 🎯 How to Use Skeletonizer in All App Sections

## Quick Reference Guide

This guide shows you exactly how to add skeleton loading to each section of your portfolio.

## 📚 Import Statement

Add this to any section file where you want to use skeletons:

```dart
import '../../widgets/section_skeletons.dart';
```

---

## 🔥 Hero Section
**File**: `lib/screens/sections/hero_section.dart`

```dart
// Hero section typically doesn't need loading
// It's static content that displays immediately
// But if you have dynamic content:

@override
Widget build(BuildContext context) {
  if (isLoadingHeroData) {
    return const HeroSectionSkeleton();
  }
  return _buildHeroContent();
}
```

---

## 👤 About Section
**File**: `lib/screens/sections/about_section.dart`

```dart
// Add import at top
import '../../widgets/section_skeletons.dart';

// In build method
@override
Widget build(BuildContext context) {
  // If you're fetching data from API
  if (isLoadingAboutData) {
    return AboutSectionSkeleton();
  }
  
  // Or wrap in Obx for GetX
  return Obx(() {
    if (controller.isLoadingAbout) {
      return const AboutSectionSkeleton();
    }
    return _buildAboutContent();
  });
}
```

---

## 🛠️ Skills Section
**File**: `lib/screens/sections/skills_section.dart`

```dart
// Add import at top
import '../../widgets/section_skeletons.dart';

// In build method
@override
Widget build(BuildContext context) {
  // Check if skills data is empty or loading
  if (PortfolioData.skillCategories.isEmpty) {
    return const SkillsSectionSkeleton();
  }
  
  // Or with GetX
  return Obx(() {
    if (controller.isLoadingSkills) {
      return const SkillsSectionSkeleton();
    }
    return _buildSkillsContent();
  });
}
```

---

## 💼 Projects Section
**File**: `lib/screens/sections/projects_section.dart`

```dart
// Add import at top
import '../../widgets/section_skeletons.dart';

// In build method
@override
Widget build(BuildContext context) {
  // Check if projects are loading
  if (PortfolioData.projects.isEmpty) {
    return const ProjectsSectionSkeleton();
  }
  
  // Or with GetX
  return Obx(() {
    if (controller.isLoadingProjects) {
      return const ProjectsSectionSkeleton();
    }
    return _buildProjectsContent();
  });
}
```

---

## 🏆 Certificates Section
**File**: `lib/screens/sections/certificates_section.dart`

```dart
// Add import at top
import '../../widgets/section_skeletons.dart';

// In build method
@override
Widget build(BuildContext context) {
  // Check if certificates are loading
  if (PortfolioData.certificates.isEmpty) {
    return const CertificatesSectionSkeleton();
  }
  
  // Or with GetX
  return Obx(() {
    if (controller.isLoadingCertificates) {
      return const CertificatesSectionSkeleton();
    }
    return _buildCertificatesContent();
  });
}
```

---

## 📧 Contact Section
**File**: `lib/screens/sections/contact_section.dart`

```dart
// Add import at top
import '../../widgets/section_skeletons.dart';

// In build method
@override
Widget build(BuildContext context) {
  // Contact section skeleton (if fetching contact info from API)
  if (isLoadingContactInfo) {
    return const ContactSectionSkeleton();
  }
  
  // Form submission already uses CircularProgressIndicator in button
  // That's fine - no need to change it
  return _buildContactForm();
}
```

---

## 🖼️ Using Skeletons with Individual Cards

### Project Card with Skeleton:
```dart
// In a list or grid builder
itemBuilder: (context, index) {
  if (isLoadingProjects) {
    return const ProjectCardSkeleton();
  }
  return ProjectCard(project: projects[index]);
}
```

### Certificate Card with Skeleton:
```dart
// In a list or grid builder
itemBuilder: (context, index) {
  if (isLoadingCertificates) {
    return const CertificateCardSkeleton();
  }
  return CertificateCard(certificate: certificates[index]);
}
```

---

## 🎮 Controller Setup (Optional)

If you want to add loading states to your controller:

**File**: `lib/controllers/portfolio_controller.dart`

```dart
class PortfolioController extends GetxController {
  // Add loading states
  final RxBool _isLoadingSkills = false.obs;
  final RxBool _isLoadingProjects = false.obs;
  final RxBool _isLoadingCertificates = false.obs;
  final RxBool _isLoadingAbout = false.obs;
  
  // Getters
  bool get isLoadingSkills => _isLoadingSkills.value;
  bool get isLoadingProjects => _isLoadingProjects.value;
  bool get isLoadingCertificates => _isLoadingCertificates.value;
  bool get isLoadingAbout => _isLoadingAbout.value;
  
  // Load methods
  Future<void> loadSkills() async {
    _isLoadingSkills.value = true;
    try {
      // Fetch skills data
      await Future.delayed(Duration(seconds: 2)); // Simulate API call
      // Update skills data
    } finally {
      _isLoadingSkills.value = false;
    }
  }
  
  // Similar methods for other sections...
}
```

---

## 📱 Already Implemented

These are already using skeletonizer:

### ✅ Images
- `SmartImage` - Automatically shows skeleton while loading
- `LazyImage` - Automatically shows skeleton while loading

### ✅ App Loading
- `PortfolioScreen` - Shows full skeleton on initial load

### ✅ Dialogs
- `GetXHelper.showLoading()` - Shows skeleton in dialogs

---

## 🎨 Customization

### Change Skeleton Colors:
All skeletons use theme colors automatically. To customize:

```dart
Skeletonizer(
  enabled: true,
  effect: ShimmerEffect(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100,
    duration: const Duration(milliseconds: 1500),
  ),
  child: YourSkeletonWidget(),
)
```

### Change Animation Speed:
```dart
ShimmerEffect(
  duration: const Duration(milliseconds: 1000), // Faster
  // or
  duration: const Duration(milliseconds: 2000), // Slower
)
```

---

## 🚀 Quick Start Checklist

To add skeletonizer to a section:

1. ✅ Import `section_skeletons.dart`
2. ✅ Check if data is loading/empty
3. ✅ Return appropriate skeleton widget
4. ✅ Otherwise return actual content
5. ✅ Test on different screen sizes

---

## 📊 All Available Skeletons

| Skeleton Widget | Use For | Responsive |
|----------------|---------|------------|
| `SkeletonLoading` | Full page initial load | ✅ Yes |
| `HeroSectionSkeleton` | Hero section | ✅ Yes |
| `AboutSectionSkeleton` | About section + stats | ✅ Yes |
| `SkillsSectionSkeleton` | Skills section grid | ✅ Yes |
| `ProjectsSectionSkeleton` | Projects + filters | ✅ Yes |
| `CertificatesSectionSkeleton` | Certificates grid | ✅ Yes |
| `ContactSectionSkeleton` | Contact info + form | ✅ Yes |
| `ProjectCardSkeleton` | Single project card | ✅ Yes |
| `CertificateCardSkeleton` | Single certificate | ✅ Yes |

---

## 🎉 That's It!

Skeletonizer is now ready to use throughout your entire app. Just:
1. Import the skeleton widget
2. Check loading state
3. Show skeleton or content
4. Enjoy professional loading UX! 🚀
