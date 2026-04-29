import 'package:equatable/equatable.dart';

import '../../domain/entities/contact_entities.dart';

abstract class ContactEvent extends Equatable {
  const ContactEvent();

  @override
  List<Object?> get props => [];
}

final class ContactFormSubmitted extends ContactEvent {
  const ContactFormSubmitted(this.form);

  final ContactForm form;

  @override
  List<Object?> get props => [form];
}
