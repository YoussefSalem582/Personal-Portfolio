# Personal Portfolio - Youssef Salem Hassan

A modern, responsive Flutter portfolio application showcasing my work as a Flutter Developer & Mobile App Specialist. Built with Flutter for web, Android, and iOS platforms.

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-039BE5?style=for-the-badge&logo=Firebase&logoColor=white)

## 🌟 Features

### 📱 Cross-Platform Support
- **Web**: Responsive single-page application
- **Android**: Native Android app
- **iOS**: Native iOS app  
- **PWA**: Progressive Web App capabilities

### 🎨 Modern UI/UX
- **Responsive Design**: Mobile-first approach with tablet and desktop layouts
- **Dark/Light Theme**: Automatic theme switching with user preference storage
- **Smooth Animations**: Engaging transitions and micro-interactions
- **Accessibility**: WCAG compliant with proper semantic labels and keyboard navigation

### 🚀 Performance & Architecture
- **Null Safety**: Built with sound null safety
- **State Management**: Riverpod for predictable state management
- **Routing**: Go Router for declarative navigation
- **Modular Architecture**: Clean, scalable folder structure

### 📄 Content Sections
- **Home**: Hero section with quick links and featured projects
- **About**: Professional background, skills, and bio
- **Projects**: Portfolio showcase with detailed project pages
- **Experience**: Professional timeline and achievements
- **Contact**: Contact form and social links
- **Blog**: Technical articles and insights (optional)

## 🛠️ Technology Stack

### Frontend
- **Flutter 3.16+** - UI framework
- **Dart 3.0+** - Programming language
- **Go Router** - Declarative routing
- **Riverpod** - State management
- **Google Fonts** - Typography
- **Font Awesome Flutter** - Icons

### Backend & Services
- **Firebase** (optional) - Backend services
- **Shared Preferences** - Local storage
- **HTTP** - API communication
- **URL Launcher** - External link handling

### Development Tools
- **GitHub Actions** - CI/CD pipeline
- **Flutter Test** - Unit and widget testing
- **Flutter Lints** - Code analysis
- **Build Runner** - Code generation

## 📁 Project Structure

```
lib/
├── main.dart                          # App entry point
├── src/
│   ├── app.dart                       # Main app widget
│   ├── core/                          # Core functionality
│   │   ├── routing/                   # App routing configuration
│   │   │   └── app_router.dart
│   │   └── theme/                     # App theming
│   │       └── app_theme.dart
│   ├── features/                      # Feature modules
│   │   ├── home/                      # Home page feature
│   │   │   └── presentation/
│   │   │       ├── pages/
│   │   │       └── widgets/
│   │   ├── about/                     # About page feature
│   │   ├── projects/                  # Projects feature
│   │   ├── experience/                # Experience feature
│   │   ├── contact/                   # Contact feature
│   │   └── blog/                      # Blog feature
│   └── shared/                        # Shared components
│       ├── providers/                 # Global providers
│       └── widgets/                   # Reusable widgets
assets/
├── content.json                       # Portfolio content data
├── images/                           # Image assets
├── icons/                            # Icon assets
└── resume.pdf                        # Resume file
test/                                 # Test files
├── unit/                             # Unit tests
├── widgets/                          # Widget tests
└── widget_test.dart                  # Main widget tests
```

## 🚀 Getting Started

### Prerequisites

- **Flutter SDK**: 3.16.0 or higher
- **Dart SDK**: 3.0.0 or higher
- **Android Studio** / **VS Code** with Flutter extensions
- **Git** for version control

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/youssefhassan/personal_portfolio.git
   cd personal_portfolio
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   # For web development
   flutter run -d chrome
   
   # For mobile development (with device/emulator connected)
   flutter run
   
   # For specific platforms
   flutter run -d android
   flutter run -d ios
   ```

### Development Setup

1. **Enable web support** (if not already enabled)
   ```bash
   flutter config --enable-web
   ```

2. **Check Flutter doctor**
   ```bash
   flutter doctor
   ```

3. **Run tests**
   ```bash
   flutter test
   ```

4. **Format code**
   ```bash
   flutter format .
   ```

5. **Analyze code**
   ```bash
   flutter analyze
   ```

## 🏗️ Building for Production

### Web Application

```bash
# Build optimized web app
flutter build web --release --web-renderer html

# The built files will be in build/web/
# Deploy the contents of build/web/ to your web server
```

### Android APK

```bash
# Build APK
flutter build apk --release

