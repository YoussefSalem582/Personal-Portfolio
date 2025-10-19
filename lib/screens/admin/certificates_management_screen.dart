import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/portfolio_controller.dart';
import '../../models/certificate.dart';
import '../../services/certificates_service.dart';
import '../../theme/app_theme.dart';

class CertificatesManagementScreen extends StatefulWidget {
  const CertificatesManagementScreen({super.key});

  @override
  State<CertificatesManagementScreen> createState() =>
      _CertificatesManagementScreenState();
}

class _CertificatesManagementScreenState
    extends State<CertificatesManagementScreen> {
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
        title: const Text('Certificates Management'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => controller.refreshCertificates(),
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
                      hintText: 'Search certificates...',
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
                  onPressed: () => _showCertificateDialog(context),
                  icon: const Icon(Icons.add),
                  label: const Text('Add Certificate'),
                ),
              ],
            ),
          ),

          // Certificates list
          Expanded(
            child: Obx(() {
              final certificates = controller.certificates
                  .where((c) =>
                      _searchQuery.isEmpty ||
                      c.title.toLowerCase().contains(_searchQuery) ||
                      c.issuer.toLowerCase().contains(_searchQuery))
                  .toList();

              if (certificates.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.card_membership_outlined,
                        size: 64,
                        color: AppTheme.textSecondary.withValues(alpha: 0.5),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        _searchQuery.isEmpty
                            ? 'No certificates yet'
                            : 'No certificates found',
                        style: AppTheme.bodyLarge,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: () => _showCertificateDialog(context),
                        icon: const Icon(Icons.add),
                        label: const Text('Add Your First Certificate'),
                      ),
                    ],
                  ),
                );
              }

              return GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      MediaQuery.of(context).size.width > 900 ? 3 : 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                itemCount: certificates.length,
                itemBuilder: (context, index) {
                  final certificate = certificates[index];
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Certificate header
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            gradient: AppTheme.primaryGradient,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            ),
                          ),
                          child: Icon(
                            Icons.card_membership,
                            size: 48,
                            color: Colors.white,
                          ),
                        ),

                        // Certificate details
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  certificate.title,
                                  style: AppTheme.bodyMedium
                                      .copyWith(fontWeight: FontWeight.bold),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  certificate.issuer,
                                  style: AppTheme.bodySmall,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const Spacer(),
                                Text(
                                  'Issued: ${certificate.issueDate.year}',
                                  style: AppTheme.bodySmall.copyWith(
                                    color: AppTheme.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Actions
                        const Divider(height: 1),
                        Row(
                          children: [
                            Expanded(
                              child: TextButton.icon(
                                onPressed: () => _showCertificateDialog(
                                  context,
                                  certificate: certificate,
                                ),
                                icon: const Icon(Icons.edit, size: 16),
                                label: const Text('Edit'),
                              ),
                            ),
                            Container(
                                width: 1,
                                height: 40,
                                color: Colors.grey.shade300),
                            Expanded(
                              child: TextButton.icon(
                                onPressed: () =>
                                    _confirmDelete(context, certificate),
                                icon: const Icon(Icons.delete,
                                    size: 16, color: Colors.red),
                                label: const Text('Delete',
                                    style: TextStyle(color: Colors.red)),
                              ),
                            ),
                          ],
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

  void _showCertificateDialog(BuildContext context,
      {Certificate? certificate}) {
    showDialog(
      context: context,
      builder: (context) => CertificateFormDialog(certificate: certificate),
    );
  }

  void _confirmDelete(BuildContext context, Certificate certificate) {
    Get.dialog(
      AlertDialog(
        title: const Text('Delete Certificate'),
        content: Text(
          'Are you sure you want to delete "${certificate.title}"? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              Get.back();
              await _deleteCertificate(certificate);
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

  Future<void> _deleteCertificate(Certificate certificate) async {
    try {
      // Show loading
      Get.dialog(
        const Center(child: CircularProgressIndicator()),
        barrierDismissible: false,
      );

      // Delete from Supabase
      await CertificatesService.deleteCertificate(certificate.id);

      // Refresh data
      await Get.find<PortfolioController>().refreshCertificates();

      Get.back(); // Close loading

      Get.snackbar(
        'Success',
        'Certificate deleted successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.back(); // Close loading
      Get.snackbar(
        'Error',
        'Failed to delete certificate: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}

class CertificateFormDialog extends StatefulWidget {
  final Certificate? certificate;

  const CertificateFormDialog({super.key, this.certificate});

  @override
  State<CertificateFormDialog> createState() => _CertificateFormDialogState();
}

class _CertificateFormDialogState extends State<CertificateFormDialog> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _issuerController;
  late TextEditingController _descController;
  late TextEditingController _urlController;
  DateTime? _issueDate;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _titleController =
        TextEditingController(text: widget.certificate?.title ?? '');
    _issuerController =
        TextEditingController(text: widget.certificate?.issuer ?? '');
    _descController =
        TextEditingController(text: widget.certificate?.description ?? '');
    _urlController =
        TextEditingController(text: widget.certificate?.credentialUrl ?? '');
    _issueDate = widget.certificate?.issueDate;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _issuerController.dispose();
    _descController.dispose();
    _urlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
          widget.certificate == null ? 'Add Certificate' : 'Edit Certificate'),
      content: SizedBox(
        width: 500,
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
                    labelText: 'Certificate Title *',
                    hintText: 'Flutter Development Certificate',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Issuer
                TextFormField(
                  controller: _issuerController,
                  decoration: const InputDecoration(
                    labelText: 'Issuer *',
                    hintText: 'Google, Coursera, etc.',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the issuer';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Description
                TextFormField(
                  controller: _descController,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    hintText: 'Brief description of the certificate...',
                  ),
                  maxLines: 3,
                ),
                const SizedBox(height: 16),

                // Issue date
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Issue Date'),
                  subtitle: Text(_issueDate != null
                      ? '${_issueDate!.year}-${_issueDate!.month.toString().padLeft(2, '0')}-${_issueDate!.day.toString().padLeft(2, '0')}'
                      : 'Not set'),
                  trailing: const Icon(Icons.calendar_today),
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: _issueDate ?? DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime.now(),
                    );
                    if (date != null) {
                      setState(() {
                        _issueDate = date;
                      });
                    }
                  },
                ),
                const SizedBox(height: 16),

                // Credential URL
                TextFormField(
                  controller: _urlController,
                  decoration: const InputDecoration(
                    labelText: 'Credential URL',
                    hintText: 'https://...',
                    prefixIcon: Icon(Icons.link),
                  ),
                ),
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
          onPressed: _isLoading ? null : _saveCertificate,
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

  Future<void> _saveCertificate() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_issueDate == null) {
      Get.snackbar(
        'Validation Error',
        'Please select an issue date',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final certificate = Certificate(
        id: widget.certificate?.id ??
            'cert_${DateTime.now().millisecondsSinceEpoch}',
        title: _titleController.text.trim(),
        issuer: _issuerController.text.trim(),
        description: _descController.text.trim().isEmpty
            ? 'No description provided'
            : _descController.text.trim(),
        issueDate: _issueDate!,
        credentialUrl: _urlController.text.trim().isEmpty
            ? null
            : _urlController.text.trim(),
      );

      if (widget.certificate == null) {
        // Create new certificate
        await CertificatesService.createCertificate(certificate);
      } else {
        // Update existing certificate
        await CertificatesService.updateCertificate(certificate);
      }

      // Refresh certificates
      await Get.find<PortfolioController>().refreshCertificates();

      Get.back(); // Close dialog

      Get.snackbar(
        'Success',
        widget.certificate == null
            ? 'Certificate created successfully'
            : 'Certificate updated successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      setState(() => _isLoading = false);
      Get.snackbar(
        'Error',
        'Failed to save certificate: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
