import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../services/supabase_service.dart';

class AdminController extends GetxController {
  final RxBool _isAuthenticated = false.obs;
  final RxBool _isLoading = false.obs;
  final RxnString _error = RxnString();
  final Rxn<User> _currentUser = Rxn<User>();

  // Getters
  bool get isAuthenticated => _isAuthenticated.value;
  bool get isLoading => _isLoading.value;
  String? get error => _error.value;
  User? get currentUser => _currentUser.value;

  @override
  void onInit() {
    super.onInit();
    _checkAuthState();
  }

  /// Check if user is already authenticated
  void _checkAuthState() {
    final session = SupabaseService.client.auth.currentSession;
    if (session != null) {
      _isAuthenticated.value = true;
      _currentUser.value = session.user;
    }

    // Listen to auth state changes
    SupabaseService.client.auth.onAuthStateChange.listen((data) {
      final session = data.session;
      if (session != null) {
        _isAuthenticated.value = true;
        _currentUser.value = session.user;
      } else {
        _isAuthenticated.value = false;
        _currentUser.value = null;
      }
    });
  }

  /// Sign in with email and password
  Future<bool> signIn(String email, String password) async {
    _isLoading.value = true;
    _error.value = null;

    try {
      final response = await SupabaseService.client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.session != null) {
        _isAuthenticated.value = true;
        _currentUser.value = response.user;
        _isLoading.value = false;

        Get.snackbar(
          'Success',
          'Signed in successfully!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        return true;
      }

      _isLoading.value = false;
      return false;
    } catch (e) {
      _error.value = e.toString();
      _isLoading.value = false;

      Get.snackbar(
        'Authentication Error',
        _error.value ?? 'Failed to sign in',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 5),
      );

      return false;
    }
  }

  /// Sign out
  Future<void> signOut() async {
    try {
      await SupabaseService.client.auth.signOut();
      _isAuthenticated.value = false;
      _currentUser.value = null;

      Get.snackbar(
        'Success',
        'Signed out successfully!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      // Navigate to login
      Get.offAllNamed('/admin/login');
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to sign out: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  /// Clear error
  void clearError() {
    _error.value = null;
  }

  /// Reset password (send reset email)
  Future<bool> resetPassword(String email) async {
    _isLoading.value = true;
    _error.value = null;

    try {
      await SupabaseService.client.auth.resetPasswordForEmail(email);
      _isLoading.value = false;

      Get.snackbar(
        'Success',
        'Password reset email sent! Check your inbox.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: const Duration(seconds: 5),
      );

      return true;
    } catch (e) {
      _error.value = e.toString();
      _isLoading.value = false;

      Get.snackbar(
        'Error',
        _error.value ?? 'Failed to send reset email',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );

      return false;
    }
  }
}
