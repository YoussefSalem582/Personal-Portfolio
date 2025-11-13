/// App Images - Centralized image asset paths
///
/// This file contains all image asset paths used throughout the application.
/// Organized by category for easy access and maintenance.
///
/// Usage:
/// ```dart
/// import '../utils/assets/app_images.dart';
///
/// Image.asset(AppImages.profileImage)
/// Image.asset(AppImages.projects.emosense.appIcon)
/// ```
class AppImages {
  // Prevent instantiation
  AppImages._();

  // ==================== Base Paths ====================

  static const String _basePath = 'assets/images';

  // ==================== Profile & Logo ====================

  /// Portfolio logo
  static const String portfolioLogo = '$_basePath/portfolio_logo.jpg';

  /// Profile image
  static const String profileImage = '$_basePath/profile.jpg';

  // ==================== Project Images ====================

  /// Project images organized by project
  static const ProjectImages projects = ProjectImages._();

  // ==================== Certificate Images ====================

  /// Certificate images
  static const CertificateImages certificates = CertificateImages._();
}

// ==================== Project Images Class ====================

/// Project-specific images
class ProjectImages {
  const ProjectImages._();

  // Emosense App
  static const EmosenseImages emosense = EmosenseImages._();

  // Music Player App
  static const MusicAppImages musicApp = MusicAppImages._();

  // Chat App
  static const ChatAppImages chatApp = ChatAppImages._();

  // ChargeHub App
  static const ChargeHubImages chargeHub = ChargeHubImages._();

  // Gogesh App
  static const GogeshImages gogesh = GogeshImages._();

  // Quiz Hub App
  static const QuizHubImages quizHub = QuizHubImages._();

  // Quote Hub App
  static const QuoteHubImages quoteHub = QuoteHubImages._();

  // Sprints Shop App
  static const SprintsShopImages sprintsShop = SprintsShopImages._();

  // GoPooling Carpool App
  static const GoPoolingImages goPooling = GoPoolingImages._();

  // FamilyLink App
  static const FamilyLinkImages familyLink = FamilyLinkImages._();
}

// ==================== Emosense App Images ====================

class EmosenseImages {
  const EmosenseImages._();

  static const String _base = 'assets/images/projects/emosense_photos';

  /// App icon
  static const String appIcon = '$_base/app_icon.png';

  // Admin section images
  static const EmosenseAdminImages admin = EmosenseAdminImages._();

  // Employee section images
  static const EmosenseEmployeeImages employee = EmosenseEmployeeImages._();
}

class EmosenseAdminImages {
  const EmosenseAdminImages._();

  static const String _base = 'assets/images/projects/emosense_photos/admin';

  /// Admin home screen
  static const String homeScreen = '$_base/amin_home_screen.png';

  /// User management
  static const String userManagement = '$_base/user_managment_screen.png';

  /// System screens
  static const String system = '$_base/system_screen.png';
  static const String system2 = '$_base/system_screen._2.png';

  /// Support tickets
  static const String supportTickets = '$_base/support_tickets_screen.png';

  /// Profile screens
  static const String profile = '$_base/profile_screen.png';
  static const String profile2 = '$_base/profile_screen__2.png';
}

class EmosenseEmployeeImages {
  const EmosenseEmployeeImages._();

  static const String _base = 'assets/images/projects/emosense_photos/employee';

  /// Splash and Onboarding
  static const String splashScreen = '$_base/splash_screen.png';
  static const String onboarding1 = '$_base/onboarding_1.png';
  static const String onboarding2 = '$_base/onboarding_2.png';
  static const String onboarding3 = '$_base/onboarding_3.png';
  static const String onboarding4 = '$_base/onboarding_4.png';

  /// Authentication
  static const String signinAndLogin = '$_base/signin_and_login.png';
  static const String signinEmployee = '$_base/signin_employee.png';
  static const String login = '$_base/login.png';
  static const String login2 = '$_base/login_2.png';
  static const String signinAdmin = '$_base/signin_admin.png';
  static const String loginLoading = '$_base/login_loading.png';

  /// Home screens
  static const String homeScreen = '$_base/employee_home_screen.png';
  static const String toolsScreen = '$_base/tools_screen.png';

  /// Video analysis
  static const String videoAnalysis = '$_base/video_analysis_screen.png';
  static const String videoAnalysis2 = '$_base/video_analysis_screen_2.png';
  static const String videoAnalysis3 = '$_base/video_analysis_screen_3.png';
  static const String videoAnalysis4 = '$_base/video_analysis_screen_4.png';

