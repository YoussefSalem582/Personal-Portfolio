class Certificate {
  final String id;
  final String title;
  final String issuer;
  final String description;
  final DateTime issueDate;
  final String? pdfUrl;
  final String? imageUrl;
  final String? credentialUrl;

  const Certificate({
    required this.id,
    required this.title,
    required this.issuer,
    required this.description,
    required this.issueDate,
    this.pdfUrl,
    this.imageUrl,
    this.credentialUrl,
  });

  factory Certificate.fromJson(Map<String, dynamic> json) {
    return Certificate(
      id: json['id'],
      title: json['title'],
      issuer: json['issuer'],
      description: json['description'],
      issueDate: DateTime.parse(json['issueDate']),
      pdfUrl: json['pdfUrl'],
      imageUrl: json['imageUrl'],
      credentialUrl: json['credentialUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'issuer': issuer,
      'description': description,
      'issueDate': issueDate.toIso8601String(),
      'pdfUrl': pdfUrl,
      'imageUrl': imageUrl,
      'credentialUrl': credentialUrl,
    };
  }
}
