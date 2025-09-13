import 'package:supabase_flutter/supabase_flutter.dart';
import '../config/supabase_config.dart';
import 'supabase_service.dart';

class PersonalInfoService {
  static const String tableName = 'personal_info';
  static const String socialLinksTableName = 'social_links';
  static SupabaseClient get _client => SupabaseService.client;

  // Fetch personal information
  static Future<Map<String, dynamic>?> getPersonalInfo() async {
    try {
      final response = await _client
          .from(tableName)
          .select()
          .single();

      return response;
    } catch (e) {
      print('Error fetching personal info: $e');
      return null;
    }
  }

  // Update personal information
  static Future<bool> updatePersonalInfo(Map<String, dynamic> info) async {
    try {
      await _client
          .from(tableName)
          .update(info)
          .eq('id', info['id']);
      return true;
    } catch (e) {
      print('Error updating personal info: $e');
      return false;
    }
  }

  // Fetch social links
  static Future<List<Map<String, dynamic>>> getSocialLinks() async {
    try {
      final response = await _client
          .from(socialLinksTableName)
          .select()
          .order('order_index', ascending: true);

      return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      print('Error fetching social links: $e');
      return [];
    }
  }

  // Create a new social link
  static Future<Map<String, dynamic>?> createSocialLink({
    required String platform,
    required String url,
    required String icon,
    int? orderIndex,
  }) async {
    try {
      final response = await _client
          .from(socialLinksTableName)
          .insert({
            'platform': platform,
            'url': url,
            'icon': icon,
            'order_index': orderIndex ?? 0,
          })
          .select()
          .single();

      return response;
    } catch (e) {
      print('Error creating social link: $e');
      return null;
    }
  }

  // Update a social link
  static Future<bool> updateSocialLink({
    required String id,
    required Map<String, dynamic> updates,
  }) async {
    try {
      await _client
          .from(socialLinksTableName)
          .update(updates)
          .eq('id', id);
      return true;
    } catch (e) {
      print('Error updating social link: $e');
      return false;
    }
  }

  // Delete a social link
  static Future<bool> deleteSocialLink(String id) async {
    try {
      await _client
          .from(socialLinksTableName)
          .delete()
          .eq('id', id);
      return true;
    } catch (e) {
      print('Error deleting social link: $e');
      return false;
    }
  }

  // Upload profile image
  static Future<String?> uploadProfileImage({
    required List<int> imageBytes,
    required String fileName,
    String? contentType,
  }) async {
    final storagePath = 'profile/$fileName';
    
    return await SupabaseService.uploadFile(
      bucketName: SupabaseConfig.profileImagesBucket,
      fileName: storagePath,
      fileBytes: imageBytes,
      contentType: contentType,
    );
  }

  // Upload resume file
  static Future<String?> uploadResume({
    required List<int> resumeBytes,
    required String fileName,
    String fileType = 'pdf',
  }) async {
    final storagePath = 'resume/$fileName';
    final contentType = fileType == 'pdf' ? 'application/pdf' : 'application/msword';
    
    return await SupabaseService.uploadFile(
      bucketName: SupabaseConfig.profileImagesBucket,
      fileName: storagePath,
      fileBytes: resumeBytes,
      contentType: contentType,
    );
  }

  // Delete profile image
  static Future<bool> deleteProfileImage(String fileName) async {
    final storagePath = 'profile/$fileName';
    
    return await SupabaseService.deleteFile(
      bucketName: SupabaseConfig.profileImagesBucket,
      fileName: storagePath,
    );
  }

  // Delete resume file
  static Future<bool> deleteResume(String fileName) async {
    final storagePath = 'resume/$fileName';
    
    return await SupabaseService.deleteFile(
      bucketName: SupabaseConfig.profileImagesBucket,
      fileName: storagePath,
    );
  }
}