  /// Voice analysis
  static const String voiceAnalysis = '$_base/voice_analysis_screen.png';
  static const String voiceAnalysis2 = '$_base/voice_analysis_screen_2.png';
  static const String voiceAnalysis3 = '$_base/voice_analysis_screen_3.png';

  /// Text analysis
  static const String textAnalysis = '$_base/text_analysis_screen.png';
  static const String textAnalysis2 = '$_base/text_analysis_screen_2.png';

  /// Tickets
  static const String tickets = '$_base/tickets_screen.png';
  static const String tickets2 = '$_base/tickets_screen_2.png';
  static const String tickets3 = '$_base/tickets_screen_3.png';

  /// Profile
  static const String profile = '$_base/profiel_screen.png';
  static const String profile2 = '$_base/profile_sceen_2.png';
  static const String profile3 = '$_base/profile_screen_3.png';
}

// ==================== Music App Images ====================

class MusicAppImages {
  const MusicAppImages._();

  static const String _base = 'assets/images/projects/music_app';

  /// App logo
  static const String appLogo = '$_base/music_app_logo.jpg';

  /// Home screens
  static const String homePage = '$_base/home_page.png';
  static const String homeScreen1 = '$_base/Home Screen 1.png';
  static const String homeScreen2 = '$_base/Home Screen 2.png';

  /// Music player screens
  static const String musicPlayerScreen = '$_base/Music player screen.png';
  static const String playerScreen = '$_base/palyer screen.png';

  /// Playlist screens
  static const String playlistScreen = '$_base/playlist screen.png';
  static const String playlist = '$_base/playlist.png';

  /// Liked songs screens
  static const String likedSongsPage = '$_base/liked songs page.png';
  static const String likedSongsScreen = '$_base/Liked Songs screen.png';
}

// ==================== Chat App Images ====================

class ChatAppImages {
  const ChatAppImages._();

  static const String _base = 'assets/images/projects/chat_app';

  /// App logo
  static const String appLogo = '$_base/app_logo.png';

  /// Chat screen
  static const String chat = '$_base/chat.png';

  /// Drawer
  static const String drawer = '$_base/drawer.png';

  /// Home page
  static const String homePage = '$_base/home_page.png';

  /// Light mode
  static const String lightmode = '$_base/lightmode.png';

  /// Login screen
  static const String login = '$_base/login.png';

  /// Register screen
  static const String register = '$_base/register.png';

  /// Settings page
  static const String settingsPage = '$_base/settings_page.png';
}

// ==================== ChargeHub App Images ====================

class ChargeHubImages {
  const ChargeHubImages._();

  static const String _base = 'assets/images/projects/chargehub';

  /// App logo
  static const String chargeHub = '$_base/chargeHub.png';

  /// Cars
  static const String cars = '$_base/cars.png';

  /// EV car screens
  static const String evCar = '$_base/EV car.png';
  static const String evCar1 = '$_base/ev car1.png';

  /// Gas car screens
  static const String gasCar = '$_base/gas car.png';
  static const String gasCar1 = '$_base/gas car 1.png';

  /// Home screen
  static const String homescreen = '$_base/homescreen.png';

  /// Login screen
  static const String login = '$_base/login.png';

  /// Map screen
  static const String map = '$_base/Map.png';

  /// Signup screen
  static const String signup = '$_base/signup.png';
}

// ==================== Gogesh App Images ====================

class GogeshImages {
  const GogeshImages._();

  static const String _base = 'assets/images/projects/gogesh';

  /// App logo
  static const String gogeshAppLogo = '$_base/gogesh_app_logo.png';

  /// Ads screen
  static const String adsScreen = '$_base/ads_screen.png';

  /// Main search
  static const String appMainSearch = '$_base/app_main_search.png';

  /// Category screens
  static const String categoryDetailScreen =
      '$_base/category_detail_screen.png';
  static const String categoryResultScreen =
      '$_base/category_result_screen.png';
  static const String categoryScreen = '$_base/category_screen.png';

  /// Chat screens
  static const String chatScreen = '$_base/chat_screen.png';
  static const String chatScreen2 = '$_base/chat_screen_2.png';

  /// Create account
  static const String createAccountScreen = '$_base/create_account_screen.png';

  /// CTA button screens
  static const String ctaButtonScreen = '$_base/cta_button_screen.png';
  static const String ctaButtonScreen2 = '$_base/cta_button_screen_2.png';
  static const String ctaButtonScreen3 = '$_base/cta_button_screen_3.png';

  /// Favorite screen
  static const String favoriteScreen = '$_base/favorite_screen.png';

