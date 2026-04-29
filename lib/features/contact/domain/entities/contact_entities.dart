/// Form payload for Formspree / contact submission.
class ContactForm {
  final String name;
  final String email;
  final String subject;
  final String message;

  const ContactForm({
    required this.name,
    required this.email,
    required this.subject,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'subject': subject,
      'message': message,
    };
  }
}

/// Static contact details shown in the contact section and data layer.
class ContactInfo {
  final String email;
  final String location;
  final String github;
  final String linkedin;
  final String twitter;

  ContactInfo({
    required this.email,
    required this.location,
    required this.github,
    required this.linkedin,
    this.twitter = '',
  });
}

/// Social profile link (hero, about, portfolio aggregates).
class SocialLink {
  final String name;
  final String url;
  final String iconPath;

  const SocialLink({
    required this.name,
    required this.url,
    required this.iconPath,
  });
}
