class ContactForm {
  final String name;
  final String email;
  final String subject;
  final String message;

  ContactForm({
    required this.name,
    required this.email,
    required this.subject,
    required this.message,
  });
}

class ContactInfo {
  final String email;
  final String phone;
  final String location;
  final String github;
  final String linkedin;
  final String twitter;

  ContactInfo({
    required this.email,
    required this.phone,
    required this.location,
    required this.github,
    required this.linkedin,
    this.twitter = '',
  });
}
