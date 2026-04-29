// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Youssef Salem - Portfolio';

  @override
  String get navHome => 'Home';

  @override
  String get navAbout => 'About';

  @override
  String get navSkills => 'Skills';

  @override
  String get navExpertise => 'Expertise';

  @override
  String get navProjects => 'Projects';

  @override
  String get navCertificates => 'Certificates';

  @override
  String get navContact => 'Contact';

  @override
  String get sectionAboutTitle => 'About Me';

  @override
  String get sectionProjectsTitle => 'My Projects';

  @override
  String get sectionProjectsSubtitle =>
      'Here are some of the projects I\'ve worked on';

  @override
  String get sectionSkillsTitle => 'My Tech Stack';

  @override
  String get sectionSkillsSubtitle =>
      'A collection of technologies I am proficient in and enjoy working with';

  @override
  String get sectionCertificatesTitle => 'Certificates & Achievements';

  @override
  String get sectionCertificatesSubtitle =>
      'Professional certifications showcasing continuous learning and expertise';

  @override
  String get sectionExpertiseTitle => 'My Expertise';

  @override
  String get sectionExpertiseSubtitle =>
      'Combining cutting-edge technology with innovative solutions';

  @override
  String get sectionContactTitle => 'Get In Touch';

  @override
  String get sectionContactSubtitle =>
      'Let\'s discuss your next project or collaboration opportunity';

  @override
  String get heroGreeting => 'Hello, I\'m';

  @override
  String get heroRoleFlutterDeveloper => 'Flutter Developer';

  @override
  String get heroRoleMobileAppDeveloper => 'Mobile App Developer';

  @override
  String get heroRoleSoftwareEngineer => 'Software Engineer';

  @override
  String get linksMenu => 'Links';

  @override
  String get linksGithubProfile => 'GitHub Profile';

  @override
  String get linksLinkedIn => 'LinkedIn Profile';

  @override
  String get linksYoutube => 'YouTube Channel';

  @override
  String get linksResume => 'Resume';

  @override
  String get resumeOpenError => 'Error opening resume';

  @override
  String get resumeOpening => 'Opening resume...';

  @override
  String get resumeOpenErrorRetry => 'Error opening resume. Please try again.';

  @override
  String get filterAll => 'All';

  @override
  String copyrightNotice(int year, String name) {
    return '© $year $name. All rights reserved.';
  }

  @override
  String get footerBuiltWith => 'Built with';

  @override
  String get footerUsingFlutter => 'using Flutter';

  @override
  String get footerTagline =>
      'Creating beautiful and functional applications with Flutter. Passionate about clean code and exceptional user experiences.';

  @override
  String get footerQuickLinks => 'Quick Links';

  @override
  String get footerGetInTouch => 'Get In Touch';

  @override
  String get footerFollowMe => 'Follow Me';

  @override
  String get footerViewResume => 'View Resume';

  @override
  String get contactFormTitle => 'Send Me a Message';

  @override
  String get contactFormSubtitle => 'I\'ll get back to you within 24 hours';

  @override
  String get contactFieldName => 'Your Name';

  @override
  String get contactFieldNameHint => 'Enter your full name';

  @override
  String get contactValidationNameRequired => 'Please enter your name';

  @override
  String get contactFieldEmail => 'Your Email';

  @override
  String get contactFieldEmailHint => 'Enter your email address';

  @override
  String get contactValidationEmailRequired => 'Please enter your email';

  @override
  String get contactValidationEmailInvalid => 'Please enter a valid email';

  @override
  String get contactFieldSubject => 'Subject';

  @override
  String get contactFieldSubjectHint => 'What is this about?';

  @override
  String get contactValidationSubjectRequired => 'Please enter a subject';

  @override
  String get contactFieldMessage => 'Message';

  @override
  String get contactFieldMessageHint =>
      'Tell me about your project or inquiry...';

  @override
  String get contactValidationMessageRequired => 'Please enter your message';

  @override
  String get contactValidationMessageMinLength =>
      'Message must be at least 10 characters';

  @override
  String get contactSendButton => 'Send Message';

  @override
  String get contactSuccessMessage =>
      'Message sent successfully! I\'ll get back to you soon.';

  @override
  String get contactErrorGeneric => 'Error sending message. ';

  @override
  String get contactErrorTimeout =>
      'Request timeout. Please check your internet connection and try again.';

  @override
  String contactErrorAuth(String email) {
    return 'Email service authentication issue. Please contact me directly at $email';
  }

  @override
  String contactError404(String email) {
    return 'Email service configuration not found. Please contact me directly at $email';
  }

  @override
  String get contactErrorInvalidForm =>
      'Invalid form data. Please check your inputs and try again.';

  @override
  String contactErrorServer(String email) {
    return 'Email service is temporarily unavailable. Please try again later or contact me directly at $email';
  }

  @override
  String contactErrorCors(String email) {
    return 'Browser security issue. Please try again or contact me directly at $email';
  }

  @override
  String get contactErrorNetworkGen =>
      'Network connection issue. Please check your internet and try again.';

  @override
  String contactErrorTryDirect(String email) {
    return 'Please try again or contact me directly at $email';
  }

  @override
  String get contactErrorNotConfigured =>
      'Formspree endpoint not configured. Please contact the administrator.';

  @override
  String contactErrorFormDisabledWithEmail(String email) {
    return 'Form is disabled or spam detected. Please contact me directly at $email';
  }

  @override
  String get contactErrorRateLimit =>
      'Too many requests. Please wait a moment and try again.';

  @override
  String contactErrorFailedWithCode(int code, String email) {
    return 'Failed to send message (Error $code). Please try again or contact me directly at $email';
  }

  @override
  String get contactErrorCertificate =>
      'Security certificate error. Please contact the administrator.';

  @override
  String get contactErrorNetworkSimple =>
      'Network error. Please check your internet connection and try again.';

  @override
  String get drawerTheme => 'Theme';

  @override
  String get tooltipLightMode => 'Light mode';

  @override
  String get tooltipDarkMode => 'Dark mode';

  @override
  String get tooltipLanguage => 'Language';

  @override
  String get tooltipSwitchToEnglish => 'Switch to English';

  @override
  String get tooltipSwitchToArabic => 'Switch to Arabic';

  @override
  String get aboutTagline =>
      'Discover my journey, skills, and passion for technology';

  @override
  String get bioWhoIAm => 'Who I Am';

  @override
  String get bioIntro =>
      'As a dedicated Flutter Developer and Computer Science student at Nile University, I am passionate about crafting high-performance, cross-platform mobile applications using Dart and Flutter. With hands-on experience in building scalable apps like ChargeHub (EV station finder) and a carpooling platform, I excel in implementing robust state management with BLoC, integrating RESTful APIs, and leveraging Firebase for real-time backend services.';

  @override
  String get bioMobileDevTitle => 'Mobile App Development';

  @override
  String get bioMobileDevBody =>
      'My projects emphasize clean architecture, modern UI/UX design, and seamless user experiences across Android and iOS platforms.';

  @override
  String get bioTechTitle => 'Technical Interests';

  @override
  String get bioTechBody =>
      'Passionate about advancing in Natural Language Processing, Machine Learning, and Computer Vision, with a keen interest in leveraging these fields to drive innovative tech solutions.';

  @override
  String get bioSkillsTitle => 'Skills & Communication';

  @override
  String get bioSkillsBody =>
      'Proficient in developing feature-rich applications from music players to e-commerce marketplaces. I combine technical expertise with a focus on maintainable code and agile practices.';

  @override
  String get bioHighlightClosing =>
      'I am eager to contribute my Flutter skills to innovate user-centric mobile solutions that drive engagement and scalability.';

  @override
  String get bioClosingCta =>
      'Feel free to connect if you\'re interested in discussing technology, design, machine learning, or collaborative opportunities!';

  @override
  String get statProjectsCompleted => 'Projects Completed';

  @override
  String get statYearsExperience => 'Years Experience';

  @override
  String get statTechnologies => 'Technologies';

  @override
  String get statClientSatisfaction => 'Client Satisfaction';

  @override
  String get contactInfoHeading => 'Get In Touch';

  @override
  String get contactInfoEmailLabel => 'Email';

  @override
  String get contactInfoLocationLabel => 'Location';

  @override
  String get contactCardTitle => 'Contact Information';

  @override
  String get contactCardSubtitle => 'Get in touch with me';

  @override
  String get contactSocialHeading => 'Connect With Me';

  @override
  String get projectDialogDescriptionHeading => 'Description';

  @override
  String get projectDialogTechnologiesHeading => 'Technologies Used';

  @override
  String allProjectsDialogTitle(int count) {
    return 'All Projects ($count)';
  }

  @override
  String get certificateDetailsHeading => 'Certificate Details';

  @override
  String get certificateIssuedByLabel => 'Issued by';

  @override
  String get certificateIssueDateLabel => 'Issue Date';

  @override
  String get certificateDescriptionLabel => 'Description';

  @override
  String get certificateVerifiedTitle => 'Verified Certificate';

  @override
  String get certificateValidatedOnlineHint =>
      'This certificate can be validated online';

  @override
  String get certificateVerifiedShort => 'Verified';

  @override
  String get labelPdf => 'PDF';

  @override
  String get labelHtml => 'HTML';

  @override
  String get caseStudyBackTooltip => 'Back to projects';

  @override
  String get caseStudySectionsMenuTooltip => 'Sections menu';

  @override
  String get caseStudySectionsSheetTitle => 'Sections';

  @override
  String get caseStudyNavOverview => 'Overview';

  @override
  String get caseStudyNavTechStack => 'Tech stack';

  @override
  String get caseStudyNavDocuments => 'Documents';

  @override
  String get caseStudyNavGallery => 'Gallery';

  @override
  String get caseStudyNavChallenges => 'Challenges';

  @override
  String get caseStudyNavLearnings => 'Learnings';

  @override
  String get caseStudySectionProjectOverview => 'Project overview';

  @override
  String get caseStudySectionKeyFeatures => 'Key features';

  @override
  String get caseStudySectionTechnicalStack => 'Technical stack';

  @override
  String get caseStudySectionKeyLearnings => 'Key learnings';

  @override
  String get caseStudySectionChallengesSolutions => 'Challenges & solutions';

  @override
  String get caseStudySectionProjectDocuments => 'Project documents';

  @override
  String get caseStudyGalleryHeading => 'Screenshots & gallery';

  @override
  String galleryImageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count images',
      one: '1 image',
    );
    return '$_temp0';
  }

  @override
  String get diagramLabelUseCase => 'Use case diagram';

  @override
  String get diagramLabelClass => 'Class diagram';

  @override
  String get diagramLabelSequence => 'Sequence diagram';

  @override
  String get diagramLabelActivity => 'Activity diagram';

  @override
  String get diagramLabelState => 'State diagram';

  @override
  String get diagramLabelEr => 'ER diagram';

  @override
  String get diagramLabelBlock => 'Block diagram';

  @override
  String get diagramLabelFlowchart => 'Flowchart';

  @override
  String get diagramLabelGeneric => 'Diagram';

  @override
  String get caseStudyCtaTitle => 'Want to learn more?';

  @override
  String get caseStudyCtaSubtitle =>
      'Explore the full case study or check out the source code';

  @override
  String get caseStudyWatchDemoVideo => 'Watch Demo Video';

  @override
  String get caseStudyWatchShortVideo => 'Watch Short Video';

  @override
  String get caseStudyViewSourceCode => 'View Source Code';

  @override
  String get liveUrlGooglePlayShort => 'Google Play';

  @override
  String get liveUrlGooglePlay => 'View on Google Play';

  @override
  String get liveUrlDemoShort => 'Live Demo';

  @override
  String get liveUrlDemo => 'View Live Demo';

  @override
  String get projectCardFeatured => 'Featured';

  @override
  String get projectCardViewProject => 'View project';

  @override
  String get projectDialogViewCaseStudy => 'View Case Study';

  @override
  String get projectDialogViewCode => 'View Code';

  @override
  String get projectsSeeMorePrompt => 'Interested in seeing more?';

  @override
  String get projectsViewAll => 'View All Projects';

  @override
  String get projectsVisitGitHub => 'Visit GitHub';

  @override
  String get certificateViewPdf => 'View PDF';

  @override
  String get certificateVerify => 'Verify Certificate';

  @override
  String get resumeCardTitle => 'View My Resume';

  @override
  String get resumeCardSubtitle =>
      'Explore my professional journey, skills, and achievements.';

  @override
  String get resumeViewCv => 'View CV';

  @override
  String get heroViewProjects => 'View Projects';

  @override
  String projectsEmptyForFilter(String filterName) {
    return 'No projects found for \"$filterName\"';
  }

  @override
  String get showMore => 'Show More';

  @override
  String get imageNotFound => 'Image not found';

  @override
  String get certificateImageUnavailable => 'Certificate image';

  @override
  String get certificatePlaceholderShort => 'Certificate';

  @override
  String get contactFieldPhone => 'Phone';

  @override
  String get contactFieldPhoneHint => 'Your phone number';

  @override
  String get projectFilterFlutter => 'Flutter';

  @override
  String get projectFilterGetX => 'GetX';

  @override
  String get projectFilterBlocCubit => 'BLoC/Cubit';

  @override
  String get projectFilterEcommerce => 'E-commerce';

  @override
  String get projectFilterChatApps => 'Chat Apps';

  @override
  String get projectFilterEducation => 'Education';

  @override
  String get projectFilterFirebase => 'Firebase';

  @override
  String get projectFilterMapsGps => 'Maps & GPS';

  @override
  String get projectFilterAiMl => 'AI/ML';

  @override
  String get projectFilterCleanArchitecture => 'Clean Architecture';

  @override
  String get projectFilterEnterprise => 'Enterprise';

  @override
  String get galleryCatOnboardingAuth => 'Onboarding & Authentication';

  @override
  String get galleryCatEmployeeHomeTools => 'Employee Home & Tools';

  @override
  String get galleryCatVideoAnalysis => 'Video Analysis';

  @override
  String get galleryCatVoiceAnalysis => 'Voice Analysis';

  @override
  String get galleryCatTextAnalysis => 'Text Analysis';

  @override
  String get galleryCatSupportTickets => 'Support Tickets';

  @override
  String get galleryCatEmployeeProfile => 'Employee Profile';

  @override
  String get galleryCatAdminPanel => 'Admin Panel';

  @override
  String get galleryCatUserHomeShopping => 'User Home & Shopping';

  @override
  String get galleryCatCategoriesProducts => 'Categories & Products';

  @override
  String get galleryCatFavoritesOffers => 'Favorites & Offers';

  @override
  String get galleryCatChatNotifications => 'Chat & Notifications';

  @override
  String get galleryCatMerchantDashboard => 'Merchant Dashboard';

  @override
  String get galleryCatSplashOnboarding => 'Splash & Onboarding';

  @override
  String get galleryCatAuthenticationFlow => 'Authentication Flow';

  @override
  String get galleryCatLearningRoadmap => 'Learning Roadmap';

  @override
  String get galleryCatLessonsCourseContent => 'Lessons & Course Content';

  @override
  String get galleryCatInteractiveQuizzes => 'Interactive Quizzes';

  @override
  String get galleryCatSkillAssessment => 'Skill Assessment';

  @override
  String get galleryCatAnalyticsDashboard => 'Analytics Dashboard';

  @override
  String get galleryCatUserProfile => 'User Profile';

  @override
  String get galleryCatAiChatAssistant => 'AI Chat Assistant';

  @override
  String get galleryCatCommunityFeatures => 'Community Features';

  @override
  String get galleryCatDesktopExperience => 'Desktop Experience';

  @override
  String get galleryCatHomeDashboard => 'Home Dashboard';

  @override
  String get galleryCatMealsModule => 'Meals Module';

  @override
  String get galleryCatMoodTracking => 'Mood Tracking';

  @override
  String get galleryCatLocationMap => 'Location & Map';

  @override
  String get galleryCatFamilySocialWall => 'Family Social Wall';

  @override
  String get galleryCatProfileSettings => 'Profile & Settings';

  @override
  String get galleryCatOnboardingShort => 'Onboarding';

  @override
  String get galleryCatUserAuthentication => 'User Authentication';

  @override
  String get galleryCatDriverAuthentication => 'Driver Authentication';

  @override
  String get galleryCatRideBookingFlow => 'Ride Booking Flow';

  @override
  String get galleryCatTripManagement => 'Trip Management';

  @override
  String get galleryCatNavigationFeatures => 'Navigation & Features';

  @override
  String get galleryCatUmlDiagrams => 'UML Diagrams';

  @override
  String get galleryCatDatasetOverview => 'Dataset Overview';

  @override
  String get galleryCatModelTrainingValidation => 'Model Training & Validation';

  @override
  String get galleryCatResultsAnalysis => 'Results & Analysis';

  @override
  String get galleryCatSystemArchitecture => 'System Architecture';

  @override
  String get galleryCatDatasetTraining => 'Dataset & Training';

  @override
  String get galleryCatResults => 'Results';

  @override
  String get galleryCatApplicationScreenshots => 'Application Screenshots';

  @override
  String get galleryCatAppScreenshots => 'App screenshots';

  @override
  String get galleryCatSystemInterface => 'System Interface';

  @override
  String get galleryCatGallery => 'Gallery';

  @override
  String get projectUnderDevelopment => '🚧 Under Development';

  @override
  String get tooltipCertificateOpenDetails => 'Open certificate details';

  @override
  String get tooltipClose => 'Close';

  @override
  String get tooltipViewFullLogo => 'View full-size logo';

  @override
  String get tooltipOpenNavigationMenu => 'Open navigation menu';
}
