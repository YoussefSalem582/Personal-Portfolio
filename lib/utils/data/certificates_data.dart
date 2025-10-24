import '../../models/certificate.dart';
import '../assets/app_constants.dart';

class CertificatesData {
  static final List<Certificate> certificates = [
    Certificate(
      id: 'route-flutter-diploma',
      title: 'Flutter Development Diploma',
      issuer: 'Route IT Training Center',
      description:
          'Comprehensive Flutter development certification covering mobile app development, state management, and UI/UX design.\n\n'
          'Duration: February 2025 – June 2025 (4 months)',
      issueDate: DateTime(2025, 2, 1),
      pdfUrl: CertificateImages.routeFlutterDiplomaPdf,
      imageUrl: CertificateImages.routeFlutterDiploma,
    ),
    Certificate(
      id: 'ml-depi',
      title: 'DEPI Microsoft ML Engineer',
      issuer: 'Digital Egypt Pioneers Initiative (DEPI)',
      description:
          'Microsoft Machine Learning Engineer certification focused on translating raw data from various pipelines into scalable data science models using Microsoft Azure technology. Developed algorithms and built programs enabling machines to process incoming data and identify patterns.\n\n'
          'Duration: October 2024 – May 2025 (8 months)\n\n'
          'Completed 10 Comprehensive Courses:\n'
          '• Capstone Project\n'
          '• Statistics and Linear Algebra Basics\n'
          '• Data Science with Python\n'
          '• Machine Learning\n'
          '• Azure AI Fundamentals\n'
          '• Azure AI Engineer Associate\n'
          '• MLOps Tools (MLflow and Hugging Face)\n'
          '• Build Basic Generative Adversarial Networks (GANs)\n'
          '• Natural Language Processing with Attention Models\n'
          '• Prompt Engineering\n\n'
          'Hands-on experience with Microsoft Azure AI services and cloud-based machine learning deployment.',
      issueDate: DateTime(2024, 10, 1),
      pdfUrl: CertificateImages.mlDepiCertificatePdf,
      imageUrl: CertificateImages.mlDepiCertificate,
    ),
    Certificate(
      id: 'codealpha-certificate',
      title: 'Mobile Application Developer Intern',
      issuer: 'CodeAlpha',
      description:
          'Mobile application development internship focusing on Flutter app development and practical programming skills.\n\n'
          'Duration: 1 March 2025 – 30 March 2025 (1 month)',
      issueDate: DateTime(2025, 3, 1),
      pdfUrl: CertificateImages.codeAlphaCertificatePdf,
      imageUrl: CertificateImages.codeAlphaCertificate,
    ),
    Certificate(
      id: 'codealpha-lor',
      title: 'CodeAlpha Letter of Recommendation',
      issuer: 'CodeAlpha',
      description:
          'Letter of recommendation recognizing outstanding performance and contributions during the mobile app development internship period.\n\n'
          'Duration: 1 March 2025 – 30 March 2025 (1 month)',
      issueDate: DateTime(2025, 3, 1),
      pdfUrl: CertificateImages.codeAlphaLorPdf,
      imageUrl: CertificateImages.codeAlphaCertificate,
    ),
    Certificate(
      id: 'uneeq-internship',
      title: 'Flutter App Development Intern',
      issuer: 'UneeQ Interns',
      description:
          'Flutter app development internship focusing on mobile application development.\n\n'
          'Duration: 1 March 2025 – 25 March 2025 (1 month)',
      issueDate: DateTime(2025, 3, 1),
      pdfUrl: CertificateImages.uneeqInternCertificatePdf,
      imageUrl: CertificateImages.uneeqInternCertificate,
    ),
    Certificate(
      id: 'ecpc',
      title: 'Egyptian Collegiate Programming Contest',
      issuer: 'ECPC',
      description:
          'Participation certificate in the Egyptian Collegiate Programming Contest demonstrating problem-solving skills.',
      issueDate: DateTime(2024, 10, 1),
      pdfUrl: CertificateImages.ecpcCertificatePdf,
      imageUrl: CertificateImages.ecpcCertificate,
    ),
    Certificate(
      id: 'intro-jupyter',
      title: 'Introduction to Jupyter Notebook',
      issuer: 'Coursera',
      description:
          'Certificate of completion for Introduction to Jupyter Notebook course, covering data science fundamentals and notebook usage.',
      issueDate: DateTime(2024, 9, 15),
      pdfUrl: CertificateImages.introJupyterPdf,
      imageUrl: CertificateImages.mlDepiCertificate,
    ),
    Certificate(
      id: 'intro-python',
      title: 'Introduction to Python',
      issuer: 'Coursera',
      description:
          'Certificate of completion for Introduction to Python programming course, covering fundamental programming concepts and Python syntax.',
      issueDate: DateTime(2024, 9, 10),
      pdfUrl: CertificateImages.introPythonPdf,
      imageUrl: CertificateImages.mlDepiCertificate,
    ),
    Certificate(
      id: 'ugrf-1',
      title: 'UGRF Certificate',
      issuer: 'UGRF (Undergraduate Research Forum)',
      description:
          'Undergraduate research participation certificate recognizing academic contribution.',
      issueDate: DateTime(2024, 9, 1),
      imageUrl: CertificateImages.ugrfCertificate1,
    ),
    Certificate(
      id: 'ugrf-2',
      title: 'UGRF Recognition',
      issuer: 'UGRF (Undergraduate Research Forum)',
      description:
          'Additional recognition certificate for outstanding undergraduate research work.',
      issueDate: DateTime(2024, 9, 1),
      imageUrl: CertificateImages.ugrfCertificate2,
    ),
    Certificate(
      id: 'we-certificate',
      title: 'Mobile Application Developer by Flutter',
      issuer: 'Telecom Egypt',
      description:
          'Flutter mobile application development internship at Telecom Egypt, focused on mobile app development using Flutter framework.\n\n'
          'Duration: July 2024 – September 2024 (3 months)',
      issueDate: DateTime(2024, 7, 1),
      pdfUrl: CertificateImages.weCertificatePdf,
      imageUrl: CertificateImages.weCertificate,
    ),
  ];
}
