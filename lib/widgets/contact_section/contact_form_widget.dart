import 'package:flutter/material.dart';
import 'dart:async';
import 'package:dio/dio.dart';
import '../../l10n/app_localizations.dart';
import '../../utils/assets/app_constants.dart';
import '../../models/contact_form.dart';
import '../../config/api_keys.dart';
import 'contact_form_field_widget.dart';
import 'submit_status_widget.dart';

import '../../theme/app_theme.dart';

enum _ContactSubmitKind {
  notConfigured,
  invalidForm,
  formDisabled,
  rateLimit,
  failedWithStatus,
  timeout,
  network,
  badCertificate,
}

class _ContactSubmitException implements Exception {
  _ContactSubmitException(this.kind, {this.statusCode});
  final _ContactSubmitKind kind;
  final int? statusCode;
}

/// A comprehensive contact form widget with validation and submission handling.
///
/// This widget provides a complete contact form with four fields: name, email,
/// subject, and message. It includes form validation, loading states, and
/// success/error feedback. The form is contained in a styled card with
/// theme-aware colors.
class ContactFormWidget extends StatefulWidget {
  const ContactFormWidget({super.key});

  @override
  State<ContactFormWidget> createState() => _ContactFormWidgetState();
}

class _ContactFormWidgetState extends State<ContactFormWidget> {
  // Form key for validation
  final _formKey = GlobalKey<FormState>();

  // Text controllers for form fields
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  // Form submission state
  bool _isSubmitting = false;
  String? _submitStatus;
  bool _submitStatusIsError = false;

