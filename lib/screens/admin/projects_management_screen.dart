import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../controllers/portfolio_controller.dart';
import '../../models/project.dart';
import '../../services/projects_service.dart';
import '../../services/supabase_service.dart';
import '../../theme/app_theme.dart';
import '../../config/supabase_config.dart';

class ProjectsManagementScreen extends StatefulWidget {
  const ProjectsManagementScreen({super.key});

  @override
  State<ProjectsManagementScreen> createState() =>
      _ProjectsManagementScreenState();
}

class _ProjectsManagementScreenState extends State<ProjectsManagementScreen> {
  final _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PortfolioController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Projects Management'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => controller.refreshProjects(),
          ),
        ],
      ),
      body: Column(
        children: [
          // Search and filter bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search projects...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value.toLowerCase();
                      });
                    },
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton.icon(
                  onPressed: () => _showProjectDialog(context),
                  icon: const Icon(Icons.add),
                  label: const Text('Add Project'),
                ),
              ],
            ),
          ),

          // Projects list
          Expanded(
            child: Obx(() {
              final projects = controller.projects
                  .where((p) =>
                      _searchQuery.isEmpty ||
                      p.title.toLowerCase().contains(_searchQuery) ||
                      p.description.toLowerCase().contains(_searchQuery))
                  .toList();

              if (projects.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.work_off,
                        size: 64,
                        color: AppTheme.textSecondary.withValues(alpha: 0.5),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        _searchQuery.isEmpty
                            ? 'No projects yet'
                            : 'No projects found',
                        style: AppTheme.bodyLarge,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: () => _showProjectDialog(context),
                        icon: const Icon(Icons.add),
                        label: const Text('Add Your First Project'),
                      ),
                    ],
                  ),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  final project = projects[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ExpansionTile(
                      leading: CircleAvatar(
                        backgroundColor: project.isFeatured
                            ? Colors.amber
                            : AppTheme.accentColor,
                        child: Icon(
                          project.isFeatured ? Icons.star : Icons.work,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(project.title),
                      subtitle: Text(
                        project.shortDescription,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () => _showProjectDialog(
                              context,
                              project: project,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _confirmDelete(context, project),
                          ),
                        ],
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Description:',
                                style: AppTheme.bodyMedium
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              Text(project.description),
                              const SizedBox(height: 16),
                              Text(
                                'Technologies:',
                                style: AppTheme.bodyMedium
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: project.technologies
                                    .map((tech) => Chip(label: Text(tech)))
                                    .toList(),
                              ),
                              if (project.githubUrl != null ||
                                  project.liveUrl != null) ...[
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    if (project.githubUrl != null)
                                      TextButton.icon(
                                        onPressed: () {},
                                        icon: const Icon(Icons.code),
                                        label: const Text('GitHub'),
                                      ),
                                    if (project.liveUrl != null)
                                      TextButton.icon(
                                        onPressed: () {},
                                        icon: const Icon(Icons.link),
                                        label: const Text('Live Demo'),
                                      ),
                                  ],
                                ),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  void _showProjectDialog(BuildContext context, {Project? project}) {
    showDialog(
      context: context,
      builder: (context) => ProjectFormDialog(project: project),
    );
  }

  void _confirmDelete(BuildContext context, Project project) {
    Get.dialog(
      AlertDialog(
        title: const Text('Delete Project'),
        content: Text(
          'Are you sure you want to delete "${project.title}"? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              Get.back();
              await _deleteProject(project);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  Future<void> _deleteProject(Project project) async {
    try {
      // Show loading
      Get.dialog(
        const Center(child: CircularProgressIndicator()),
        barrierDismissible: false,
      );

      // Delete from Supabase
      await ProjectsService.deleteProject(project.id);

      // Refresh data
      await Get.find<PortfolioController>().refreshProjects();

      Get.back(); // Close loading

      Get.snackbar(
        'Success',
        'Project deleted successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.back(); // Close loading
      Get.snackbar(
        'Error',
        'Failed to delete project: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}

class ProjectFormDialog extends StatefulWidget {
  final Project? project;

  const ProjectFormDialog({super.key, this.project});

  @override
  State<ProjectFormDialog> createState() => _ProjectFormDialogState();
}

class _ProjectFormDialogState extends State<ProjectFormDialog> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _shortDescController;
  late TextEditingController _descController;
  late TextEditingController _githubController;
  late TextEditingController _liveController;
  late TextEditingController _techController;
  List<String> _technologies = [];
  bool _isFeatured = false;
  bool _isLoading = false;
  String? _imageUrl;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.project?.title ?? '');
    _shortDescController =
        TextEditingController(text: widget.project?.shortDescription ?? '');
    _descController =
        TextEditingController(text: widget.project?.description ?? '');
    _githubController =
        TextEditingController(text: widget.project?.githubUrl ?? '');
    _liveController =
        TextEditingController(text: widget.project?.liveUrl ?? '');
    _techController = TextEditingController();
    _technologies = widget.project?.technologies ?? [];
    _isFeatured = widget.project?.isFeatured ?? false;
    _imageUrl = widget.project?.imageUrl;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _shortDescController.dispose();
    _descController.dispose();
    _githubController.dispose();
    _liveController.dispose();
    _techController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.project == null ? 'Add Project' : 'Edit Project'),
      content: SizedBox(
        width: 600,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Title
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    labelText: 'Title *',
                    hintText: 'E-commerce App',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Short description
                TextFormField(
                  controller: _shortDescController,
                  decoration: const InputDecoration(
                    labelText: 'Short Description *',
                    hintText: 'A modern e-commerce application...',
                  ),
                  maxLines: 2,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a short description';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Full description
                TextFormField(
                  controller: _descController,
                  decoration: const InputDecoration(
                    labelText: 'Full Description *',
                    hintText: 'Detailed project description...',
                  ),
                  maxLines: 4,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a full description';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Technologies
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Technologies *'),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _techController,
                            decoration: const InputDecoration(
                              hintText: 'Enter technology and press Add',
                            ),
                            onSubmitted: (_) => _addTechnology(),
                          ),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: _addTechnology,
                          child: const Text('Add'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: _technologies
                          .map(
                            (tech) => Chip(
                              label: Text(tech),
                              onDeleted: () {
                                setState(() {
                                  _technologies.remove(tech);
                                });
                              },
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // GitHub URL
                TextFormField(
                  controller: _githubController,
                  decoration: const InputDecoration(
                    labelText: 'GitHub URL',
                    hintText: 'https://github.com/username/repo',
                    prefixIcon: Icon(Icons.code),
                  ),
                ),
                const SizedBox(height: 16),

                // Live URL
                TextFormField(
                  controller: _liveController,
                  decoration: const InputDecoration(
                    labelText: 'Live Demo URL',
                    hintText: 'https://example.com',
                    prefixIcon: Icon(Icons.link),
                  ),
                ),
                const SizedBox(height: 16),

                // Featured toggle
                SwitchListTile(
                  title: const Text('Featured Project'),
                  subtitle:
                      const Text('Show this project prominently on homepage'),
                  value: _isFeatured,
                  onChanged: (value) {
                    setState(() {
                      _isFeatured = value;
                    });
                  },
                ),
                const SizedBox(height: 16),

                // Image upload
                OutlinedButton.icon(
                  onPressed: _pickImage,
                  icon: const Icon(Icons.upload),
                  label: Text(_imageUrl != null
                      ? 'Change Image'
                      : 'Upload Project Image'),
                ),
                if (_imageUrl != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    'Image uploaded ✓',
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _isLoading ? null : () => Get.back(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _isLoading ? null : _saveProject,
          child: _isLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('Save'),
        ),
      ],
    );
  }

  void _addTechnology() {
    final tech = _techController.text.trim();
    if (tech.isNotEmpty && !_technologies.contains(tech)) {
      setState(() {
        _technologies.add(tech);
        _techController.clear();
      });
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() => _isLoading = true);

      try {
        final bytes = await image.readAsBytes();
        final fileName =
            'projects/${DateTime.now().millisecondsSinceEpoch}_${image.name}';

        final url = await SupabaseService.uploadFile(
          bucketName: SupabaseConfig.projectImagesBucket,
          fileName: fileName,
          fileBytes: bytes,
          contentType: 'image/${image.name.split('.').last}',
        );

        if (url != null) {
          setState(() {
            _imageUrl = url;
            _isLoading = false;
          });

          Get.snackbar(
            'Success',
            'Image uploaded successfully',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
        }
      } catch (e) {
        setState(() => _isLoading = false);
        Get.snackbar(
          'Error',
          'Failed to upload image: $e',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
  }

  Future<void> _saveProject() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_technologies.isEmpty) {
      Get.snackbar(
        'Validation Error',
        'Please add at least one technology',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final project = Project(
        id: widget.project?.id ??
            'project_${DateTime.now().millisecondsSinceEpoch}',
        title: _titleController.text.trim(),
        shortDescription: _shortDescController.text.trim(),
        description: _descController.text.trim(),
        technologies: _technologies,
        githubUrl: _githubController.text.trim().isEmpty
            ? null
            : _githubController.text.trim(),
        liveUrl: _liveController.text.trim().isEmpty
            ? null
            : _liveController.text.trim(),
        imageUrl: _imageUrl,
        isFeatured: _isFeatured,
        createdAt: widget.project?.createdAt ?? DateTime.now(),
      );

      if (widget.project == null) {
        // Create new project
        await ProjectsService.createProject(project);
      } else {
        // Update existing project
        await ProjectsService.updateProject(project);
      }

      // Refresh projects
      await Get.find<PortfolioController>().refreshProjects();

      Get.back(); // Close dialog

      Get.snackbar(
        'Success',
        widget.project == null
            ? 'Project created successfully'
            : 'Project updated successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      setState(() => _isLoading = false);
      Get.snackbar(
        'Error',
        'Failed to save project: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
