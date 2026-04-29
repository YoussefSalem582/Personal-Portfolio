import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Youssef Salem - Portfolio'**
  String get appTitle;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navAbout.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get navAbout;

  /// No description provided for @navSkills.
  ///
  /// In en, this message translates to:
  /// **'Skills'**
  String get navSkills;

  /// No description provided for @navExpertise.
  ///
  /// In en, this message translates to:
  /// **'Expertise'**
  String get navExpertise;

  /// No description provided for @navProjects.
  ///
  /// In en, this message translates to:
  /// **'Projects'**
  String get navProjects;

  /// No description provided for @navCertificates.
  ///
  /// In en, this message translates to:
  /// **'Certificates'**
  String get navCertificates;

  /// No description provided for @navContact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get navContact;

  /// No description provided for @sectionAboutTitle.
  ///
  /// In en, this message translates to:
  /// **'About Me'**
  String get sectionAboutTitle;

  /// No description provided for @sectionProjectsTitle.
  ///
  /// In en, this message translates to:
  /// **'My Projects'**
  String get sectionProjectsTitle;

  /// No description provided for @sectionProjectsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Here are some of the projects I\'ve worked on'**
  String get sectionProjectsSubtitle;

  /// No description provided for @sectionSkillsTitle.
  ///
  /// In en, this message translates to:
  /// **'My Tech Stack'**
  String get sectionSkillsTitle;

  /// No description provided for @sectionSkillsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'A collection of technologies I am proficient in and enjoy working with'**
  String get sectionSkillsSubtitle;

  /// No description provided for @sectionCertificatesTitle.
  ///
  /// In en, this message translates to:
  /// **'Certificates & Achievements'**
  String get sectionCertificatesTitle;

  /// No description provided for @sectionCertificatesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Professional certifications showcasing continuous learning and expertise'**
  String get sectionCertificatesSubtitle;

  /// No description provided for @sectionExpertiseTitle.
  ///
  /// In en, this message translates to:
  /// **'My Expertise'**
  String get sectionExpertiseTitle;

  /// No description provided for @sectionExpertiseSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Combining cutting-edge technology with innovative solutions'**
  String get sectionExpertiseSubtitle;

  /// No description provided for @sectionContactTitle.
  ///
  /// In en, this message translates to:
  /// **'Get In Touch'**
  String get sectionContactTitle;

  /// No description provided for @sectionContactSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Let\'s discuss your next project or collaboration opportunity'**
  String get sectionContactSubtitle;

  /// No description provided for @heroGreeting.
  ///
  /// In en, this message translates to:
  /// **'Hello, I\'m'**
  String get heroGreeting;

  /// No description provided for @heroRoleFlutterDeveloper.
  ///
  /// In en, this message translates to:
  /// **'Flutter Developer'**
  String get heroRoleFlutterDeveloper;

  /// No description provided for @heroRoleMobileAppDeveloper.
  ///
  /// In en, this message translates to:
  /// **'Mobile App Developer'**
  String get heroRoleMobileAppDeveloper;

  /// No description provided for @heroRoleSoftwareEngineer.
  ///
  /// In en, this message translates to:
  /// **'Software Engineer'**
  String get heroRoleSoftwareEngineer;

  /// No description provided for @linksMenu.
  ///
  /// In en, this message translates to:
  /// **'Links'**
  String get linksMenu;

  /// No description provided for @linksGithubProfile.
  ///
  /// In en, this message translates to:
  /// **'GitHub Profile'**
  String get linksGithubProfile;

  /// No description provided for @linksLinkedIn.
  ///
  /// In en, this message translates to:
  /// **'LinkedIn Profile'**
  String get linksLinkedIn;

  /// No description provided for @linksYoutube.
  ///
  /// In en, this message translates to:
  /// **'YouTube Channel'**
  String get linksYoutube;

  /// No description provided for @linksResume.
  ///
  /// In en, this message translates to:
  /// **'Resume'**
  String get linksResume;

  /// No description provided for @resumeOpenError.
  ///
  /// In en, this message translates to:
  /// **'Error opening resume'**
  String get resumeOpenError;

  /// No description provided for @resumeOpening.
  ///
  /// In en, this message translates to:
  /// **'Opening resume...'**
  String get resumeOpening;

  /// No description provided for @resumeOpenErrorRetry.
  ///
  /// In en, this message translates to:
  /// **'Error opening resume. Please try again.'**
  String get resumeOpenErrorRetry;

  /// No description provided for @filterAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get filterAll;

  /// No description provided for @copyrightNotice.
  ///
  /// In en, this message translates to:
  /// **'© {year} {name}. All rights reserved.'**
  String copyrightNotice(int year, String name);

  /// No description provided for @footerBuiltWith.
  ///
  /// In en, this message translates to:
  /// **'Built with'**
  String get footerBuiltWith;

  /// No description provided for @footerUsingFlutter.
  ///
  /// In en, this message translates to:
  /// **'using Flutter'**
  String get footerUsingFlutter;

  /// No description provided for @footerTagline.
  ///
  /// In en, this message translates to:
  /// **'Creating beautiful and functional applications with Flutter. Passionate about clean code and exceptional user experiences.'**
  String get footerTagline;

  /// No description provided for @footerQuickLinks.
  ///
  /// In en, this message translates to:
  /// **'Quick Links'**
  String get footerQuickLinks;

  /// No description provided for @footerGetInTouch.
  ///
  /// In en, this message translates to:
  /// **'Get In Touch'**
  String get footerGetInTouch;

  /// No description provided for @footerFollowMe.
  ///
  /// In en, this message translates to:
  /// **'Follow Me'**
  String get footerFollowMe;

  /// No description provided for @footerViewResume.
  ///
  /// In en, this message translates to:
  /// **'View Resume'**
  String get footerViewResume;

  /// No description provided for @contactFormTitle.
  ///
  /// In en, this message translates to:
  /// **'Send Me a Message'**
  String get contactFormTitle;

  /// No description provided for @contactFormSubtitle.
  ///
  /// In en, this message translates to:
  /// **'I\'ll get back to you within 24 hours'**
  String get contactFormSubtitle;

  /// No description provided for @contactFieldName.
  ///
  /// In en, this message translates to:
  /// **'Your Name'**
  String get contactFieldName;

  /// No description provided for @contactFieldNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your full name'**
  String get contactFieldNameHint;

  /// No description provided for @contactValidationNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter your name'**
  String get contactValidationNameRequired;

  /// No description provided for @contactFieldEmail.
  ///
  /// In en, this message translates to:
  /// **'Your Email'**
  String get contactFieldEmail;

  /// No description provided for @contactFieldEmailHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your email address'**
  String get contactFieldEmailHint;

  /// No description provided for @contactValidationEmailRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email'**
  String get contactValidationEmailRequired;

  /// No description provided for @contactValidationEmailInvalid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get contactValidationEmailInvalid;

  /// No description provided for @contactFieldSubject.
  ///
  /// In en, this message translates to:
  /// **'Subject'**
  String get contactFieldSubject;

  /// No description provided for @contactFieldSubjectHint.
  ///
  /// In en, this message translates to:
  /// **'What is this about?'**
  String get contactFieldSubjectHint;

  /// No description provided for @contactValidationSubjectRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter a subject'**
  String get contactValidationSubjectRequired;

  /// No description provided for @contactFieldMessage.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get contactFieldMessage;

  /// No description provided for @contactFieldMessageHint.
  ///
  /// In en, this message translates to:
  /// **'Tell me about your project or inquiry...'**
  String get contactFieldMessageHint;

  /// No description provided for @contactValidationMessageRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter your message'**
  String get contactValidationMessageRequired;

  /// No description provided for @contactValidationMessageMinLength.
  ///
  /// In en, this message translates to:
  /// **'Message must be at least 10 characters'**
  String get contactValidationMessageMinLength;

  /// No description provided for @contactSendButton.
  ///
  /// In en, this message translates to:
  /// **'Send Message'**
  String get contactSendButton;

  /// No description provided for @contactSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'Message sent successfully! I\'ll get back to you soon.'**
  String get contactSuccessMessage;

  /// No description provided for @contactErrorGeneric.
  ///
  /// In en, this message translates to:
  /// **'Error sending message. '**
  String get contactErrorGeneric;

  /// No description provided for @contactErrorTimeout.
  ///
  /// In en, this message translates to:
  /// **'Request timeout. Please check your internet connection and try again.'**
  String get contactErrorTimeout;

  /// No description provided for @contactErrorAuth.
  ///
  /// In en, this message translates to:
  /// **'Email service authentication issue. Please contact me directly at {email}'**
  String contactErrorAuth(String email);

  /// No description provided for @contactError404.
  ///
  /// In en, this message translates to:
  /// **'Email service configuration not found. Please contact me directly at {email}'**
  String contactError404(String email);

  /// No description provided for @contactErrorInvalidForm.
  ///
  /// In en, this message translates to:
  /// **'Invalid form data. Please check your inputs and try again.'**
  String get contactErrorInvalidForm;

  /// No description provided for @contactErrorServer.
  ///
  /// In en, this message translates to:
  /// **'Email service is temporarily unavailable. Please try again later or contact me directly at {email}'**
  String contactErrorServer(String email);

  /// No description provided for @contactErrorCors.
  ///
  /// In en, this message translates to:
  /// **'Browser security issue. Please try again or contact me directly at {email}'**
  String contactErrorCors(String email);

  /// No description provided for @contactErrorNetworkGen.
  ///
  /// In en, this message translates to:
  /// **'Network connection issue. Please check your internet and try again.'**
  String get contactErrorNetworkGen;

  /// No description provided for @contactErrorTryDirect.
  ///
  /// In en, this message translates to:
  /// **'Please try again or contact me directly at {email}'**
  String contactErrorTryDirect(String email);

  /// No description provided for @contactErrorNotConfigured.
  ///
  /// In en, this message translates to:
  /// **'Formspree endpoint not configured. Please contact the administrator.'**
  String get contactErrorNotConfigured;

  /// No description provided for @contactErrorFormDisabledWithEmail.
  ///
  /// In en, this message translates to:
  /// **'Form is disabled or spam detected. Please contact me directly at {email}'**
  String contactErrorFormDisabledWithEmail(String email);

  /// No description provided for @contactErrorRateLimit.
  ///
  /// In en, this message translates to:
  /// **'Too many requests. Please wait a moment and try again.'**
  String get contactErrorRateLimit;

  /// No description provided for @contactErrorFailedWithCode.
  ///
  /// In en, this message translates to:
  /// **'Failed to send message (Error {code}). Please try again or contact me directly at {email}'**
  String contactErrorFailedWithCode(int code, String email);

  /// No description provided for @contactErrorCertificate.
  ///
  /// In en, this message translates to:
  /// **'Security certificate error. Please contact the administrator.'**
  String get contactErrorCertificate;

  /// No description provided for @contactErrorNetworkSimple.
  ///
  /// In en, this message translates to:
  /// **'Network error. Please check your internet connection and try again.'**
  String get contactErrorNetworkSimple;

  /// No description provided for @drawerTheme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get drawerTheme;

  /// No description provided for @tooltipLightMode.
  ///
  /// In en, this message translates to:
  /// **'Light mode'**
  String get tooltipLightMode;

  /// No description provided for @tooltipDarkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark mode'**
  String get tooltipDarkMode;

  /// No description provided for @tooltipLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get tooltipLanguage;

  /// No description provided for @tooltipSwitchToEnglish.
  ///
  /// In en, this message translates to:
  /// **'Switch to English'**
  String get tooltipSwitchToEnglish;

  /// No description provided for @tooltipSwitchToArabic.
  ///
  /// In en, this message translates to:
  /// **'Switch to Arabic'**
  String get tooltipSwitchToArabic;

  /// No description provided for @aboutTagline.
  ///
  /// In en, this message translates to:
  /// **'Discover my journey, skills, and passion for technology'**
  String get aboutTagline;

  /// No description provided for @bioWhoIAm.
  ///
  /// In en, this message translates to:
  /// **'Who I Am'**
  String get bioWhoIAm;

  /// No description provided for @bioIntro.
  ///
  /// In en, this message translates to:
  /// **'As a dedicated Flutter Developer and Computer Science student at Nile University, I am passionate about crafting high-performance, cross-platform mobile applications using Dart and Flutter. With hands-on experience in building scalable apps like ChargeHub (EV station finder) and a carpooling platform, I excel in implementing robust state management with BLoC, integrating RESTful APIs, and leveraging Firebase for real-time backend services.'**
  String get bioIntro;

  /// No description provided for @bioMobileDevTitle.
  ///
  /// In en, this message translates to:
  /// **'Mobile App Development'**
  String get bioMobileDevTitle;

  /// No description provided for @bioMobileDevBody.
  ///
  /// In en, this message translates to:
  /// **'My projects emphasize clean architecture, modern UI/UX design, and seamless user experiences across Android and iOS platforms.'**
  String get bioMobileDevBody;

  /// No description provided for @bioTechTitle.
  ///
  /// In en, this message translates to:
  /// **'Technical Interests'**
  String get bioTechTitle;

  /// No description provided for @bioTechBody.
  ///
  /// In en, this message translates to:
  /// **'Passionate about advancing in Natural Language Processing, Machine Learning, and Computer Vision, with a keen interest in leveraging these fields to drive innovative tech solutions.'**
  String get bioTechBody;

  /// No description provided for @bioSkillsTitle.
  ///
  /// In en, this message translates to:
  /// **'Skills & Communication'**
  String get bioSkillsTitle;

  /// No description provided for @bioSkillsBody.
  ///
  /// In en, this message translates to:
  /// **'Proficient in developing feature-rich applications from music players to e-commerce marketplaces. I combine technical expertise with a focus on maintainable code and agile practices.'**
  String get bioSkillsBody;

  /// No description provided for @bioHighlightClosing.
  ///
  /// In en, this message translates to:
  /// **'I am eager to contribute my Flutter skills to innovate user-centric mobile solutions that drive engagement and scalability.'**
  String get bioHighlightClosing;

  /// No description provided for @bioClosingCta.
  ///
  /// In en, this message translates to:
  /// **'Feel free to connect if you\'re interested in discussing technology, design, machine learning, or collaborative opportunities!'**
  String get bioClosingCta;

  /// No description provided for @statProjectsCompleted.
  ///
  /// In en, this message translates to:
  /// **'Projects Completed'**
  String get statProjectsCompleted;

  /// No description provided for @statYearsExperience.
  ///
  /// In en, this message translates to:
  /// **'Years Experience'**
  String get statYearsExperience;

  /// No description provided for @statTechnologies.
  ///
  /// In en, this message translates to:
  /// **'Technologies'**
  String get statTechnologies;

  /// No description provided for @statClientSatisfaction.
  ///
  /// In en, this message translates to:
  /// **'Client Satisfaction'**
  String get statClientSatisfaction;

  /// No description provided for @contactInfoHeading.
  ///
  /// In en, this message translates to:
  /// **'Get In Touch'**
  String get contactInfoHeading;

  /// No description provided for @contactInfoEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get contactInfoEmailLabel;

  /// No description provided for @contactInfoLocationLabel.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get contactInfoLocationLabel;

  /// No description provided for @contactCardTitle.
  ///
  /// In en, this message translates to:
  /// **'Contact Information'**
  String get contactCardTitle;

  /// No description provided for @contactCardSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Get in touch with me'**
  String get contactCardSubtitle;

  /// No description provided for @contactSocialHeading.
  ///
  /// In en, this message translates to:
  /// **'Connect With Me'**
  String get contactSocialHeading;

  /// No description provided for @projectDialogDescriptionHeading.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get projectDialogDescriptionHeading;

  /// No description provided for @projectDialogTechnologiesHeading.
  ///
  /// In en, this message translates to:
  /// **'Technologies Used'**
  String get projectDialogTechnologiesHeading;

  /// No description provided for @allProjectsDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'All Projects ({count})'**
  String allProjectsDialogTitle(int count);

  /// No description provided for @certificateDetailsHeading.
  ///
  /// In en, this message translates to:
  /// **'Certificate Details'**
  String get certificateDetailsHeading;

  /// No description provided for @certificateIssuedByLabel.
  ///
  /// In en, this message translates to:
  /// **'Issued by'**
  String get certificateIssuedByLabel;

  /// No description provided for @certificateIssueDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Issue Date'**
  String get certificateIssueDateLabel;

  /// No description provided for @certificateDescriptionLabel.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get certificateDescriptionLabel;

  /// No description provided for @certificateVerifiedTitle.
  ///
  /// In en, this message translates to:
  /// **'Verified Certificate'**
  String get certificateVerifiedTitle;

  /// No description provided for @certificateValidatedOnlineHint.
  ///
  /// In en, this message translates to:
  /// **'This certificate can be validated online'**
  String get certificateValidatedOnlineHint;

  /// No description provided for @certificateVerifiedShort.
  ///
  /// In en, this message translates to:
  /// **'Verified'**
  String get certificateVerifiedShort;

  /// No description provided for @labelPdf.
  ///
  /// In en, this message translates to:
  /// **'PDF'**
  String get labelPdf;

  /// No description provided for @labelHtml.
  ///
  /// In en, this message translates to:
  /// **'HTML'**
  String get labelHtml;

  /// No description provided for @caseStudyBackTooltip.
  ///
  /// In en, this message translates to:
  /// **'Back to projects'**
  String get caseStudyBackTooltip;

  /// No description provided for @caseStudySectionsMenuTooltip.
  ///
  /// In en, this message translates to:
  /// **'Sections menu'**
  String get caseStudySectionsMenuTooltip;

  /// No description provided for @caseStudySectionsSheetTitle.
  ///
  /// In en, this message translates to:
  /// **'Sections'**
  String get caseStudySectionsSheetTitle;

  /// No description provided for @caseStudyNavOverview.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get caseStudyNavOverview;

  /// No description provided for @caseStudyNavTechStack.
  ///
  /// In en, this message translates to:
  /// **'Tech stack'**
  String get caseStudyNavTechStack;

  /// No description provided for @caseStudyNavDocuments.
  ///
  /// In en, this message translates to:
  /// **'Documents'**
  String get caseStudyNavDocuments;

  /// No description provided for @caseStudyNavGallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get caseStudyNavGallery;

  /// No description provided for @caseStudyNavChallenges.
  ///
  /// In en, this message translates to:
  /// **'Challenges'**
  String get caseStudyNavChallenges;

  /// No description provided for @caseStudyNavLearnings.
  ///
  /// In en, this message translates to:
  /// **'Learnings'**
  String get caseStudyNavLearnings;

  /// No description provided for @caseStudySectionProjectOverview.
  ///
  /// In en, this message translates to:
  /// **'Project overview'**
  String get caseStudySectionProjectOverview;

  /// No description provided for @caseStudySectionKeyFeatures.
  ///
  /// In en, this message translates to:
  /// **'Key features'**
  String get caseStudySectionKeyFeatures;

  /// No description provided for @caseStudySectionTechnicalStack.
  ///
  /// In en, this message translates to:
  /// **'Technical stack'**
  String get caseStudySectionTechnicalStack;

  /// No description provided for @caseStudySectionKeyLearnings.
  ///
  /// In en, this message translates to:
  /// **'Key learnings'**
  String get caseStudySectionKeyLearnings;

  /// No description provided for @caseStudySectionChallengesSolutions.
  ///
  /// In en, this message translates to:
  /// **'Challenges & solutions'**
  String get caseStudySectionChallengesSolutions;

  /// No description provided for @caseStudySectionProjectDocuments.
  ///
  /// In en, this message translates to:
  /// **'Project documents'**
  String get caseStudySectionProjectDocuments;

  /// No description provided for @caseStudyGalleryHeading.
  ///
  /// In en, this message translates to:
  /// **'Screenshots & gallery'**
  String get caseStudyGalleryHeading;

  /// No description provided for @galleryImageCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{1 image} other{{count} images}}'**
  String galleryImageCount(int count);

  /// No description provided for @diagramLabelUseCase.
  ///
  /// In en, this message translates to:
  /// **'Use case diagram'**
  String get diagramLabelUseCase;

  /// No description provided for @diagramLabelClass.
  ///
  /// In en, this message translates to:
  /// **'Class diagram'**
  String get diagramLabelClass;

  /// No description provided for @diagramLabelSequence.
  ///
  /// In en, this message translates to:
  /// **'Sequence diagram'**
  String get diagramLabelSequence;

  /// No description provided for @diagramLabelActivity.
  ///
  /// In en, this message translates to:
  /// **'Activity diagram'**
  String get diagramLabelActivity;

  /// No description provided for @diagramLabelState.
  ///
  /// In en, this message translates to:
  /// **'State diagram'**
  String get diagramLabelState;

  /// No description provided for @diagramLabelEr.
  ///
  /// In en, this message translates to:
  /// **'ER diagram'**
  String get diagramLabelEr;

  /// No description provided for @diagramLabelBlock.
  ///
  /// In en, this message translates to:
  /// **'Block diagram'**
  String get diagramLabelBlock;

  /// No description provided for @diagramLabelFlowchart.
  ///
  /// In en, this message translates to:
  /// **'Flowchart'**
  String get diagramLabelFlowchart;

  /// No description provided for @diagramLabelGeneric.
  ///
  /// In en, this message translates to:
  /// **'Diagram'**
  String get diagramLabelGeneric;

  /// No description provided for @caseStudyCtaTitle.
  ///
  /// In en, this message translates to:
  /// **'Want to learn more?'**
  String get caseStudyCtaTitle;

  /// No description provided for @caseStudyCtaSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Explore the full case study or check out the source code'**
  String get caseStudyCtaSubtitle;

  /// No description provided for @caseStudyWatchDemoVideo.
  ///
  /// In en, this message translates to:
  /// **'Watch Demo Video'**
  String get caseStudyWatchDemoVideo;

  /// No description provided for @caseStudyWatchShortVideo.
  ///
  /// In en, this message translates to:
  /// **'Watch Short Video'**
  String get caseStudyWatchShortVideo;

  /// No description provided for @caseStudyViewSourceCode.
  ///
  /// In en, this message translates to:
  /// **'View Source Code'**
  String get caseStudyViewSourceCode;

  /// No description provided for @liveUrlGooglePlayShort.
  ///
  /// In en, this message translates to:
  /// **'Google Play'**
  String get liveUrlGooglePlayShort;

  /// No description provided for @liveUrlGooglePlay.
  ///
  /// In en, this message translates to:
  /// **'View on Google Play'**
  String get liveUrlGooglePlay;

  /// No description provided for @liveUrlDemoShort.
  ///
  /// In en, this message translates to:
  /// **'Live Demo'**
  String get liveUrlDemoShort;

  /// No description provided for @liveUrlDemo.
  ///
  /// In en, this message translates to:
  /// **'View Live Demo'**
  String get liveUrlDemo;

  /// No description provided for @projectCardFeatured.
  ///
  /// In en, this message translates to:
  /// **'Featured'**
  String get projectCardFeatured;

  /// No description provided for @projectCardViewProject.
  ///
  /// In en, this message translates to:
  /// **'View project'**
  String get projectCardViewProject;

  /// No description provided for @projectDialogViewCaseStudy.
  ///
  /// In en, this message translates to:
  /// **'View Case Study'**
  String get projectDialogViewCaseStudy;

  /// No description provided for @projectDialogViewCode.
  ///
  /// In en, this message translates to:
  /// **'View Code'**
  String get projectDialogViewCode;

  /// No description provided for @projectsSeeMorePrompt.
  ///
  /// In en, this message translates to:
  /// **'Interested in seeing more?'**
  String get projectsSeeMorePrompt;

  /// No description provided for @projectsViewAll.
  ///
  /// In en, this message translates to:
  /// **'View All Projects'**
  String get projectsViewAll;

  /// No description provided for @projectsVisitGitHub.
  ///
  /// In en, this message translates to:
  /// **'Visit GitHub'**
  String get projectsVisitGitHub;

  /// No description provided for @certificateViewPdf.
  ///
  /// In en, this message translates to:
  /// **'View PDF'**
  String get certificateViewPdf;

  /// No description provided for @certificateVerify.
  ///
  /// In en, this message translates to:
  /// **'Verify Certificate'**
  String get certificateVerify;

  /// No description provided for @resumeCardTitle.
  ///
  /// In en, this message translates to:
  /// **'View My Resume'**
  String get resumeCardTitle;

  /// No description provided for @resumeCardSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Explore my professional journey, skills, and achievements.'**
  String get resumeCardSubtitle;

  /// No description provided for @resumeViewCv.
  ///
  /// In en, this message translates to:
  /// **'View CV'**
  String get resumeViewCv;

  /// No description provided for @heroViewProjects.
  ///
  /// In en, this message translates to:
  /// **'View Projects'**
  String get heroViewProjects;

  /// No description provided for @projectsEmptyForFilter.
  ///
  /// In en, this message translates to:
  /// **'No projects found for \"{filterName}\"'**
  String projectsEmptyForFilter(String filterName);

  /// No description provided for @showMore.
  ///
  /// In en, this message translates to:
  /// **'Show More'**
  String get showMore;

  /// No description provided for @imageNotFound.
  ///
  /// In en, this message translates to:
  /// **'Image not found'**
  String get imageNotFound;

  /// No description provided for @certificateImageUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Certificate image'**
  String get certificateImageUnavailable;

  /// No description provided for @certificatePlaceholderShort.
  ///
  /// In en, this message translates to:
  /// **'Certificate'**
  String get certificatePlaceholderShort;

  /// No description provided for @contactFieldPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get contactFieldPhone;

  /// No description provided for @contactFieldPhoneHint.
  ///
  /// In en, this message translates to:
  /// **'Your phone number'**
  String get contactFieldPhoneHint;

  /// No description provided for @projectFilterFlutter.
  ///
  /// In en, this message translates to:
  /// **'Flutter'**
  String get projectFilterFlutter;

  /// No description provided for @projectFilterGetX.
  ///
  /// In en, this message translates to:
  /// **'GetX'**
  String get projectFilterGetX;

  /// No description provided for @projectFilterBlocCubit.
  ///
  /// In en, this message translates to:
  /// **'BLoC/Cubit'**
  String get projectFilterBlocCubit;

  /// No description provided for @projectFilterEcommerce.
  ///
  /// In en, this message translates to:
  /// **'E-commerce'**
  String get projectFilterEcommerce;

  /// No description provided for @projectFilterChatApps.
  ///
  /// In en, this message translates to:
  /// **'Chat Apps'**
  String get projectFilterChatApps;

  /// No description provided for @projectFilterEducation.
  ///
  /// In en, this message translates to:
  /// **'Education'**
  String get projectFilterEducation;

  /// No description provided for @projectFilterFirebase.
  ///
  /// In en, this message translates to:
  /// **'Firebase'**
  String get projectFilterFirebase;

  /// No description provided for @projectFilterMapsGps.
  ///
  /// In en, this message translates to:
  /// **'Maps & GPS'**
  String get projectFilterMapsGps;

  /// No description provided for @projectFilterAiMl.
  ///
  /// In en, this message translates to:
  /// **'AI/ML'**
  String get projectFilterAiMl;

  /// No description provided for @projectFilterCleanArchitecture.
  ///
  /// In en, this message translates to:
  /// **'Clean Architecture'**
  String get projectFilterCleanArchitecture;

  /// No description provided for @projectFilterEnterprise.
  ///
  /// In en, this message translates to:
  /// **'Enterprise'**
  String get projectFilterEnterprise;

  /// No description provided for @galleryCatOnboardingAuth.
  ///
  /// In en, this message translates to:
  /// **'Onboarding & Authentication'**
  String get galleryCatOnboardingAuth;

  /// No description provided for @galleryCatEmployeeHomeTools.
  ///
  /// In en, this message translates to:
  /// **'Employee Home & Tools'**
  String get galleryCatEmployeeHomeTools;

  /// No description provided for @galleryCatVideoAnalysis.
  ///
  /// In en, this message translates to:
  /// **'Video Analysis'**
  String get galleryCatVideoAnalysis;

  /// No description provided for @galleryCatVoiceAnalysis.
  ///
  /// In en, this message translates to:
  /// **'Voice Analysis'**
  String get galleryCatVoiceAnalysis;

  /// No description provided for @galleryCatTextAnalysis.
  ///
  /// In en, this message translates to:
  /// **'Text Analysis'**
  String get galleryCatTextAnalysis;

  /// No description provided for @galleryCatSupportTickets.
  ///
  /// In en, this message translates to:
  /// **'Support Tickets'**
  String get galleryCatSupportTickets;

  /// No description provided for @galleryCatEmployeeProfile.
  ///
  /// In en, this message translates to:
  /// **'Employee Profile'**
  String get galleryCatEmployeeProfile;

  /// No description provided for @galleryCatAdminPanel.
  ///
  /// In en, this message translates to:
  /// **'Admin Panel'**
  String get galleryCatAdminPanel;

  /// No description provided for @galleryCatUserHomeShopping.
  ///
  /// In en, this message translates to:
  /// **'User Home & Shopping'**
  String get galleryCatUserHomeShopping;

  /// No description provided for @galleryCatCategoriesProducts.
  ///
  /// In en, this message translates to:
  /// **'Categories & Products'**
  String get galleryCatCategoriesProducts;

  /// No description provided for @galleryCatFavoritesOffers.
  ///
  /// In en, this message translates to:
  /// **'Favorites & Offers'**
  String get galleryCatFavoritesOffers;

  /// No description provided for @galleryCatChatNotifications.
  ///
  /// In en, this message translates to:
  /// **'Chat & Notifications'**
  String get galleryCatChatNotifications;

  /// No description provided for @galleryCatMerchantDashboard.
  ///
  /// In en, this message translates to:
  /// **'Merchant Dashboard'**
  String get galleryCatMerchantDashboard;

  /// No description provided for @galleryCatSplashOnboarding.
  ///
  /// In en, this message translates to:
  /// **'Splash & Onboarding'**
  String get galleryCatSplashOnboarding;

  /// No description provided for @galleryCatAuthenticationFlow.
  ///
  /// In en, this message translates to:
  /// **'Authentication Flow'**
  String get galleryCatAuthenticationFlow;

  /// No description provided for @galleryCatLearningRoadmap.
  ///
  /// In en, this message translates to:
  /// **'Learning Roadmap'**
  String get galleryCatLearningRoadmap;

  /// No description provided for @galleryCatLessonsCourseContent.
  ///
  /// In en, this message translates to:
  /// **'Lessons & Course Content'**
  String get galleryCatLessonsCourseContent;

  /// No description provided for @galleryCatInteractiveQuizzes.
  ///
  /// In en, this message translates to:
  /// **'Interactive Quizzes'**
  String get galleryCatInteractiveQuizzes;

  /// No description provided for @galleryCatSkillAssessment.
  ///
  /// In en, this message translates to:
  /// **'Skill Assessment'**
  String get galleryCatSkillAssessment;

  /// No description provided for @galleryCatAnalyticsDashboard.
  ///
  /// In en, this message translates to:
  /// **'Analytics Dashboard'**
  String get galleryCatAnalyticsDashboard;

  /// No description provided for @galleryCatUserProfile.
  ///
  /// In en, this message translates to:
  /// **'User Profile'**
  String get galleryCatUserProfile;

  /// No description provided for @galleryCatAiChatAssistant.
  ///
  /// In en, this message translates to:
  /// **'AI Chat Assistant'**
  String get galleryCatAiChatAssistant;

  /// No description provided for @galleryCatCommunityFeatures.
  ///
  /// In en, this message translates to:
  /// **'Community Features'**
  String get galleryCatCommunityFeatures;

  /// No description provided for @galleryCatDesktopExperience.
  ///
  /// In en, this message translates to:
  /// **'Desktop Experience'**
  String get galleryCatDesktopExperience;

  /// No description provided for @galleryCatHomeDashboard.
  ///
  /// In en, this message translates to:
  /// **'Home Dashboard'**
  String get galleryCatHomeDashboard;

  /// No description provided for @galleryCatMealsModule.
  ///
  /// In en, this message translates to:
  /// **'Meals Module'**
  String get galleryCatMealsModule;

  /// No description provided for @galleryCatMoodTracking.
  ///
  /// In en, this message translates to:
  /// **'Mood Tracking'**
  String get galleryCatMoodTracking;

  /// No description provided for @galleryCatLocationMap.
  ///
  /// In en, this message translates to:
  /// **'Location & Map'**
  String get galleryCatLocationMap;

  /// No description provided for @galleryCatFamilySocialWall.
  ///
  /// In en, this message translates to:
  /// **'Family Social Wall'**
  String get galleryCatFamilySocialWall;

  /// No description provided for @galleryCatProfileSettings.
  ///
  /// In en, this message translates to:
  /// **'Profile & Settings'**
  String get galleryCatProfileSettings;

  /// No description provided for @galleryCatOnboardingShort.
  ///
  /// In en, this message translates to:
  /// **'Onboarding'**
  String get galleryCatOnboardingShort;

  /// No description provided for @galleryCatUserAuthentication.
  ///
  /// In en, this message translates to:
  /// **'User Authentication'**
  String get galleryCatUserAuthentication;

  /// No description provided for @galleryCatDriverAuthentication.
  ///
  /// In en, this message translates to:
  /// **'Driver Authentication'**
  String get galleryCatDriverAuthentication;

  /// No description provided for @galleryCatRideBookingFlow.
  ///
  /// In en, this message translates to:
  /// **'Ride Booking Flow'**
  String get galleryCatRideBookingFlow;

  /// No description provided for @galleryCatTripManagement.
  ///
  /// In en, this message translates to:
  /// **'Trip Management'**
  String get galleryCatTripManagement;

  /// No description provided for @galleryCatNavigationFeatures.
  ///
  /// In en, this message translates to:
  /// **'Navigation & Features'**
  String get galleryCatNavigationFeatures;

  /// No description provided for @galleryCatUmlDiagrams.
  ///
  /// In en, this message translates to:
  /// **'UML Diagrams'**
  String get galleryCatUmlDiagrams;

  /// No description provided for @galleryCatDatasetOverview.
  ///
  /// In en, this message translates to:
  /// **'Dataset Overview'**
  String get galleryCatDatasetOverview;

  /// No description provided for @galleryCatModelTrainingValidation.
  ///
  /// In en, this message translates to:
  /// **'Model Training & Validation'**
  String get galleryCatModelTrainingValidation;

  /// No description provided for @galleryCatResultsAnalysis.
  ///
  /// In en, this message translates to:
  /// **'Results & Analysis'**
  String get galleryCatResultsAnalysis;

  /// No description provided for @galleryCatSystemArchitecture.
  ///
  /// In en, this message translates to:
  /// **'System Architecture'**
  String get galleryCatSystemArchitecture;

  /// No description provided for @galleryCatDatasetTraining.
  ///
  /// In en, this message translates to:
  /// **'Dataset & Training'**
  String get galleryCatDatasetTraining;

  /// No description provided for @galleryCatResults.
  ///
  /// In en, this message translates to:
  /// **'Results'**
  String get galleryCatResults;

  /// No description provided for @galleryCatApplicationScreenshots.
  ///
  /// In en, this message translates to:
  /// **'Application Screenshots'**
  String get galleryCatApplicationScreenshots;

  /// No description provided for @galleryCatAppScreenshots.
  ///
  /// In en, this message translates to:
  /// **'App screenshots'**
  String get galleryCatAppScreenshots;

  /// No description provided for @galleryCatSystemInterface.
  ///
  /// In en, this message translates to:
  /// **'System Interface'**
  String get galleryCatSystemInterface;

  /// No description provided for @galleryCatGallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get galleryCatGallery;

  /// No description provided for @projectUnderDevelopment.
  ///
  /// In en, this message translates to:
  /// **'🚧 Under Development'**
  String get projectUnderDevelopment;

  /// No description provided for @tooltipCertificateOpenDetails.
  ///
  /// In en, this message translates to:
  /// **'Open certificate details'**
  String get tooltipCertificateOpenDetails;

  /// No description provided for @tooltipClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get tooltipClose;

  /// No description provided for @tooltipViewFullLogo.
  ///
  /// In en, this message translates to:
  /// **'View full-size logo'**
  String get tooltipViewFullLogo;

  /// No description provided for @tooltipOpenNavigationMenu.
  ///
  /// In en, this message translates to:
  /// **'Open navigation menu'**
  String get tooltipOpenNavigationMenu;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
