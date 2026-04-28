import '../../../l10n/app_localizations.dart';

/// Display label for a project filter [id] (logic uses English ids from [ProjectsSection]).
String localizedProjectFilterLabel(AppLocalizations l10n, String id) {
  switch (id) {
    case 'All':
      return l10n.filterAll;
    case 'Flutter':
      return l10n.projectFilterFlutter;
    case 'GetX':
      return l10n.projectFilterGetX;
    case 'BLoC/Cubit':
      return l10n.projectFilterBlocCubit;
    case 'E-commerce':
      return l10n.projectFilterEcommerce;
    case 'Chat Apps':
      return l10n.projectFilterChatApps;
    case 'Education':
      return l10n.projectFilterEducation;
    case 'Firebase':
      return l10n.projectFilterFirebase;
    case 'Maps & GPS':
      return l10n.projectFilterMapsGps;
    case 'AI/ML':
      return l10n.projectFilterAiMl;
    case 'Clean Architecture':
      return l10n.projectFilterCleanArchitecture;
    case 'Enterprise':
      return l10n.projectFilterEnterprise;
    default:
      return id;
  }
}
