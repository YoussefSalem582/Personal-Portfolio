import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/certificate.dart';
import '../config/supabase_config.dart';
import 'supabase_service.dart';

class CertificatesService {
  static const String tableName = 'certificates';
  static SupabaseClient get _client => SupabaseService.client;

  // Fetch all certificates from Supabase
  static Future<List<Certificate>> getAllCertificates() async {
    try {
      final response = await _client
          .from(tableName)
          .select()
          .order('issue_date', ascending: false);

      return (response as List)
          .map((json) => Certificate.fromJson(json))
          .toList();
    } catch (e) {
      print('Error fetching certificates: $e');
      return [];
    }
  }

  // Fetch a single certificate by ID
  static Future<Certificate?> getCertificateById(String id) async {
    try {
      final response =
          await _client.from(tableName).select().eq('id', id).single();

      return Certificate.fromJson(response);
    } catch (e) {
      print('Error fetching certificate: $e');
      return null;
    }
  }

  // Create a new certificate
  static Future<Certificate?> createCertificate(Certificate certificate) async {
    try {
      final response = await _client
          .from(tableName)
          .insert(certificate.toJson())
          .select()
          .single();

      return Certificate.fromJson(response);
    } catch (e) {
      print('Error creating certificate: $e');
      return null;
    }
  }

  // Update an existing certificate
  static Future<Certificate?> updateCertificate(Certificate certificate) async {
    try {
      final response = await _client
          .from(tableName)
          .update(certificate.toJson())
          .eq('id', certificate.id)
          .select()
          .single();

      return Certificate.fromJson(response);
    } catch (e) {
      print('Error updating certificate: $e');
      return null;
    }
  }

  // Delete a certificate
  static Future<bool> deleteCertificate(String id) async {
    try {
      await _client.from(tableName).delete().eq('id', id);
      return true;
    } catch (e) {
      print('Error deleting certificate: $e');
      return false;
    }
  }

  // Upload certificate image
  static Future<String?> uploadCertificateImage({
    required String certificateId,
    required List<int> imageBytes,
    required String fileName,
    String? contentType,
  }) async {
    final storagePath = 'certificates/$certificateId/$fileName';

    return await SupabaseService.uploadFile(
      bucketName: SupabaseConfig.certificateImagesBucket,
      fileName: storagePath,
      fileBytes: imageBytes,
      contentType: contentType,
    );
  }

  // Upload certificate PDF
  static Future<String?> uploadCertificatePdf({
    required String certificateId,
    required List<int> pdfBytes,
    required String fileName,
  }) async {
    final storagePath = 'certificates/$certificateId/pdfs/$fileName';

    return await SupabaseService.uploadFile(
      bucketName: SupabaseConfig.certificateImagesBucket,
      fileName: storagePath,
      fileBytes: pdfBytes,
      contentType: 'application/pdf',
    );
  }

  // Delete certificate file (image or PDF)
  static Future<bool> deleteCertificateFile({
    required String certificateId,
    required String fileName,
    bool isPdf = false,
  }) async {
    final storagePath = isPdf
        ? 'certificates/$certificateId/pdfs/$fileName'
        : 'certificates/$certificateId/$fileName';

    return await SupabaseService.deleteFile(
      bucketName: SupabaseConfig.certificateImagesBucket,
      fileName: storagePath,
    );
  }
}
