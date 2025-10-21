import '../../models/certificate.dart';

class CertificatesData {
  static final List<Certificate> certificates = [
    Certificate(
      id: 'route-flutter-diploma',
      title: 'Flutter Diploma Certificate',
      issuer: 'Route Academy',
      description:
          'Comprehensive Flutter development certification covering mobile app development, state management, and UI/UX design.',
      issueDate: DateTime(2025, 1, 1),
      pdfUrl:
          'assets/images/certificates/route_flutter_diploma_certificate.pdf',
      imageUrl:
          'assets/images/certificates/photos/Route Flutter Diploma Certificate.png',
    ),
    Certificate(
      id: 'ml-depi',
      title: 'Machine Learning Certificate',
      issuer: 'DEPI (Digital Egypt Pioneers Initiative)',
      description:
          'Advanced machine learning certification covering neural networks, deep learning, and AI model development.',
      issueDate: DateTime(2024, 12, 1),
      pdfUrl: 'assets/images/certificates/ml_depi_certificate.pdf',
      imageUrl: 'assets/images/certificates/photos/ml_depi_certificate.png',
    ),
    Certificate(
      id: 'codealpha-certificate',
      title: 'CodeAlpha Internship Certificate',
      issuer: 'CodeAlpha',
      description:
          'Software development internship focusing on mobile app development and practical programming skills.',
      issueDate: DateTime(2024, 11, 1),
      pdfUrl: 'assets/images/certificates/CodeAlpha Certificate.pdf',
      imageUrl: 'assets/images/certificates/photos/CodeAlpha Certificate.png',
    ),
    Certificate(
      id: 'uneeq-internship',
      title: 'Uneeq Internship Certificate',
      issuer: 'Uneeq',
      description:
          'Internship certificate for software development and professional experience at Uneeq.',
      issueDate: DateTime(2024, 11, 15),
      imageUrl:
          'assets/images/certificates/photos/uneeq_intern_certificate.png',
    ),
    Certificate(
      id: 'ecpc',
      title: 'Egyptian Collegiate Programming Contest',
      issuer: 'ECPC',
      description:
          'Participation certificate in the Egyptian Collegiate Programming Contest demonstrating problem-solving skills.',
      issueDate: DateTime(2024, 10, 1),
      pdfUrl: 'assets/images/certificates/ECPC.pdf',
      imageUrl: 'assets/images/certificates/photos/ECPC.jpg',
    ),
    Certificate(
      id: 'ugrf-1',
      title: 'UGRF Certificate',
      issuer: 'UGRF (Undergraduate Research Forum)',
      description:
          'Undergraduate research participation certificate recognizing academic contribution.',
      issueDate: DateTime(2024, 9, 1),
      imageUrl: 'assets/images/certificates/photos/UGRF 1.jpg',
    ),
    Certificate(
      id: 'ugrf-2',
      title: 'UGRF Recognition',
      issuer: 'UGRF (Undergraduate Research Forum)',
      description:
          'Additional recognition certificate for outstanding undergraduate research work.',
      issueDate: DateTime(2024, 9, 1),
      imageUrl: 'assets/images/certificates/photos/UGRF .jpg',
    ),
    Certificate(
      id: 'we-certificate',
      title: 'WE Certificate',
      issuer: 'WE (Telecom Egypt)',
      description: 'Technology and telecommunications industry certificate.',
      issueDate: DateTime(2024, 6, 1),
      pdfUrl: 'assets/images/certificates/we_certificate.pdf',
      imageUrl: 'assets/images/certificates/photos/we_certificate.png',
    ),
  ];
}
