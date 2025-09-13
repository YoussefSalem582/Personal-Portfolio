import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/project.dart';
import '../config/supabase_config.dart';
import 'supabase_service.dart';

class ProjectsService {
  static const String tableName = 'projects';
  static SupabaseClient get _client => SupabaseService.client;

  // Fetch all projects from Supabase
  static Future<List<Project>> getAllProjects() async {
    try {
      final response = await _client
          .from(tableName)
          .select()
          .order('created_at', ascending: false);

      return (response as List)
          .map((json) => Project.fromJson(json))
          .toList();
    } catch (e) {
      print('Error fetching projects: $e');
      return [];
    }
  }

  // Fetch a single project by ID
  static Future<Project?> getProjectById(String id) async {
    try {
      final response = await _client
          .from(tableName)
          .select()
          .eq('id', id)
          .single();

      return Project.fromJson(response);
    } catch (e) {
      print('Error fetching project: $e');
      return null;
    }
  }

  // Create a new project
  static Future<Project?> createProject(Project project) async {
    try {
      final response = await _client
          .from(tableName)
          .insert(project.toJson())
          .select()
          .single();

      return Project.fromJson(response);
    } catch (e) {
      print('Error creating project: $e');
      return null;
    }
  }

  // Update an existing project
  static Future<Project?> updateProject(Project project) async {
    try {
      final response = await _client
          .from(tableName)
          .update(project.toJson())
          .eq('id', project.id)
          .select()
          .single();

      return Project.fromJson(response);
    } catch (e) {
      print('Error updating project: $e');
      return null;
    }
  }

  // Delete a project
  static Future<bool> deleteProject(String id) async {
    try {
      await _client
          .from(tableName)
          .delete()
          .eq('id', id);
      return true;
    } catch (e) {
      print('Error deleting project: $e');
      return false;
    }
  }

  // Upload project image
  static Future<String?> uploadProjectImage({
    required String projectId,
    required List<int> imageBytes,
    required String fileName,
    String? contentType,
  }) async {
    final storagePath = 'projects/$projectId/$fileName';
    
    return await SupabaseService.uploadFile(
      bucketName: SupabaseConfig.projectImagesBucket,
      fileName: storagePath,
      fileBytes: imageBytes,
      contentType: contentType,
    );
  }

  // Upload multiple gallery images for a project
  static Future<List<String>> uploadProjectGallery({
    required String projectId,
    required List<Map<String, dynamic>> images, // {bytes: List<int>, fileName: String, contentType: String?}
  }) async {
    final List<String> uploadedUrls = [];
    
    for (final image in images) {
      final url = await uploadProjectImage(
        projectId: projectId,
        imageBytes: image['bytes'],
        fileName: image['fileName'],
        contentType: image['contentType'],
      );
      
      if (url != null) {
        uploadedUrls.add(url);
      }
    }
    
    return uploadedUrls;
  }

  // Delete project image
  static Future<bool> deleteProjectImage({
    required String projectId,
    required String fileName,
  }) async {
    final storagePath = 'projects/$projectId/$fileName';
    
    return await SupabaseService.deleteFile(
      bucketName: SupabaseConfig.projectImagesBucket,
      fileName: storagePath,
    );
  }
}
