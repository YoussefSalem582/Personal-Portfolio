import 'package:equatable/equatable.dart';

import '../../../../models/contact_form.dart';
import '../../domain/contact_submit_error.dart';

enum ContactFormStatus { idle, submitting, success, failure }

class ContactState extends Equatable {
  const ContactState({
    required this.contactInfo,
    this.formStatus = ContactFormStatus.idle,
    this.submitError,
  });

  final ContactInfo contactInfo;
  final ContactFormStatus formStatus;
  final ContactSubmitError? submitError;

  ContactState copyWith({
    ContactInfo? contactInfo,
    ContactFormStatus? formStatus,
    ContactSubmitError? submitError,
    bool clearSubmitError = false,
  }) {
    return ContactState(
      contactInfo: contactInfo ?? this.contactInfo,
      formStatus: formStatus ?? this.formStatus,
      submitError:
          clearSubmitError ? null : (submitError ?? this.submitError),
    );
  }

  @override
  List<Object?> get props => [contactInfo, formStatus, submitError];
}
