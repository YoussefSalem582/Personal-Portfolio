# Youssef Salem Hassan - Flutter Developer Portfolio

A modern, responsive portfolio website showcasing Flutter development skills, machine learning projects, and professional achievements. Built with Flutter Web and optimized for performance and accessibility.

## 🚀 Live Demo

Visit the live portfolio: [https://youssefsalem582.github.io/Personal-Portfolio/](https://youssefsalem582.github.io/Personal-Portfolio/)

## ✨ Features

- **Responsive Design**: Optimized for mobile, tablet, and desktop
- **Modern UI/UX**: Clean, professional design with smooth animations
- **Project Galleries**: Interactive project cards with image carousels
- **Certificates Section**: Professional achievements and certifications
- **SEO Optimized**: Complete meta tags and Open Graph support
- **Accessibility**: WCAG compliant with proper semantic structure
- **Performance**: Optimized images and lazy loading
- **CI/CD**: Automated testing and deployment with GitHub Actions

## 🛠️ Tech Stack

- **Framework**: Flutter Web
- **Language**: Dart
- **State Management**: Provider
- **Styling**: Custom theme with responsive design
- **Testing**: Flutter Test (unit & widget tests)
- **CI/CD**: GitHub Actions
- **Deployment**: GitHub Pages

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  flutter_web_plugins:
    sdk: flutter
  responsive_framework: ^1.4.0
  google_fonts: ^6.1.0
  flutter_svg: ^2.0.9
  url_launcher: ^6.2.2
  flutter_staggered_animations: ^1.1.1
  animated_text_kit: ^4.2.2
  http: ^1.1.2
  provider: ^6.1.1

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0
```

## 🏃‍♂️ Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK
- Web browser (Chrome recommended for development)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/YoussefSalem582/Personal-Portfolio.git
   cd Personal-Portfolio
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app locally**
   ```bash
   flutter run -d chrome
   ```

4. **Build for production**
   ```bash
   flutter build web --release
   ```

### Development Commands

```bash
# Run with hot reload
flutter run -d chrome

# Run tests
flutter test

# Run tests with coverage
flutter test --coverage

# Analyze code
flutter analyze

# Build for web
flutter build web --release --web-renderer html
```

## 📁 Project Structure

```
lib/
├── main.dart                 # App entry point
├── models/                   # Data models
│   ├── project.dart         # Project model
│   ├── certificate.dart     # Certificate model
│   ├── skill.dart          # Skill model
│   └── contact.dart         # Contact model
├── screens/                 # Main screens
│   ├── portfolio_screen.dart # Main portfolio screen
│   └── sections/            # Page sections
│       ├── hero_section.dart
│       ├── about_section.dart
│       ├── projects_section.dart
│       ├── skills_section.dart
│       ├── certificates_section.dart
│       └── contact_section.dart
├── widgets/                 # Reusable widgets
│   ├── project_card.dart   # Project display cards
│   ├── app_navigation.dart  # Navigation component
│   └── footer.dart         # Footer component
├── utils/                   # Utilities and data
│   ├── portfolio_data.dart  # Portfolio content data
│   ├── responsive_helper.dart # Responsive utilities
│   └── url_helper.dart      # URL handling utilities
└── theme/                   # App theming
    └── app_theme.dart       # Theme configuration

assets/
├── images/                  # Project images
│   └── projects/           # Project screenshots
├── certificates/           # Certificate files and images
├── resume.pdf             # Resume download
└── profile.jpeg           # Profile image

test/                       # Test files
├── models/                # Model tests
├── widgets/               # Widget tests
└── utils/                 # Utility tests
```

## 🎨 Customization

### Updating Portfolio Content

1. **Personal Information**: Edit `lib/utils/portfolio_data.dart`
   ```dart
   static const String fullName = 'Your Name';
   static const String title = 'Your Title';
   static const String email = 'your.email@example.com';
   ```

2. **Projects**: Add/edit projects in `PortfolioData.projects`
   ```dart
   Project(
     id: 'your-project',
     title: 'Your Project Title',
     description: 'Detailed description...',
     technologies: ['Flutter', 'Dart'],
     githubUrl: 'https://github.com/username/repo',
     imageUrl: 'assets/images/projects/your-project.png',
     // ... other fields
   )
   ```

3. **Certificates**: Add/edit certificates in `PortfolioData.certificates`

4. **Skills**: Update skills categories in `PortfolioData.skills`

### Adding New Images

1. Place images in `assets/images/projects/[project-name]/`
2. Update `pubspec.yaml` to include new asset paths
3. Update project data to reference new images

### Theme Customization

Edit `lib/theme/app_theme.dart` to customize:
- Colors and gradients
- Typography
- Spacing
- Border radius
- Shadows

## 🚀 Deployment

### GitHub Pages (Recommended)

The repository includes automated GitHub Actions for deployment:

1. **Enable GitHub Pages** in repository settings
2. **Push to main branch** - deployment happens automatically
3. **Custom domain** (optional): Add CNAME record in `.github/workflows/flutter-web.yml`

### Manual Deployment

1. **Build the project**
   ```bash
   flutter build web --release
   ```

2. **Deploy `build/web/` folder** to your hosting provider:
   - **Vercel**: Connect repo → Build command: `flutter build web` → Output: `build/web`
   - **Netlify**: Build command: `flutter build web` → Publish: `build/web`
   - **Firebase Hosting**: `firebase deploy`

### Environment Variables

For contact form functionality, set these in your deployment environment:
- `CONTACT_FORM_ENDPOINT` (optional)
- `RECAPTCHA_SITE_KEY` (optional)

## 🧪 Testing

The project includes comprehensive tests:

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage

# Run specific test file
flutter test test/widgets/project_card_test.dart
```

### Test Coverage

- **Unit Tests**: Models and utility functions
- **Widget Tests**: Core UI components
- **Integration Tests**: User workflows (planned)

## 📊 Performance

- **Lighthouse Score**: 90+ (Performance, Accessibility, Best Practices, SEO)
- **Bundle Size**: Optimized with tree-shaking
- **Image Optimization**: WebP format where supported
- **Lazy Loading**: Non-critical images loaded on demand

## 🔧 Development Tools

- **VS Code Extensions**:
  - Flutter
  - Dart
  - Flutter Widget Snippets
  - GitLens

- **Debugging**:
  - Flutter Inspector
  - Chrome DevTools
  - Network tab for asset loading

## 📱 Browser Support

- Chrome (recommended)
- Firefox
- Safari
- Edge
- Mobile browsers (iOS Safari, Chrome Mobile)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👤 Contact

**Youssef Salem Hassan**
- Email: [youssef.salem.hassan582@gmail.com](mailto:youssef.salem.hassan582@gmail.com)
- LinkedIn: [linkedin.com/in/youssef-hassan-8529372b7/](https://www.linkedin.com/in/youssef-hassan-8529372b7/)
- GitHub: [github.com/YoussefSalem582](https://github.com/YoussefSalem582)
- Portfolio: [youssefsalem582.github.io/Personal-Portfolio/](https://youssefsalem582.github.io/Personal-Portfolio/)

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Open source community for packages and inspiration
- Design inspiration from modern portfolio websites

---

**Built with ❤️ using Flutter**