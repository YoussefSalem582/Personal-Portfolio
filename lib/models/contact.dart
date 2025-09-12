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