  /// Filter screens
  static const String filter = '$_base/filter.png';
  static const String productFilter = '$_base/product filter.png';

  /// Login/Signup
  static const String loginOrSignup = '$_base/login_or_signup.png';

  /// Merchant screens
  static const String merchantHomeScreen = '$_base/merchant_home_screen.png';
  static const String merchantProductDetailScreen =
      '$_base/merchant_product_detail_screen.png';
  static const String merchantProfileScreen =
      '$_base/merchant_profile_screen.png';

  /// Notification screen
  static const String notificationScreen = '$_base/notification_screen.png';

  /// Offers screen
  static const String offersScreen = '$_base/offers_screen.png';

  /// Onboard screens
  static const String onboard1 = '$_base/onboard_1.png';
  static const String onboard2 = '$_base/onboard_2.png';
  static const String onboard3 = '$_base/onboard_3.png';

  /// Phone login screens
  static const String phoneLogin = '$_base/phone_login.png';
  static const String phoneLogin2 = '$_base/phone_login_2.png';

  /// Product screen
  static const String productScreen = '$_base/product_screen.png';

  /// Report screens
  static const String report = '$_base/report.png';
  static const String report2 = '$_base/report_2.png';

  /// Signup screens
  static const String signupScreen = '$_base/signup_screen.png';
  static const String signupScreen2 = '$_base/signup_screen_2.png';
  static const String signupScreen3 = '$_base/signup_screen_3.png';
  static const String signupScreen4 = '$_base/signup_screen_4.png';
  static const String signupScreen5 = '$_base/signup_screen_5.png';
  static const String signupScreen6 = '$_base/signup_screen_6.png';
  static const String signupScreen7 = '$_base/signup_screen_7.png';
  static const String signupScreen8 = '$_base/signup_screen_8.png';
  static const String signupScreen9 = '$_base/signup_screen_9.png';
  static const String signupScreen10 = '$_base/signup_screen_10.png';
  static const String signupScreen11 = '$_base/signup_screen_11.png';
  static const String signupScreen12 = '$_base/signup_screen_12.png';
  static const String signupScreen13 = '$_base/signup_screen_13.png';
  static const String signupScreen14 = '$_base/signup_screen_14.png';

  /// Splash screen
  static const String splash = '$_base/splash.png';

  /// User home screens
  static const String userHomeScreen = '$_base/user_home_screen.png';
  static const String userHomeScreen2 = '$_base/user_home_screen_2.png';
}

// ==================== Quiz Hub App Images ====================

class QuizHubImages {
  const QuizHubImages._();

  static const String _base = 'assets/images/projects/quiz_hub';

  /// App logo
  static const String quizAppLogo = '$_base/quiz_app_logo.jpg';

  /// Correct answer
  static const String correctAnswer = '$_base/correct_answer.png';

  /// Home screens
  static const String homeScreen = '$_base/home_screen.png';
  static const String homeScreen2 = '$_base/home_screen_2.png';

  /// Incorrect answer
  static const String incorrectAnswer = '$_base/incorrect_answer.png';

  /// Quiz
  static const String quiz = '$_base/quiz.png';

  /// Quiz completed
  static const String quiCompleted = '$_base/qui_completed.png';

  /// Review page
  static const String reviewPage = '$_base/review_page.png';
}

// ==================== Quote Hub App Images ====================

class QuoteHubImages {
  const QuoteHubImages._();

  static const String _base = 'assets/images/projects/QuoteHub';

  /// App logo
  static const String qoutehubAppLogo = '$_base/qoutehub_app_logo.jpg';

  /// Favorite page
  static const String favoritePage = '$_base/Favorite Page.png';

  /// Home screens
  static const String homeScreen = '$_base/Home Screen.png';
  static const String homeScreenWithQuotes =
      '$_base/Home Screen with Quotes.png';

  /// Select category
  static const String selectCategory = '$_base/Select Category.png';
}

// ==================== Sprints Shop App Images ====================

class SprintsShopImages {
  const SprintsShopImages._();

  static const String _base = 'assets/images/projects/sprints_shop';

  /// App logo
  static const String appLogo = '$_base/app_logo.png';

  /// Cart screen
  static const String cartScreen = '$_base/cart_screen.png';

  /// Home screen
  static const String homeScreen = '$_base/home_screen.png';

  /// Login screens
  static const String login = '$_base/login.png';
  static const String login2 = '$_base/login_2.png';
  static const String loginAndSignin = '$_base/login_and_signin.png';
  static const String loginAndSignUp2 = '$_base/login_and_sign_up_2.png';

