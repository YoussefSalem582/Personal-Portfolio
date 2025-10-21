import 'package:flutter/material.dart';
import 'package:emailjs/emailjs.dart' as emailjs;
import '../../theme/app_theme.dart';
import '../../models/contact_form.dart';
import '../../config/api_keys.dart';
import 'contact_form_field_widget.dart';
import 'submit_status_widget.dart';

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

    return Card(
      elevation: 8,
      shadowColor: isDark ? Colors.black26 : Colors.black12,
      child: Container(
        padding: const EdgeInsets.all(AppTheme.spacingXL),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppTheme.radiusL),
          color: isDark ? AppTheme.darkCardColor : AppTheme.surfaceColor,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Send Me a Message',
                style: (isDark
                        ? AppTheme.headingMediumForTheme(context)
                        : AppTheme.headingMedium)
                    .copyWith(fontSize: 24),
              ),

              const SizedBox(height: AppTheme.spacingL),

              // Name field - Required, basic validation
              ContactFormFieldWidget(
                controller: _nameController,
                label: 'Your Name',
                hint: 'Enter your full name',
                icon: Icons.person_outline,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),

              const SizedBox(height: AppTheme.spacingL),

              // Email field - Required, validates email format with regex
              ContactFormFieldWidget(
                controller: _emailController,
                label: 'Your Email',
                hint: 'Enter your email address',
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  ).hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),

              const SizedBox(height: AppTheme.spacingL),

              // Subject field - Required, basic validation
              ContactFormFieldWidget(
                controller: _subjectController,
                label: 'Subject',
                hint: 'What is this about?',
                icon: Icons.subject_outlined,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a subject';
                  }
                  return null;
                },
              ),

              const SizedBox(height: AppTheme.spacingL),

              // Message field - Required, validates minimum length (10 chars)
              // Multi-line text area (5 lines)
              ContactFormFieldWidget(
                controller: _messageController,
                label: 'Message',
                hint: 'Tell me about your project or inquiry...',
                icon: Icons.message_outlined,
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your message';
                  }
                  if (value.trim().length < 10) {
                    return 'Message must be at least 10 characters';
                  }
                  return null;
                },
              ),

              const SizedBox(height: AppTheme.spacingXL),

              // Show success or error message after form submission
              if (_submitStatus != null) ...[
                SubmitStatusWidget(statusMessage: _submitStatus!),
                const SizedBox(height: AppTheme.spacingL),
              ],

              // Submit button - Shows loading indicator when submitting
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isSubmitting ? null : _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      vertical: AppTheme.spacingL,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppTheme.radiusS),
                    ),
                  ),
                  child: _isSubmitting
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          ),
                        )
                      : const Text(
                          'Send Message',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ),
              ),
            ],
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
      setState(() {
        _submitStatus =
            'Message sent successfully! I\'ll get back to you soon.';
        _isSubmitting = false;
      });

      // Clear form fields after successful submission
      _nameController.clear();
      _emailController.clear();
      _subjectController.clear();
      _messageController.clear();
    } catch (e) {
      // Show error message if submission fails
      // Print error for debugging
      debugPrint('Contact form error: $e');

      // Provide more helpful error message based on error type
      String errorMessage = 'Error sending message. ';

      if (e.toString().contains('timeout')) {
        errorMessage +=
            'Request timeout. Please check your internet connection and try again.';
      } else if (e.toString().contains('403') ||
          e.toString().contains('Access denied')) {
        errorMessage +=
            'Email service authentication issue. Please contact me directly at youssef.salem.hassan582@gmail.com';
      } else if (e.toString().contains('404')) {
        errorMessage +=
            'Email service configuration not found. Please contact me directly at youssef.salem.hassan582@gmail.com';
      } else if (e.toString().contains('400') ||
          e.toString().contains('Invalid')) {
        errorMessage +=
            'Invalid form data. Please check your inputs and try again.';
      } else if (e.toString().contains('500') ||
          e.toString().contains('server')) {
        errorMessage +=
            'Email service is temporarily unavailable. Please try again later or contact me directly at youssef.salem.hassan582@gmail.com';
      } else if (e.toString().contains('CORS') ||
          e.toString().contains('XMLHttpRequest')) {
        errorMessage +=
            'Browser security issue. Please try again or contact me directly at youssef.salem.hassan582@gmail.com';
      } else if (e.toString().contains('SocketException') ||
          e.toString().contains('network')) {
        errorMessage +=
            'Network connection issue. Please check your internet and try again.';
      } else {
        errorMessage +=
            'Please try again or contact me directly at youssef.salem.hassan582@gmail.com';
      }

      setState(() {
        _submitStatus = errorMessage;
        _isSubmitting = false;
      });
    }
  }

  /// Submits the contact form using the official EmailJS Flutter package.
  ///
  /// This method sends an email to youssef.salem.hassan582@gmail.com
  /// using the EmailJS service. The form data includes name, email, subject, and message.
  ///
  /// EmailJS Setup Instructions:
  /// 1. Create account at https://www.emailjs.com/
  /// 2. Add email service (Gmail recommended)
  /// 3. Create email template with variables: {{from_name}}, {{from_email}}, {{subject}}, {{message}}
  /// 4. Get your Service ID, Template ID, and Public Key
  /// 5. Update values in lib/config/api_keys.dart
  Future<void> _submitContactForm(ContactForm form) async {
    try {
      // EmailJS configuration from secure config file
      final serviceId = ApiKeys.emailJsServiceId;
      final templateId = ApiKeys.emailJsTemplateId;
      final publicKey = ApiKeys.emailJsPublicKey;

      debugPrint('Attempting to send email with EmailJS...');
      debugPrint('Service ID: $serviceId');
      debugPrint('Template ID: $templateId');

      // Check if API keys are configured
      if (serviceId.isEmpty || templateId.isEmpty || publicKey.isEmpty) {
        throw Exception(
            'EmailJS API keys are not configured. Please contact the administrator.');
      }

      // Send email using the official EmailJS package
      await emailjs.send(
        serviceId,
        templateId,
        {
          'from_name': form.name,
          'from_email': form.email,
          'subject': form.subject,
          'message': form.message,
          'reply_to': form.email,
        },
        emailjs.Options(
          publicKey: publicKey,
          // Optional: Add rate limiting to prevent abuse
          limitRate: const emailjs.LimitRate(
            id: 'portfolio_contact',
            throttle: 10000, // 10 seconds between submissions
          ),
        ),
      );

      debugPrint('Email sent successfully!');
    } on emailjs.EmailJSResponseStatus catch (error) {
      // Handle EmailJS-specific errors
      debugPrint('EmailJS Error: ${error.status} - ${error.text}');

      // Provide user-friendly error messages based on status code
      if (error.status == 400) {
        throw Exception(
            'Invalid request. Please check your EmailJS configuration.');
      } else if (error.status == 403) {
        throw Exception(
            'Access denied. Please verify your EmailJS API keys are correct.');
      } else if (error.status == 404) {
        throw Exception(
            'Service or template not found. Please check your EmailJS IDs.');
      } else if (error.status >= 500) {
        throw Exception(
            'EmailJS server error. Please try again in a few moments.');
      } else {
        throw Exception('Failed to send email: ${error.text}');
      }
    } catch (e) {
      debugPrint('Error in _submitContactForm: $e');
      // Re-throw to be caught by _submitForm method
      rethrow;
    }
  }
}
