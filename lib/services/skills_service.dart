import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/skill.dart';
import 'supabase_service.dart';

class SkillsService {
  static const String categoriesTableName = 'skill_categories';
  static const String skillsTableName = 'skills';
  static SupabaseClient get _client => SupabaseService.client;

  // Fetch all skill categories with their skills
  static Future<List<SkillCategory>> getAllSkillCategories() async {
    try {
      final categoriesResponse = await _client
          .from(categoriesTableName)
          .select()
          .order('order_index', ascending: true);

      final skillsResponse = await _client
          .from(skillsTableName)
          .select()
          .order('proficiency', ascending: false);

      final categories = <SkillCategory>[];
      
      for (final categoryJson in categoriesResponse) {
        final categorySkills = (skillsResponse as List)
            .where((skill) => skill['category_id'] == categoryJson['id'])
            .map((skillJson) => Skill.fromJson(skillJson))
            .toList();

        categories.add(SkillCategory.fromJson({
          ...categoryJson,
          'skills': categorySkills.map((s) => s.toJson()).toList(),
        }));
      }

      return categories;
    } catch (e) {
      print('Error fetching skill categories: $e');
      return [];
    }
  }

  // Create a new skill category
  static Future<SkillCategory?> createSkillCategory({
    required String name,
    required String icon,
    String? description,
    int? orderIndex,
  }) async {
    try {
      final response = await _client
          .from(categoriesTableName)
          .insert({
            'name': name,
            'icon': icon,
            'description': description,
            'order_index': orderIndex ?? 0,
          })
          .select()
          .single();

      return SkillCategory.fromJson({...response, 'skills': []});
    } catch (e) {
      print('Error creating skill category: $e');
      return null;
    }
  }

  // Create a new skill
  static Future<Skill?> createSkill({
    required String categoryId,
    required String name,
    required int proficiency,
    String? description,
  }) async {
    try {
      final response = await _client
          .from(skillsTableName)
          .insert({
            'category_id': categoryId,
            'name': name,
            'proficiency': proficiency,
            'description': description,
          })
          .select()
          .single();

      return Skill.fromJson(response);
    } catch (e) {
      print('Error creating skill: $e');
      return null;
    }
  }

  // Update skill proficiency
  static Future<bool> updateSkillProficiency({
    required String skillId,
    required int proficiency,
  }) async {
    try {
      await _client
          .from(skillsTableName)
          .update({'proficiency': proficiency})
          .eq('id', skillId);
      return true;
    } catch (e) {
      print('Error updating skill proficiency: $e');
      return false;
    }
  }

  // Delete a skill
  static Future<bool> deleteSkill(String skillId) async {
    try {
      await _client
          .from(skillsTableName)
          .delete()
          .eq('id', skillId);
      return true;
    } catch (e) {
      print('Error deleting skill: $e');
      return false;
    }
  }

  // Delete a skill category (and all its skills)
  static Future<bool> deleteSkillCategory(String categoryId) async {
    try {
      // First delete all skills in this category
      await _client
          .from(skillsTableName)
          .delete()
          .eq('category_id', categoryId);

      // Then delete the category
      await _client
          .from(categoriesTableName)
          .delete()
          .eq('id', categoryId);
      
      return true;
    } catch (e) {
      print('Error deleting skill category: $e');
      return false;
    }
  }
}