  /// Product screens
  static const String productsScreen = '$_base/products_screen.png';
  static const String productDetailScreen = '$_base/product_detail_screen.png';

  /// Sign up screen
  static const String signUp = '$_base/sign_up.png';

  /// Order screens
  static const String orderScreen = '$_base/order_screen.png';
  static const String orderScreen2 = '$_base/order_screen_2.png';

  /// Payment screens
  static const String paymentScreen = '$_base/payment_screen.png';
  static const String paymentScreen2 = '$_base/payment_screen_2.png';
}

// ==================== GoPooling Carpool App Images ====================

class GoPoolingImages {
  const GoPoolingImages._();

  static const String _base = 'assets/images/projects/carpool_ride_sharing_app';

  /// App logo
  static const String appLogo = '$_base/app_logo.png';

  /// Diagrams
  static const String classDiagram = '$_base/class_diagram.png';
  static const String useCaseDiagram = '$_base/use_case_diagram.png';

  /// Onboarding
  static const String onboarding1 = '$_base/onboarding1.png';
  static const String onboarding2 = '$_base/onboarding2.png';
  static const String onboarding3 = '$_base/onboarding3.png';

  /// Authentication - User
  static const String userLogin = '$_base/user_login.png';
  static const String userSignup = '$_base/user_signup.png';

  /// Authentication - Driver
  static const String driverLogin = '$_base/driver_login.png';
  static const String driverSignup = '$_base/driver_signup.png';

  /// Home & Navigation
  static const String homeScreen = '$_base/home_screen.png';
  static const String pickupPlaceScreen = '$_base/pickup_place_screen.png';
  static const String selectYourRideScreen =
      '$_base/select_your_ride_screen.png';
  static const String selectedRideDetailScreen =
      '$_base/selected_ride_detail_screen.png';

  /// My Trips
  static const String myTripsScreen1 = '$_base/my_trips_screen_1.png';
  static const String myTripsScreen2 = '$_base/my_trips_screen_2.png';

  /// Other Screens
  static const String notificationScreen = '$_base/notification_screen.png';
  static const String sideDrawerNavigation =
      '$_base/side_drawer_navigation.png';
}

// ==================== FamilyLink App Images ====================

class FamilyLinkImages {
  const FamilyLinkImages._();

  static const String _base = 'assets/images/projects/family_link';

  /// App logo
  static const String appLogo = '$_base/app_logo.png';

  /// Splash & Onboarding
  static const String splashScreen = '$_base/splash_screen.png';
  static const String onboarding1 = '$_base/onboarding1.png';
  static const String onboarding2 = '$_base/onboarding2.png';
  static const String onboarding3 = '$_base/onboarding3.png';
  static const String onboarding4 = '$_base/onboarding4.png';
  static const String onboarding5 = '$_base/onboarding5.png';

  /// Authentication
  static const String loginOrSignupScreen = '$_base/login_or_signup_screen.png';
  static const String loginScreen = '$_base/login_screen.png';
  static const String signupScreen = '$_base/signup_screen.png';

  /// Home Dashboard
  static const String homeScreen = '$_base/home_screen.png';
  static const String homeScreen2 = '$_base/home_screen_2.png';
  static const String homeScreen3 = '$_base/home_screen_3.png';

  /// Meals Module
  static const String mealsScreen = '$_base/meals_screen.png';
  static const String mealsScreen2 = '$_base/meals_screen_2.png';
  static const String mealsScreen3 = '$_base/meals_screen_3.png';

  /// Mood Module
  static const String moodsScreen = '$_base/moods_screen.png';
  static const String moodsScreen2 = '$_base/moods_screen_2.png';
  static const String moodsScreen3 = '$_base/moods_screen_3.png';

  /// Map Module
  static const String mapScreen = '$_base/map_screen.png';
  static const String mapScreen2 = '$_base/map_screen_2.png';

  /// Social/Wall Module
  static const String socialScreen = '$_base/social_screen.png';
  static const String socialScreen2 = '$_base/social_screen_2.png';
  static const String socialScreen3 = '$_base/social_screen_3.png';
  static const String socialScreen4 = '$_base/social_screen_4.png';
  static const String socialScreen5 = '$_base/social_screen_5.png';

  /// Profile & Settings
  static const String profileScreen = '$_base/profile_screen.png';
  static const String profileScreen2 = '$_base/profile_screen_2.png';
  static const String profileScreen3 = '$_base/profile_screen_3.png';
}

// ==================== Pothole Detection Project Images ====================

