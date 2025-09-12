# Personal Portfolio - Youssef Salem Hassan

A modern, responsive, and professional Flutter Web portfolio showcasing the work and skills of Youssef Salem Hassan, a Flutter developer specializing in mobile and web applications.

## 🌟 Features

- **Responsive Design**: Optimized for desktop, tablet, and mobile devices
- **Modern UI/UX**: Clean and professional design with smooth animations
- **SEO Friendly**: Optimized meta tags and semantic HTML structure
- **Performance Optimized**: Fast loading times and efficient rendering
- **Interactive Elements**: Smooth scrolling, hover effects, and animations
- **Contact Form**: Integrated contact form with validation
- **Project Showcase**: Detailed project cards with filtering capabilities
- **Skills Display**: Visual skill representation with proficiency levels
- **Social Integration**: Links to GitHub, LinkedIn, and other platforms

## 🚀 Live Demo

- **GitHub Pages**: [https://youssefsalem582.github.io/personal_portfolio/](https://youssefsalem582.github.io/personal_portfolio/)
- **Netlify**: [Deploy URL will be provided after setup]

## 🛠️ Tech Stack

- **Framework**: Flutter 3.19.0
- **Language**: Dart
- **State Management**: Provider
- **UI Components**: Material Design 3
- **Responsive Framework**: responsive_framework
- **Animations**: flutter_staggered_animations, animated_text_kit
- **Web Navigation**: url_launcher
- **Typography**: Google Fonts
- **HTTP Requests**: http package

## 📁 Project Structure

```
lib/
├── main.dart                          # App entry point
├── models/                            # Data models
│   ├── contact.dart                   # Social link model
│   ├── contact_form.dart              # Contact form & info models
│   ├── project.dart                   # Project model
│   └── skill.dart                     # Skill & category models
├── screens/
│   ├── portfolio_screen.dart          # Main portfolio screen
│   └── sections/                      # Portfolio sections
│       ├── about_section.dart         # About me section
│       ├── contact_section.dart       # Contact form section
│       ├── hero_section.dart          # Landing hero section
│       ├── projects_section.dart      # Projects showcase
│       └── skills_section.dart        # Skills & technologies
├── theme/
│   └── app_theme.dart                 # App theme & styling
├── utils/                             # Utility classes
│   ├── portfolio_data.dart            # Developer data & content
│   ├── responsive_helper.dart         # Responsive design helpers
│   └── url_helper.dart                # URL launching utilities
└── widgets/                           # Reusable components
    ├── app_navigation.dart            # Navigation bar
    ├── footer.dart                    # Footer component
    └── project_card.dart              # Project display cards
```

## 🔧 Setup & Installation

### Prerequisites

- Flutter SDK (3.19.0 or later)
- Dart SDK (3.3.0 or later)
- Web browser for testing
- Git for version control

### Local Development

1. **Clone the repository**
   ```bash
   git clone https://github.com/YoussefSalem582/personal_portfolio.git
   cd personal_portfolio
   ```

2. **Get dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   flutter run -d web-server --web-port 8080
   ```

4. **Open in browser**
   Navigate to `http://localhost:8080`

### Building for Production

1. **Build web version**
   ```bash
   flutter build web --release
   ```

2. **Serve locally** (optional)
   ```bash
   cd build/web
   python -m http.server 8000
   ```

## 🧪 Testing

### Run all tests
```bash
flutter test
```

### Run specific test file
```bash
flutter test test/portfolio_test.dart
```

### Run widget tests
```bash
flutter test test/widget_test.dart
```

## 📱 Responsive Breakpoints

- **Mobile**: 0 - 450px
- **Tablet**: 451 - 800px
- **Desktop**: 801 - 1920px
- **4K**: 1921px+

## 🎨 Customization

### Updating Personal Information

Edit `lib/utils/portfolio_data.dart`:

```dart
class PortfolioData {
  static const String fullName = 'Your Name';
  static const String title = 'Your Title';
  static const String bio = 'Your bio...';
  // ... update other fields
}
```

### Adding Projects

Add new projects to the `projects` list in `portfolio_data.dart`:

```dart
Project(
  id: 'your-project-id',
  title: 'Project Title',
  description: 'Project description...',
  technologies: ['Flutter', 'Dart'],
  githubUrl: 'https://github.com/...',
  liveUrl: 'https://...',
  // ...
)
```

### Modifying Theme

Edit `lib/theme/app_theme.dart` to customize colors, fonts, and spacing:

```dart
class AppTheme {
  static const Color primaryColor = Color(0xFF2C3E50);
  static const Color accentColor = Color(0xFF3498DB);
  // ... customize other properties
}
```

## 🚀 Deployment

### GitHub Pages (Automated)

1. **Enable GitHub Pages** in repository settings
2. **Push to main branch** - deployment happens automatically via GitHub Actions
3. **Access your site** at `https://yourusername.github.io/personal_portfolio/`

### Netlify (Automated)

1. **Connect repository** to Netlify
2. **Set build settings**:
   - Build command: `flutter build web`
   - Publish directory: `build/web`
3. **Deploy automatically** on push to main

### Manual Deployment

1. **Build the project**
   ```bash
   flutter build web --release
   ```

2. **Upload `build/web/` contents** to your hosting provider

## 🔄 CI/CD Pipeline

The project includes a GitHub Actions workflow (`.github/workflows/deploy.yml`) that:

1. ✅ Checks out the code
2. ✅ Sets up Flutter environment
3. ✅ Installs dependencies
4. ✅ Runs tests
5. ✅ Builds the web application
6. ✅ Deploys to GitHub Pages
7. ✅ (Optional) Deploys to Netlify

## 📧 Contact Form Integration

The contact form is ready for integration with:

- **Formspree**: Add your form endpoint to `contact_section.dart`
- **Netlify Forms**: Enable forms in Netlify settings
- **EmailJS**: Configure EmailJS service
- **Custom Backend**: Implement your own API endpoint

## 🔍 SEO Optimization

The application includes:

- ✅ Meta tags for social sharing
- ✅ Semantic HTML structure
- ✅ Accessible navigation
- ✅ Fast loading times
- ✅ Mobile-friendly design
- ✅ Clean URLs

## 👤 Developer

**Youssef Salem Hassan**
- GitHub: [@YoussefSalem582](https://github.com/YoussefSalem582)
- LinkedIn: [Youssef Hassan](https://www.linkedin.com/in/youssef-hassan-8529372b7/)  
- Email: youssef.salem.hassan582@gmail.com
- Portfolio: [https://v0-youssef-salem-hassan.vercel.app/](https://v0-youssef-salem-hassan.vercel.app/)

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

---

**Built with ❤️ using Flutter**

For support or questions, please open an issue or contact the developer directly.
