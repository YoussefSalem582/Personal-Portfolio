import 'dart:typed_data';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../config/supabase_config.dart';

class SupabaseService {
  static SupabaseClient get client => Supabase.instance.client;

  static Future<void> initialize() async {
    await Supabase.initialize(
      url: SupabaseConfig.supabaseUrl,
      anonKey: SupabaseConfig.supabaseAnonKey,
    );
  }

  // Generic method to upload files to Supabase Storage
  static Future<String?> uploadFile({
    required String bucketName,
    required String fileName,
    required List<int> fileBytes,
    String? contentType,
  }) async {
    try {
      final response = await client.storage
          .from(bucketName)
          .uploadBinary(fileName, Uint8List.fromList(fileBytes),
              fileOptions: FileOptions(
                contentType: contentType,
                upsert: true,
              ));

      if (response.isNotEmpty) {
        // Get the public URL for the uploaded file
        final publicUrl =
            client.storage.from(bucketName).getPublicUrl(fileName);

        return publicUrl;
      }
      return null;
    } catch (e) {
      print('Error uploading file: $e');
      return null;
    }
  }

  // Generic method to delete files from Supabase Storage
  static Future<bool> deleteFile({
    required String bucketName,
    required String fileName,
  }) async {
    try {
      await client.storage.from(bucketName).remove([fileName]);
      return true;
    } catch (e) {
      print('Error deleting file: $e');
      return false;
    }
  }
}