class PotholeDetectionImages {
  const PotholeDetectionImages._();

  static const String _base =
      'assets/images/projects/pothole_detection_project';

  /// Analysis and Results
  static const String confusionMatrix = '$_base/confusion_matrix.png';
  static const String decisionTreeVisualization =
      '$_base/decision_tree_visualization.png';
  static const String imageCounts = '$_base/image_counts.png';
  static const String noPotholeImageDimensions =
      '$_base/no_pothole_image_dimensions.png';
  static const String potholeImageDimensions =
      '$_base/pothole_image_dimensions.png';
  static const String resultsAndAnalysis = '$_base/results_and_analysis.png';
  static const String samples = '$_base/samples.png';
  static const String trainingAndValidation =
      '$_base/training_and_validation.png';
}

// ==================== Sign Language Translator Images ====================

class SignLanguageTranslatorImages {
  const SignLanguageTranslatorImages._();

  static const String _base = 'assets/images/projects/sign_language_translator';

  // project logo
  static const String appLogo = '$_base/sign_language_translator_project.png';

  /// Project Diagrams and Results
  static const String blockDiagram = '$_base/block_diagram.png';
  static const String collectedSamples = '$_base/collected_samples.png';
  static const String creatingDatasets = '$_base/creatig_datasets.png';
  static const String flowchart = '$_base/flowchart.png';
  static const String results = '$_base/results.png';
}

// ==================== Three.js Interactive Learning Assistant Images ====================

class ThreeJsProjectImages {
  const ThreeJsProjectImages._();

  static const String _base = 'assets/images/projects/threejs_project';

  /// Screenshots
  static const String image1 = '$_base/image1.png';
  static const String image2 = '$_base/image2.png';
  static const String image3 = '$_base/image3.png';
}

// ==================== Facial Recognition System Images ====================

class FacialRecognitionImages {
  const FacialRecognitionImages._();

  static const String _base =
      'assets/images/projects/facial_recognition_system';

  /// System Screenshots
  static const String homepage = '$_base/homepage.jpg';
  static const String homepageExample = '$_base/homepage_ex.jpg';
}

// ==================== Certificate Images ====================

class CertificateImages {
  const CertificateImages._();

  static const String _basePhotos = 'assets/images/certificates';
  static const String _basePdfs = 'assets/images/certificates';

  // Certificate Photos
  static const String routeFlutterDiploma =
      '$_basePhotos/Route Flutter Diploma Certificate.png';
  static const String mlDepiCertificate =
      '$_basePhotos/ml_depi_certificate.png';
  static const String codeAlphaCertificate =
      '$_basePhotos/CodeAlpha Certificate.png';
  static const String uneeqInternCertificate =
      '$_basePhotos/uneeq_intern_certificate.png';
  static const String ecpcCertificate = '$_basePhotos/ECPC.jpg';
  static const String ugrfCertificate1 = '$_basePhotos/UGRF 1.jpg';
  static const String ugrfCertificate2 = '$_basePhotos/UGRF .jpg';
  static const String weCertificate = '$_basePhotos/we_certificate.png';

  // Certificate PDFs - Note: Actual PDFs should be in assets/documents/certificates/
  // These paths are kept for backward compatibility but should point to documents folder
  static const String routeFlutterDiplomaPdf =
      '$_basePdfs/route_flutter_diploma_certificate.pdf';
  static const String mlDepiCertificatePdf =
      '$_basePdfs/ml_depi_certificate.pdf';
  static const String codeAlphaCertificatePdf =
      '$_basePdfs/CodeAlpha_Certificate.pdf';
  static const String codeAlphaLorPdf = '$_basePdfs/CodeAlpha_LOR.pdf';
  static const String uneeqInternCertificatePdf =
      '$_basePdfs/uneeq_intern_certificate.pdf';
  static const String ecpcCertificatePdf = '$_basePdfs/ECPC.pdf';
  static const String introJupyterPdf = '$_basePdfs/Intro_to_jupyter.pdf';
  static const String introPythonPdf = '$_basePdfs/Intro_to_python.pdf';
  static const String weCertificatePdf = '$_basePdfs/we_certificate.pdf';
}

// ==================== Helper Methods ====================

extension ImagePathExtensions on String {
  /// Check if this is a valid asset path
  bool get isAssetPath => startsWith('assets/');

  /// Check if this is a network image
  bool get isNetworkImage => startsWith('http://') || startsWith('https://');

  /// Get asset name from path
  String get assetName => split('/').last;

  /// Get asset directory from path
  String get assetDirectory => substring(0, lastIndexOf('/'));
}
