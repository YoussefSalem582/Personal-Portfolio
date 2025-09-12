import 'package:flutter_test/flutter_test.dart';
import 'package:personal_portfolio/models/certificate.dart';

void main() {
  group('Certificate Model Tests', () {
    test('should create Certificate instance correctly', () {
      final certificate = Certificate(
        id: 'test-cert',
        title: 'Test Certificate',
        issuer: 'Test Institution',
        description: 'A test certificate description',
        issueDate: DateTime(2025, 1, 1),
        pdfUrl: 'assets/certificates/test.pdf',
        imageUrl: 'assets/certificates/test.png',
        credentialUrl: 'https://credentials.test.com/cert',
      );

      expect(certificate.id, 'test-cert');
      expect(certificate.title, 'Test Certificate');
      expect(certificate.issuer, 'Test Institution');
      expect(certificate.description, 'A test certificate description');
      expect(certificate.issueDate, DateTime(2025, 1, 1));
      expect(certificate.pdfUrl, 'assets/certificates/test.pdf');
      expect(certificate.imageUrl, 'assets/certificates/test.png');
      expect(certificate.credentialUrl, 'https://credentials.test.com/cert');
    });

    test('should convert Certificate to JSON correctly', () {
      final certificate = Certificate(
        id: 'test-cert',
        title: 'Test Certificate',
        issuer: 'Test Institution',
        description: 'A test certificate description',
        issueDate: DateTime(2025, 1, 1),
        pdfUrl: 'assets/certificates/test.pdf',
      );

      final json = certificate.toJson();

      expect(json['id'], 'test-cert');
      expect(json['title'], 'Test Certificate');
      expect(json['issuer'], 'Test Institution');
      expect(json['issueDate'], '2025-01-01T00:00:00.000');
    });

    test('should create Certificate from JSON correctly', () {
      final json = {
        'id': 'test-cert',
        'title': 'Test Certificate',
        'issuer': 'Test Institution',
        'description': 'A test certificate description',
        'issueDate': '2025-01-01T00:00:00.000',
        'pdfUrl': 'assets/certificates/test.pdf',
        'imageUrl': 'assets/certificates/test.png',
        'credentialUrl': 'https://credentials.test.com/cert',
      };

      final certificate = Certificate.fromJson(json);

      expect(certificate.id, 'test-cert');
      expect(certificate.title, 'Test Certificate');
      expect(certificate.issuer, 'Test Institution');
      expect(certificate.issueDate, DateTime(2025, 1, 1));
    });
  });
}
