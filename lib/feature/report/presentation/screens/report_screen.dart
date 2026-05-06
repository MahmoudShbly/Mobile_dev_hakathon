import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final TextEditingController _descriptionController = TextEditingController();
  final ImagePicker _imagePicker = ImagePicker();
  String _selectedEntity = 'صيدلية';
  String _selectedIssue = 'تسعير غير منطقي / مخالف';
  String? _selectedHospital;
  XFile? _selectedImage;

  final List<String> _entities = ['صيدلية', 'مستشفى'];

  // قائمة المشاكل للصيدليات
  final List<String> _pharmacyIssues = [
    'تسعير غير منطقي / مخالف',
    'دواء فاسد',
    'الخدمة غير جيدة',
    'عدم احترام المواعيد',
    'أخرى',
  ];

  // قائمة المشاكل للمستشفيات
  final List<String> _hospitalIssues = [
    'الخدمة الطبية غير جيدة',
    'تأخير العمليات الجراحية',
    'عدم نظافة المستشفى',
    'سوء معاملة الطاقم الطبي',
    'مشاكل في الفواتير والتأمين',
    'عدم توفر الأدوية والمعدات',
    'عدم احترام الخصوصية',
    'أخرى',
  ];

  // قائمة المستشفيات
  final List<String> _hospitals = [
    'مستشفى الملك فهد التخصصي',
    'مستشفى الحرس الوطني',
    'عيادات النخبة الطبية',
    'مركز الأمل الطبي',
    'مستشفى الرحمة',
    'مستشفى الجامعة',
    'عيادات الأمان الطبية',
    'أخرى',
  ];

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  List<String> get _issues =>
      _selectedEntity == 'مستشفى' ? _hospitalIssues : _pharmacyIssues;

  void _submitReport() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('تم إرسال البلاغ بنجاح')));
    _descriptionController.clear();
    setState(() {
      _selectedEntity = 'صيدلية';
      _selectedIssue = _pharmacyIssues.first;
      _selectedHospital = null;
      _selectedImage = null;
    });
  }

  Future<void> _pickReportImage() async {
    final image = await _imagePicker.pickImage(source: ImageSource.gallery);

    if (image == null) {
      return;
    }

    setState(() {
      _selectedImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,

        title: Text(
          'تقديم بلاغ',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: colorScheme.onPrimary.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        color: colorScheme.primary.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Icon(
                        Icons.report_problem,
                        size: 28,
                        color: colorScheme.primary,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'بلاغك يساعدنا على تحسين الخدمة',
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: colorScheme.onSurface,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'يرجى تقديم تفاصيل البلاغ حتى نتمكن من معالجة المشكلة بسرعة.',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'نوع الجهة المبلغ عنها',
                style: theme.textTheme.labelMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: colorScheme.outline),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedEntity,
                    isExpanded: true,
                    icon: Icon(
                      Icons.expand_more,
                      color: colorScheme.onSurfaceVariant,
                    ),
                    items: _entities
                        .map(
                          (entity) => DropdownMenuItem(
                            value: entity,
                            child: Text(entity),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          _selectedEntity = value;
                          _selectedIssue = value == 'مستشفى'
                              ? _hospitalIssues.first
                              : _pharmacyIssues.first;
                          _selectedHospital = value == 'مستشفى'
                              ? _hospitals.first
                              : null;
                        });
                      }
                    },
                  ),
                ),
              ),
              if (_selectedEntity == 'مستشفى') ...[
                const SizedBox(height: 20),
                Text(
                  'اختيار المستشفى',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: colorScheme.outline),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _selectedHospital,
                      hint: const Text('اختر مستشفى'),
                      isExpanded: true,
                      icon: Icon(
                        Icons.expand_more,
                        color: colorScheme.onSurfaceVariant,
                      ),
                      items: _hospitals
                          .map(
                            (hospital) => DropdownMenuItem(
                              value: hospital,
                              child: Text(hospital),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            _selectedHospital = value;
                          });
                        }
                      },
                    ),
                  ),
                ),
              ],
              const SizedBox(height: 20),
              Text(
                'نوع المشكلة',
                style: theme.textTheme.labelMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: colorScheme.outline),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedIssue,
                    isExpanded: true,
                    icon: Icon(
                      Icons.expand_more,
                      color: colorScheme.onSurfaceVariant,
                    ),
                    items: _issues
                        .map(
                          (issue) => DropdownMenuItem(
                            value: issue,
                            child: Text(issue),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          _selectedIssue = value;
                        });
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'شرح تفصيلي للبلاغ',
                style: theme.textTheme.labelMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _descriptionController,
                maxLines: 5,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: colorScheme.surface,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: colorScheme.outline),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: colorScheme.primary,
                      width: 1.5,
                    ),
                  ),
                  hintText: 'يرجى كتابة تفاصيل ما حدث...',
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: colorScheme.outline),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'إرفاق صورة (صورة واحدة فقط)',
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton.icon(
                      onPressed: _pickReportImage,
                      icon: const Icon(Icons.add_a_photo),
                      label: const Text('رفع صورة البلاغ'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorScheme.primaryContainer,
                        foregroundColor: colorScheme.onPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        minimumSize: const Size.fromHeight(52),
                      ),
                    ),
                    if (_selectedImage != null) ...[
                      const SizedBox(height: 12),
                      Text(
                        'تم اختيار الصورة: ${_selectedImage!.name}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _submitReport,
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  foregroundColor: colorScheme.onPrimary,
                  minimumSize: const Size.fromHeight(56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'إرسال البلاغ',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: colorScheme.onPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
