import 'package:flutter/foundation.dart';
import '../services/supabase_service.dart';

class SupabaseTest {
  static Future<void> testConnection() async {
    try {
      // Test basic connection
      final client = SupabaseService.client;
      debugPrint('✅ Supabase client initialized successfully');
      
      // Test database connection by checking if we can query a simple table
      try {
        await client.from('personal_info').select('id').limit(1);
        debugPrint('✅ Database connection successful');
      } catch (e) {
        debugPrint('❌ Database tables not created yet: $e');
        debugPrint('💡 Please run the database_schema.sql in Supabase dashboard');
      }
      
      // Test storage connection
      try {
        final buckets = await client.storage.listBuckets();
        debugPrint('✅ Storage connection successful. Buckets: ${buckets.map((b) => b.name).join(', ')}');
        
        // Check if required buckets exist
        final requiredBuckets = ['project-images', 'certificate-images', 'profile-images'];
        final existingBuckets = buckets.map((b) => b.name).toSet();
        
        for (final bucket in requiredBuckets) {
          if (existingBuckets.contains(bucket)) {
            debugPrint('✅ Bucket "$bucket" exists');
          } else {
            debugPrint('❌ Bucket "$bucket" missing - please create it in Supabase dashboard');
          }
        }
      } catch (e) {
        debugPrint('❌ Storage connection failed: $e');
      }
      
    } catch (e) {
      debugPrint('❌ Supabase connection failed: $e');
      debugPrint('💡 Check your URL and API key in supabase_config.dart');
    }
  }
}
