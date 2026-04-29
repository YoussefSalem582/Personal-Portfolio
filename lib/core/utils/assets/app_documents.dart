/// App Documents - Centralized document asset paths
///
/// This file contains all document asset paths used throughout the application.
/// Organized by category for easy access and maintenance.
///
/// Usage:
/// ```dart
/// import '../utils/assets/app_documents.dart';
///
/// UrlHelper.openFile(AppDocuments.resume)
/// UrlHelper.openFile(AppDocuments.projects.emosenseApp)
/// ```
class AppDocuments {
  // Prevent instantiation
  AppDocuments._();

  // ==================== Base Paths ====================

  static const String _basePath = 'assets/documents';

  // ==================== Resume & CV ====================

  /// Youssef Salem CV/Resume
  static const String resume = '$_basePath/Youssef-Salem-cv.pdf';

  /// Alternative reference (same file)
  static const String cv = resume;

  // ==================== Project Documents ====================

  /// Project documentation PDFs
  static const ProjectDocuments projects = ProjectDocuments._();

  // ==================== Certificate Documents ====================

  /// Certificate PDFs
  static const CertificateDocuments certificates = CertificateDocuments._();
}

// ==================== Project Documents Class ====================

/// Project-specific documentation
class ProjectDocuments {
  const ProjectDocuments._();

  static const String _base = 'assets/documents/projects';

  // ==================== Project PDFs ====================

  /// Emosense App documentation
  static const String emosenseApp = '$_base/emosense_app.pdf';

  /// Chat App documentation
  static const String chatApp = '$_base/Chat App.pdf';

  /// Music App documentation
  static const String musicApp = '$_base/Music App.pdf';

  /// EV Station Finder (ChargeHub) documentation
  static const String evStationFinder = '$_base/EV Station Finder App.pdf';

  /// ChargeHub App (alternative name)
  static const String chargeHubApp = evStationFinder;

  /// Gogesh App documentation
  static const String gogeshApp = '$_base/Gogesh App.pdf';

  /// GoPooling Carpool Ride Sharing App report
  static const String carpoolRideSharingApp =
      '$_base/carpool_ride_sharing_app_report.pdf';

  /// Pothole Detection Project report
  static const String potholeDetectionReport =
      '$_base/pothole_detection_project_report.pdf';

  /// Pothole Detection Project code (HTML)
  static const String potholeDetectionCode =
      '$_base/pothole_detection_project_code.html';

  /// Sign Language Translator report
  static const String signLanguageTranslatorReport =
      '$_base/sign_language_translator_reort.pdf';

  /// Three.js Interactive Learning Assistant documentation
  static const String threejsProject = '$_base/threejs_project.pdf';

  /// Facial Recognition System report
  static const String facialRecognitionSystem =
      '$_base/facial_recognition_system_report.pdf';

  /// Emosense App detailed report
  static const String emosenseAppReport = '$_base/emosense_app_report.pdf';

  // ==================== Quick Access Lists ====================

  /// All project documents
  static const List<String> all = [
    emosenseApp,
    emosenseAppReport,
    chatApp,
    musicApp,
    evStationFinder,
    gogeshApp,
    carpoolRideSharingApp,
    potholeDetectionReport,
    potholeDetectionCode,
    signLanguageTranslatorReport,
    threejsProject,
    facialRecognitionSystem,
  ];

  /// Featured project documents
  static const List<String> featured = [
    emosenseApp,
    musicApp,
    chatApp,
  ];
}

// ==================== Certificate Documents Class ====================

/// Certificate-specific PDFs
class CertificateDocuments {
  const CertificateDocuments._();

  // Add certificate PDF paths here as they are added
  // Example:
  // static const String flutterCertificate = '$_base/flutter_certificate.pdf';
  // static const String dartCertificate = '$_base/dart_certificate.pdf';
  // static const String awsCertificate = '$_base/aws_certificate.pdf';

  /// All certificate documents (empty for now, add as certificates are added)
  static const List<String> all = [];
}