# Build App Bundle (recommended for Play Store)
flutter build appbundle --release
```

### iOS App

```bash
# Build iOS app (requires macOS and Xcode)
flutter build ios --release
```

## 🌐 Deployment Options

### Web Deployment

#### Firebase Hosting
1. Install Firebase CLI: `npm install -g firebase-tools`
2. Initialize: `firebase init hosting`
3. Build: `flutter build web`
4. Deploy: `firebase deploy`

#### GitHub Pages
1. Build the web app
2. Push `build/web` contents to `gh-pages` branch
3. Enable GitHub Pages in repository settings

#### Netlify
1. Connect your GitHub repository
2. Set build command: `flutter build web`
3. Set publish directory: `build/web`

#### Vercel
1. Import your GitHub repository
2. Set framework preset to "Other"
3. Set build command: `flutter build web`
4. Set output directory: `build/web`

### Mobile Deployment

#### Google Play Store
1. Build app bundle: `flutter build appbundle`
2. Upload to Google Play Console
3. Follow Play Store guidelines for app submission

#### Apple App Store
1. Build iOS app: `flutter build ios`
2. Open `ios/Runner.xcworkspace` in Xcode
3. Archive and upload to App Store Connect

## 🧪 Testing

### Running Tests

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage

# Run specific test file
flutter test test/unit/theme_provider_test.dart

# Run widget tests
flutter test test/widgets/
```

### Test Structure

- **Unit Tests**: Test individual functions and classes
- **Widget Tests**: Test widget behavior and UI
- **Integration Tests**: Test app workflows (add as needed)

## 📊 CI/CD Pipeline

The project includes a comprehensive GitHub Actions workflow:

### Automated Processes
- **Code Quality**: Formatting, linting, and analysis
- **Testing**: Unit and widget tests with coverage
- **Building**: Web, Android, and iOS builds
- **Security**: Vulnerability scanning
- **Deployment**: Automated deployment to chosen platform

### Setup CI/CD
1. Push code to GitHub repository
2. Configure secrets for deployment (if needed)
3. Workflow runs automatically on push/PR

## 🎨 Customization

### Content Management

Edit `assets/content.json` to update:
- Personal information
- Skills and technologies
- Project details
- Experience timeline
- Contact information

### Styling

- **Colors**: Modify `lib/src/core/theme/app_theme.dart`
- **Fonts**: Update font families in `pubspec.yaml`
- **Layout**: Adjust responsive breakpoints in `responsive_layout.dart`

### Adding New Features

1. Create feature module in `lib/src/features/`
2. Add routing in `app_router.dart`
3. Update navigation widgets
4. Add tests for new functionality

## 🔧 Configuration

### Environment Variables

Create `.env` file for sensitive data:
```
FIREBASE_API_KEY=your_api_key
EMAIL_SERVICE_URL=your_email_service
```

### Firebase Setup (Optional)

1. Create Firebase project
2. Add web app to project
3. Update `web/index.html` with Firebase config
4. Enable required services (Hosting, Firestore, etc.)

## 📱 Progressive Web App

The app is configured as a PWA with:
- **Service Worker**: Offline functionality
- **Web Manifest**: Installation support
- **Icons**: App icons for different platforms

## 🐛 Troubleshooting

### Common Issues

1. **Flutter version conflicts**
   ```bash
   flutter --version
   flutter upgrade
   ```

2. **Dependency conflicts**
   ```bash
   flutter clean
   flutter pub get
   ```

3. **Web build issues**
   ```bash
   flutter config --enable-web
   flutter build web --verbose
   ```

4. **Android build issues**
   - Check Java version (Java 11+ required)
   - Update Android SDK tools
   - Clean project: `flutter clean`

## 📈 Performance Optimization

### Web Performance
- Use `--web-renderer html` for better compatibility
- Optimize images and assets
- Enable caching headers on server

### Mobile Performance
- Use `const` constructors where possible
- Optimize image sizes
- Implement lazy loading for large lists

## 🤝 Contributing

1. Fork the repository
2. Create feature branch: `git checkout -b feature/new-feature`
3. Commit changes: `git commit -am 'Add new feature'`
4. Push to branch: `git push origin feature/new-feature`
5. Submit Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Youssef Salem Hassan**
- 📧 Email: youssef.salem.hassan@gmail.com
- 💼 LinkedIn: [linkedin.com/in/youssef-salem-hassan](https://linkedin.com/in/youssef-salem-hassan)
- 🐙 GitHub: [github.com/youssefhassan](https://github.com/youssefhassan)
- 🌐 Portfolio: [youssefhassan.dev](https://youssefhassan.dev)

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Open source contributors
- Design inspiration from modern portfolio websites

---

## 📋 Developer Checklist

### Before Production Deployment

- [ ] Update all placeholder content with real data
- [ ] Replace placeholder images with actual photos/screenshots
- [ ] Test on multiple devices and screen sizes
- [ ] Verify all external links work correctly
- [ ] Check accessibility compliance
- [ ] Optimize images and assets
- [ ] Set up analytics (Google Analytics, Firebase Analytics)
- [ ] Configure SEO meta tags
- [ ] Test PWA functionality
- [ ] Set up error monitoring (Sentry, Crashlytics)
- [ ] Prepare marketing assets (screenshots, descriptions)
- [ ] Update social media links
- [ ] Test contact form functionality
- [ ] Review and update privacy policy
- [ ] Set up custom domain (if applicable)
- [ ] Configure SSL certificate

### Marketing & Launch

- [ ] Create social media posts
- [ ] Write launch blog post
- [ ] Submit to portfolio showcases
- [ ] Share on developer communities
- [ ] Update resume with portfolio link
- [ ] Add portfolio link to email signature

---

*Built with ❤️ using Flutter*