  @override
  void dispose() {
    // Clean up text controllers when widget is disposed
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Determine theme mode for styling
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final isSmallMobile = screenWidth < 375;
    final l10n = AppLocalizations.of(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
            isMobile ? AppTheme.radiusL : AppTheme.radiusXL),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDark
              ? [
                  AppColors.cardDark,
                  AppColors.surfaceDark,
                ]
              : [
                  AppColors.white,
                  AppColors.surfaceLight,
                ],
        ),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? AppColors.black.withOpacity(0.3)
                : AppColors.black.withOpacity(0.08),
            blurRadius: 24,
            offset: const Offset(0, 8),
            spreadRadius: 0,
          ),
        ],
        border: Border.all(
          color: isDark
              ? AppColors.accentDark.withOpacity(0.2)
              : AppColors.accentLight.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
            isMobile ? AppTheme.radiusL : AppTheme.radiusXL),
        child: Container(
          padding: EdgeInsets.all(
              isMobile ? AppTheme.spacingL : AppTheme.spacingXXL),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with icon
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(
                          isMobile ? AppTheme.spacingS : AppTheme.spacingM),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: isDark
                              ? [
                                  AppColors.accentDark,
                                  AppColors.accentDark.withOpacity(0.8)
                                ]
                              : [
                                  AppColors.accentLight,
                                  AppColors.accentLight.withOpacity(0.8)
                                ],
                        ),
                        borderRadius: BorderRadius.circular(
                            isMobile ? AppTheme.radiusS : AppTheme.radiusM),
                        boxShadow: [
                          BoxShadow(
                            color: (isDark
                                    ? AppColors.accentDark
                                    : AppColors.accentLight)
                                .withOpacity(0.3),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Icon(
                        AppIcons.send,
                        color: AppColors.white,
                        size: isMobile ? (isSmallMobile ? 22 : 24) : 28,
                      ),
                    ),
                    SizedBox(
                        width:
                            isMobile ? AppTheme.spacingM : AppTheme.spacingL),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.contactFormTitle,
                            style: AppFonts.h2().copyWith(
                              fontSize:
                                  isMobile ? (isSmallMobile ? 18 : 20) : null,
                              color: isDark
                                  ? AppColors.textPrimaryDark
                                  : AppColors.textPrimaryLight,
                              fontWeight: AppFonts.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            l10n.contactFormSubtitle,
                            style: AppFonts.bodySmall().copyWith(
                              fontSize:
                                  isMobile ? (isSmallMobile ? 10 : 11) : null,
                              color: isDark
                                  ? AppColors.textSecondaryDark
                                  : AppColors.textSecondaryLight,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(
                    height: isMobile ? AppTheme.spacingL : AppTheme.spacingXXL),

                // Name field - Required, basic validation
                ContactFormFieldWidget(
                  controller: _nameController,
                  label: l10n.contactFieldName,
                  hint: l10n.contactFieldNameHint,
                  icon: AppIcons.user,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return l10n.contactValidationNameRequired;
                    }
                    return null;
                  },
                ),

                const SizedBox(height: AppTheme.spacingL),

                // Email field - Required, validates email format with regex
                ContactFormFieldWidget(
                  controller: _emailController,
                  label: l10n.contactFieldEmail,
                  hint: l10n.contactFieldEmailHint,
                  icon: AppIcons.email,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return l10n.contactValidationEmailRequired;
                    }
                    if (!RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    ).hasMatch(value)) {
                      return l10n.contactValidationEmailInvalid;
                    }
                    return null;
                  },
                ),

                const SizedBox(height: AppTheme.spacingL),

                // Subject field - Required, basic validation
                ContactFormFieldWidget(
                  controller: _subjectController,
                  label: l10n.contactFieldSubject,
                  hint: l10n.contactFieldSubjectHint,
                  icon: AppIcons.subject,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return l10n.contactValidationSubjectRequired;
                    }
                    return null;
                  },
                ),

                const SizedBox(height: AppTheme.spacingL),

                // Message field - Required, validates minimum length (10 chars)
                // Multi-line text area (5 lines)
                ContactFormFieldWidget(
                  controller: _messageController,
                  label: l10n.contactFieldMessage,
                  hint: l10n.contactFieldMessageHint,
                  icon: AppIcons.message,
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return l10n.contactValidationMessageRequired;
                    }
                    if (value.trim().length < 10) {
                      return l10n.contactValidationMessageMinLength;
                    }
                    return null;
                  },
                ),

                SizedBox(
                    height: isMobile ? AppTheme.spacingL : AppTheme.spacingXXL),

                // Show success or error message after form submission
                if (_submitStatus != null) ...[
                  SubmitStatusWidget(
                    statusMessage: _submitStatus!,
                    isError: _submitStatusIsError,
                  ),
                  const SizedBox(height: AppTheme.spacingL),
                ],

                // Submit button - Shows loading indicator when submitting
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isSubmitting ? null : _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          isDark ? AppColors.accentDark : AppColors.accentLight,
                      foregroundColor: AppColors.white,
                      padding: EdgeInsets.symmetric(
                        vertical: isMobile
                            ? AppTheme.spacingM
                            : (AppTheme.spacingL + 4),
                      ),
                      elevation: 0,
                      shadowColor: (isDark
                              ? AppColors.accentDark
                              : AppColors.accentLight)
                          .withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            isMobile ? AppTheme.radiusS : AppTheme.radiusM),
                      ),
                    ),
                    child: _isSubmitting
                        ? SizedBox(
                            height: isMobile ? 20 : 24,
                            width: isMobile ? 20 : 24,
                            child: const CircularProgressIndicator(
                              strokeWidth: 3,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                AppColors.white,
                              ),
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(AppIcons.send,
                                  size: isMobile
                                      ? (isSmallMobile ? 16 : 18)
                                      : 20),
                              SizedBox(width: isMobile ? 6 : AppTheme.spacingS),
                              Text(
                                l10n.contactSendButton,
                                style: AppFonts.button().copyWith(
                                  fontSize:
                                      isMobile ? (isSmallMobile ? 14 : 15) : 16,
                                  fontWeight: AppFonts.semiBold,
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Handles form submission with validation and error handling.
  ///
  /// Process:
  /// 1. Validates all form fields
  /// 2. Sets loading state
  /// 3. Creates ContactForm model from field values
  /// 4. Calls submission method (placeholder for API integration)
  /// 5. Shows success message and clears form, or shows error message
  Future<void> _submitForm() async {
    // Validate form before submission
    if (!_formKey.currentState!.validate()) return;

    // Set loading state
    setState(() {
      _isSubmitting = true;
      _submitStatus = null;
      _submitStatusIsError = false;
    });

    try {
      // Create ContactForm model from form data
      final contactForm = ContactForm(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        subject: _subjectController.text.trim(),
        message: _messageController.text.trim(),
      );

      // Submit the form (placeholder implementation)
      await _submitContactForm(contactForm);

      // Show success message
      if (!mounted) return;
      final l10n = AppLocalizations.of(context);
      setState(() {
        _submitStatus = l10n.contactSuccessMessage;
        _isSubmitting = false;
        _submitStatusIsError = false;
      });

      // Clear form fields after successful submission
      _nameController.clear();
      _emailController.clear();
      _subjectController.clear();
      _messageController.clear();
    } catch (e) {
      if (!mounted) return;
      final l10n = AppLocalizations.of(context);
      final errorMessage = _localizedSubmitError(e, l10n);

      setState(() {
        _submitStatus = errorMessage;
        _isSubmitting = false;
        _submitStatusIsError = true;
      });
    }
  }

  String _localizedSubmitError(Object e, AppLocalizations l10n) {
    const email = ApiKeys.recipientEmail;
    if (e is _ContactSubmitException) {
      switch (e.kind) {
        case _ContactSubmitKind.notConfigured:
          return l10n.contactErrorNotConfigured;
        case _ContactSubmitKind.invalidForm:
          return l10n.contactErrorInvalidForm;
        case _ContactSubmitKind.formDisabled:
          return l10n.contactErrorFormDisabledWithEmail(email);
        case _ContactSubmitKind.rateLimit:
          return l10n.contactErrorRateLimit;
        case _ContactSubmitKind.failedWithStatus:
          final c = e.statusCode ?? 0;
          if (c == 404) return l10n.contactError404(email);
          if (c >= 500) return l10n.contactErrorServer(email);
          return l10n.contactErrorFailedWithCode(c, email);
        case _ContactSubmitKind.timeout:
          return l10n.contactErrorTimeout;
        case _ContactSubmitKind.network:
          return l10n.contactErrorNetworkSimple;
        case _ContactSubmitKind.badCertificate:
          return l10n.contactErrorCertificate;
      }
    }
    final s = e.toString().toLowerCase();
    if (s.contains('cors') || s.contains('xmlhttprequest')) {
      return '${l10n.contactErrorGeneric}${l10n.contactErrorCors(email)}';
    }
    return '${l10n.contactErrorGeneric}${l10n.contactErrorTryDirect(email)}';
  }

  /// Submits the contact form using Formspree (100% FREE, no domain restrictions!)
  ///
  /// This method sends an email to youssef.salem.hassan582@gmail.com
  /// using the Formspree service. Works on ANY domain without configuration.
  ///
  /// Formspree Setup Instructions:
  /// 1. Go to https://formspree.io/
  /// 2. Sign up for FREE account (no credit card needed)
  /// 3. Create a new form and get your Form ID (format: https://formspree.io/f/YOUR_FORM_ID)
  /// 4. Update the formspreeEndpoint in lib/config/api_keys.dart with your Form ID
  /// 5. That's it! No domain whitelisting needed - works everywhere!
  ///
  /// Free tier includes:
  /// - 50 submissions per month
  /// - No domain restrictions
  /// - Email notifications
  /// - File uploads
  Future<void> _submitContactForm(ContactForm form) async {
    const formspreeEndpoint = ApiKeys.formspreeEndpoint;
    if (formspreeEndpoint.isEmpty) {
      throw _ContactSubmitException(_ContactSubmitKind.notConfigured);
    }

    final dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));

    final formData = {
      'name': form.name,
      'email': form.email,
      'subject': form.subject,
      'message': form.message,
      '_replyto': form.email,
      '_subject': '${form.subject} - Portfolio Contact Form',
    };

    try {
      final response = await dio.post(
        formspreeEndpoint,
        data: formData,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return;
      }
      if (response.statusCode == 422) {
        throw _ContactSubmitException(_ContactSubmitKind.invalidForm);
      }
      if (response.statusCode == 403) {
        throw _ContactSubmitException(_ContactSubmitKind.formDisabled);
      }
      if (response.statusCode == 429) {
        throw _ContactSubmitException(_ContactSubmitKind.rateLimit);
      }
      throw _ContactSubmitException(
        _ContactSubmitKind.failedWithStatus,
        statusCode: response.statusCode ?? 0,
      );
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw _ContactSubmitException(_ContactSubmitKind.timeout);
      }
      if (e.type == DioExceptionType.connectionError) {
        throw _ContactSubmitException(_ContactSubmitKind.network);
      }
      if (e.type == DioExceptionType.badResponse) {
        final statusCode = e.response?.statusCode ?? 0;
        if (statusCode == 422) {
          throw _ContactSubmitException(_ContactSubmitKind.invalidForm);
        }
        if (statusCode == 403) {
          throw _ContactSubmitException(_ContactSubmitKind.formDisabled);
        }
        if (statusCode == 429) {
          throw _ContactSubmitException(_ContactSubmitKind.rateLimit);
        }
        throw _ContactSubmitException(
          _ContactSubmitKind.failedWithStatus,
          statusCode: statusCode,
        );
      }
      if (e.type == DioExceptionType.badCertificate) {
        throw _ContactSubmitException(_ContactSubmitKind.badCertificate);
      }
      throw _ContactSubmitException(_ContactSubmitKind.network);
    }
  }
}