// ==================== Document Types ====================

/// Enumeration of document types
enum DocumentType {
  pdf,
  doc,
  docx,
  txt,
  unknown,
}

// ==================== Helper Methods ====================

extension DocumentPathExtensions on String {
  /// Get document type from file extension
  DocumentType get documentType {
    final extension = split('.').last.toLowerCase();
    switch (extension) {
      case 'pdf':
        return DocumentType.pdf;
      case 'doc':
        return DocumentType.doc;
      case 'docx':
        return DocumentType.docx;
      case 'txt':
        return DocumentType.txt;
      default:
        return DocumentType.unknown;
    }
  }

  /// Check if this is a PDF document
  bool get isPDF => documentType == DocumentType.pdf;

  /// Check if this is a Word document
  bool get isWord =>
      documentType == DocumentType.doc || documentType == DocumentType.docx;

  /// Check if this is a text document
  bool get isText => documentType == DocumentType.txt;

  /// Check if this is a valid document path
  bool get isDocumentPath => startsWith('assets/documents/');

  /// Get document name from path (without extension)
  String get documentName {
    final name = split('/').last;
    return name.substring(0, name.lastIndexOf('.'));
  }

  /// Get document file name from path (with extension)
  String get documentFileName => split('/').last;

  /// Get document directory from path
  String get documentDirectory => substring(0, lastIndexOf('/'));

  /// Get file size category for display
  String get sizeCategory {
    // This would need actual file size, but we can estimate based on type
    if (isPDF) return 'Medium (1-5 MB)';
    if (isWord) return 'Small (< 1 MB)';
    return 'Unknown';
  }
}

// ==================== Document Metadata ====================

/// Document metadata class for additional information
class DocumentMetadata {
  final String path;
  final String title;
  final String description;
  final DocumentType type;
  final DateTime? createdAt;
  final List<String> tags;

  const DocumentMetadata({
    required this.path,
    required this.title,
    this.description = '',
    required this.type,
    this.createdAt,
    this.tags = const [],
  });

  /// Check if document has a specific tag
  bool hasTag(String tag) => tags.contains(tag.toLowerCase());

  /// Get formatted file size
  String get formattedSize => path.sizeCategory;

  /// Get file extension
  String get extension => path.split('.').last;
}

// ==================== Predefined Document Metadata ====================

class DocumentsMetadata {
  DocumentsMetadata._();

  /// Resume/CV metadata
  static const DocumentMetadata resume = DocumentMetadata(
    path: AppDocuments.resume,
    title: 'Youssef Salem - Resume',
    description: 'Professional CV/Resume showcasing skills and experience',
    type: DocumentType.pdf,
    tags: ['cv', 'resume', 'professional'],
  );

  /// Emosense App metadata
  static const DocumentMetadata emosenseApp = DocumentMetadata(
    path: ProjectDocuments.emosenseApp,
    title: 'Emosense App - Project Documentation',
    description: 'AI-powered emotion recognition platform for customer service',
    type: DocumentType.pdf,
    tags: ['project', 'ai', 'flutter', 'graduation'],
  );

  /// Chat App metadata
  static const DocumentMetadata chatApp = DocumentMetadata(
    path: ProjectDocuments.chatApp,
    title: 'Chat App - Project Documentation',
    description: 'Real-time messaging application with Firebase',
    type: DocumentType.pdf,
    tags: ['project', 'chat', 'firebase', 'flutter'],
  );

  /// Music App metadata
  static const DocumentMetadata musicApp = DocumentMetadata(
    path: ProjectDocuments.musicApp,
    title: 'Music App - Project Documentation',
    description: 'Flutter music player with modern UI',
    type: DocumentType.pdf,
    tags: ['project', 'music', 'audio', 'flutter'],
  );

  /// ChargeHub App metadata
  static const DocumentMetadata chargeHubApp = DocumentMetadata(
    path: ProjectDocuments.chargeHubApp,
    title: 'ChargeHub - EV Station Finder',
    description: 'EV and gas station finder with maps integration',
    type: DocumentType.pdf,
    tags: ['project', 'maps', 'ev', 'flutter'],
  );

