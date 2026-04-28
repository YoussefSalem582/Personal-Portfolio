import '../../../../l10n/app_localizations.dart';

/// Localized UI label for a gallery section; [categoryId] matches map keys in [GallerySectionWidget].
String localizedGalleryCategoryLabel(
  AppLocalizations l10n,
  String categoryId,
) {
  switch (categoryId) {
    case 'Onboarding & Authentication':
      return l10n.galleryCatOnboardingAuth;
    case 'Employee Home & Tools':
      return l10n.galleryCatEmployeeHomeTools;
    case 'Video Analysis':
      return l10n.galleryCatVideoAnalysis;
    case 'Voice Analysis':
      return l10n.galleryCatVoiceAnalysis;
    case 'Text Analysis':
      return l10n.galleryCatTextAnalysis;
    case 'Support Tickets':
      return l10n.galleryCatSupportTickets;
    case 'Employee Profile':
      return l10n.galleryCatEmployeeProfile;
    case 'Admin Panel':
      return l10n.galleryCatAdminPanel;
    case 'User Home & Shopping':
      return l10n.galleryCatUserHomeShopping;
    case 'Categories & Products':
      return l10n.galleryCatCategoriesProducts;
    case 'Favorites & Offers':
      return l10n.galleryCatFavoritesOffers;
    case 'Chat & Notifications':
      return l10n.galleryCatChatNotifications;
    case 'Merchant Dashboard':
      return l10n.galleryCatMerchantDashboard;
    case 'Splash & Onboarding':
      return l10n.galleryCatSplashOnboarding;
    case 'Authentication Flow':
      return l10n.galleryCatAuthenticationFlow;
    case 'Learning Roadmap':
      return l10n.galleryCatLearningRoadmap;
    case 'Lessons & Course Content':
      return l10n.galleryCatLessonsCourseContent;
    case 'Interactive Quizzes':
      return l10n.galleryCatInteractiveQuizzes;
    case 'Skill Assessment':
      return l10n.galleryCatSkillAssessment;
    case 'Analytics Dashboard':
      return l10n.galleryCatAnalyticsDashboard;
    case 'User Profile':
      return l10n.galleryCatUserProfile;
    case 'AI Chat Assistant':
      return l10n.galleryCatAiChatAssistant;
    case 'Community Features':
      return l10n.galleryCatCommunityFeatures;
    case 'Desktop Experience':
      return l10n.galleryCatDesktopExperience;
    case 'Home Dashboard':
      return l10n.galleryCatHomeDashboard;
    case 'Meals Module':
      return l10n.galleryCatMealsModule;
    case 'Mood Tracking':
      return l10n.galleryCatMoodTracking;
    case 'Location & Map':
      return l10n.galleryCatLocationMap;
    case 'Family Social Wall':
      return l10n.galleryCatFamilySocialWall;
    case 'Profile & Settings':
      return l10n.galleryCatProfileSettings;
    case 'Onboarding':
      return l10n.galleryCatOnboardingShort;
    case 'User Authentication':
      return l10n.galleryCatUserAuthentication;
    case 'Driver Authentication':
      return l10n.galleryCatDriverAuthentication;
    case 'Ride Booking Flow':
      return l10n.galleryCatRideBookingFlow;
    case 'Trip Management':
      return l10n.galleryCatTripManagement;
    case 'Navigation & Features':
      return l10n.galleryCatNavigationFeatures;
    case 'UML Diagrams':
      return l10n.galleryCatUmlDiagrams;
    case 'Dataset Overview':
      return l10n.galleryCatDatasetOverview;
    case 'Model Training & Validation':
      return l10n.galleryCatModelTrainingValidation;
    case 'Results & Analysis':
      return l10n.galleryCatResultsAnalysis;
    case 'System Architecture':
      return l10n.galleryCatSystemArchitecture;
    case 'Dataset & Training':
      return l10n.galleryCatDatasetTraining;
    case 'Results':
      return l10n.galleryCatResults;
    case 'Application Screenshots':
      return l10n.galleryCatApplicationScreenshots;
    case 'App screenshots':
      return l10n.galleryCatAppScreenshots;
    case 'System Interface':
      return l10n.galleryCatSystemInterface;
    case 'Gallery':
      return l10n.galleryCatGallery;
    default:
      return categoryId;
  }
}
