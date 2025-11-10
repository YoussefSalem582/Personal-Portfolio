import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'assets/app_constants.dart';

/// GetX Helper Utilities
/// Provides convenient methods for common GetX operations
class GetXHelper {
  /// Show a success snackbar
  static void showSuccess(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Get.theme.colorScheme.primary,
      colorText: Get.theme.colorScheme.onPrimary,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(16),
      borderRadius: 8,
    );
  }

  /// Show an error snackbar
  static void showError(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Get.theme.colorScheme.error,
      colorText: Get.theme.colorScheme.onError,
      duration: const Duration(seconds: 4),
      margin: const EdgeInsets.all(16),
      borderRadius: 8,
    );
  }

  /// Show an info snackbar
  static void showInfo(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Get.theme.colorScheme.secondary,
      colorText: Get.theme.colorScheme.onSecondary,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(16),
      borderRadius: 8,
    );
  }

  /// Show a warning snackbar
  static void showWarning(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Get.theme.colorScheme.tertiary,
      colorText: Get.theme.colorScheme.onTertiary,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(16),
      borderRadius: 8,
    );
  }

  /// Show a loading dialog
  static void showLoading([String? message]) {
    Get.dialog(
      PopScope(
        canPop: false,
        child: Center(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Shimmer.fromColors(
                baseColor: AppColors.surfaceDark.withValues(alpha: 0.3),
                highlightColor: AppColors.accentDark.withValues(alpha: 0.1),
                period: const Duration(milliseconds: 1500),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                    if (message != null) ...[
                      const SizedBox(height: 16),
                      Text(message, style: AppFonts.bodySmall()),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  /// Hide loading dialog
  static void hideLoading() {
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
  }

  /// Show a confirmation dialog
  static Future<bool> showConfirmDialog({
    required String title,
    required String message,
    String confirmText = 'Confirm',
    String cancelText = 'Cancel',
  }) async {
    final result = await Get.dialog<bool>(
      AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Get.back(result: false),
            child: Text(cancelText),
          ),
          ElevatedButton(
            onPressed: () => Get.back(result: true),
            child: Text(confirmText),
          ),
        ],
      ),
    );
    return result ?? false;
  }

  /// Show a bottom sheet
  static Future<T?> showBottomSheet<T>(Widget child) {
    return Get.bottomSheet<T>(
      child,
      backgroundColor: Get.theme.scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
    );
  }

  /// Navigate to a page
  static Future<T?>? to<T>(Widget page) {
    return Get.to<T>(() => page);
  }

  /// Navigate to a named route
  static Future<T?>? toNamed<T>(String route, {dynamic arguments}) {
    return Get.toNamed<T>(route, arguments: arguments);
  }

  /// Replace current page
  static Future<T?>? off<T>(Widget page) {
    return Get.off<T>(() => page);
  }

  /// Replace all pages
  static Future<T?>? offAll<T>(Widget page) {
    return Get.offAll<T>(() => page);
  }

  /// Go back
  static void back<T>({T? result}) {
    Get.back<T>(result: result);
  }

  /// Close all dialogs
  static void closeAllDialogs() {
    while (Get.isDialogOpen ?? false) {
      Get.back();
    }
  }

  /// Close all bottom sheets
  static void closeAllBottomSheets() {
    while (Get.isBottomSheetOpen ?? false) {
      Get.back();
    }
  }

  /// Check if dark mode is enabled
  static bool get isDarkMode => Get.isDarkMode;

  /// Change theme mode
  static void changeTheme(ThemeMode mode) {
    Get.changeThemeMode(mode);
  }

  /// Get screen width
  static double get width => Get.width;

  /// Get screen height
  static double get height => Get.height;

  /// Get screen context
  static dynamic get context => Get.context;

  /// Check if bottom sheet is open
  static bool get isBottomSheetOpen => Get.isBottomSheetOpen ?? false;

  /// Check if dialog is open
  static bool get isDialogOpen => Get.isDialogOpen ?? false;

  /// Check if snackbar is open
  static bool get isSnackbarOpen => Get.isSnackbarOpen;
}