  /// Gogesh App metadata
  static const DocumentMetadata gogeshApp = DocumentMetadata(
    path: ProjectDocuments.gogeshApp,
    title: 'Gogesh - Mobile Marketplace',
    description: 'Full-stack e-commerce mobile marketplace',
    type: DocumentType.pdf,
    tags: ['project', 'ecommerce', 'marketplace', 'flutter'],
  );

  /// GoPooling Carpool App metadata
  static const DocumentMetadata carpoolRideSharingApp = DocumentMetadata(
    path: ProjectDocuments.carpoolRideSharingApp,
    title: 'GoPooling - Carpool Ride Sharing App',
    description: 'University carpool platform with real-time GPS tracking',
    type: DocumentType.pdf,
    tags: ['project', 'carpool', 'maps', 'flutter', 'csci313'],
  );

  /// Pothole Detection Project metadata
  static const DocumentMetadata potholeDetectionProject = DocumentMetadata(
    path: ProjectDocuments.potholeDetectionReport,
    title: 'Pothole Detection - ML Research',
    description:
        'Comparative analysis of ML models for street pothole detection',
    type: DocumentType.pdf,
    tags: ['project', 'ml', 'cnn', 'resnet', 'research'],
  );

  /// Sign Language Translator metadata
  static const DocumentMetadata signLanguageTranslator = DocumentMetadata(
    path: ProjectDocuments.signLanguageTranslatorReport,
    title: 'Sign Language Translator',
    description: 'AI system for sign language recognition and translation',
    type: DocumentType.pdf,
    tags: ['project', 'ai', 'computer-vision', 'opencv'],
  );

  /// Three.js Interactive Learning Assistant metadata
  static const DocumentMetadata threejsProject = DocumentMetadata(
    path: ProjectDocuments.threejsProject,
    title: 'Interactive Learning Assistant',
    description: 'Immersive learning experience with customizable 3D avatars',
    type: DocumentType.pdf,
    tags: ['project', 'threejs', 'react', '3d', 'education'],
  );

  /// Facial Recognition System metadata
  static const DocumentMetadata facialRecognitionSystem = DocumentMetadata(
    path: ProjectDocuments.facialRecognitionSystem,
    title: 'Facial Recognition System',
    description: 'AI-powered facial recognition and analysis system',
    type: DocumentType.pdf,
    tags: ['project', 'ai', 'opencv', 'tensorflow', 'computer-vision'],
  );

  /// All project documents metadata
  static const List<DocumentMetadata> allProjects = [
    emosenseApp,
    chatApp,
    musicApp,
    chargeHubApp,
    gogeshApp,
    carpoolRideSharingApp,
    potholeDetectionProject,
    signLanguageTranslator,
    threejsProject,
    facialRecognitionSystem,
  ];
}

// ==================== Document Categories ====================

/// Document categories for filtering and organization
class DocumentCategories {
  DocumentCategories._();

  /// Resume and CV documents
  static const String resume = 'resume';

  /// Project documentation
  static const String projects = 'projects';

  /// Certificate documents
  static const String certificates = 'certificates';

  /// Legal documents
  static const String legal = 'legal';

  /// All categories
  static const List<String> all = [
    resume,
    projects,
    certificates,
    legal,
  ];

  /// Get display name for category
  static String getDisplayName(String category) {
    switch (category) {
      case resume:
        return 'Resume & CV';
      case projects:
        return 'Project Documentation';
      case certificates:
        return 'Certificates';
      case legal:
        return 'Legal Documents';
      default:
        return category;
    }
  }

  /// Get icon for category
  static String getIcon(String category) {
    switch (category) {
      case resume:
        return '📄';
      case projects:
        return '📁';
      case certificates:
        return '🏆';
      case legal:
        return '⚖️';
      default:
        return '📄';
    }
  }
}
