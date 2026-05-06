import 'package:flutter/material.dart';
import 'package:mobile_dev_hakathon/core/route/routes.dart';
import 'package:mobile_dev_hakathon/feature/pharmacy_shifts/model/pharmacy_model.dart';
<<<<<<< HEAD
import 'package:mobile_dev_hakathon/feature/trainings/presentation/screens/application_form_screen.dart';
=======
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:latlong2/latlong.dart';
>>>>>>> 7e3a522efadd6697fa381efcecdfcd323076b326

class PharmacyDetailScreen extends StatelessWidget {
  final Pharmacy pharmacy;

  const PharmacyDetailScreen({super.key, required this.pharmacy});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(color: colorScheme.onSurface),
        title: Text(
          pharmacy.name,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
            color: colorScheme.onSurface,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              SharePlus.instance.share(
                ShareParams(text: 'صيدلية: ${pharmacy.name}\nالعنوان: ${pharmacy.address}\nتمت المشاركة من تطبيق الرعاية الطبية'),
              );
            },
            icon: Icon(Icons.share, color: colorScheme.onSurfaceVariant),
          ),
        ],
      ),
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isWide = constraints.maxWidth >= 720;
                final gridColumns = isWide ? 4 : 2;

                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Hero(
                            tag: 'pharmacy-image-${pharmacy.name}',
                            child: AspectRatio(
                              aspectRatio: 16 / 9,
                              child: Image.network(
                                pharmacy.imageUrl,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value:
                                              loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                        .cumulativeBytesLoaded /
                                                    loadingProgress
                                                        .expectedTotalBytes!
                                              : null,
                                          color: colorScheme.primary,
                                        ),
                                      );
                                    },
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: colorScheme.surfaceContainer,
                                    child: Center(
                                      child: Icon(
                                        Icons.local_pharmacy,
                                        size: 48,
                                        color: colorScheme.primary,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                            color: colorScheme.onPrimary,
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.05),
                                blurRadius: 24,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      pharmacy.name,
                                      style: theme.textTheme.headlineSmall
                                          ?.copyWith(
                                            fontWeight: FontWeight.w700,
                                            color: colorScheme.onSurface,
                                          ),
                                    ),
                                  ),
                                  if (pharmacy.isOnDuty)
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 6,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(
                                          0xFF10B981,
                                        ).withValues(alpha: 0.14),
                                        borderRadius: BorderRadius.circular(
                                          999,
                                        ),
                                      ),
                                      child: Text(
                                        'مفتوح الآن',
                                        style: theme.textTheme.labelSmall
                                            ?.copyWith(
                                              fontWeight: FontWeight.w700,
                                              color: const Color(0xFF10B981),
                                            ),
                                      ),
                                    ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 18,
                                    color: const Color(0xFFF59E0B),
                                  ),
                                  const SizedBox(width: 6),
                                  // Text(
                                  //   '${pharmacy.rating.toStringAsFixed(1)} (120+ تقييم)',
                                  //   style: theme.textTheme.bodyMedium?.copyWith(
                                  //     fontWeight: FontWeight.w600,
                                  //     color: colorScheme.onSurfaceVariant,
                                  //   ),
                                  // ),
                                ],
                              ),
                              const SizedBox(height: 18),
                              Wrap(
                                runSpacing: 12,
                                spacing: 12,
                                children: [
                                  _DetailActionButton(
                                    icon: Icons.location_on,
                                    label: 'الموقع',
                                    colorScheme: colorScheme,
                                    onTap: () {
                                      if (pharmacy.latitude != null &&
                                          pharmacy.longitude != null) {
                                        Navigator.pushNamed(
                                          context,
                                          Routes.mapScreen,
                                          arguments: {
                                            'location': LatLng(
                                              pharmacy.latitude!,
                                              pharmacy.longitude!,
                                            ),
                                            'pharmacyName': pharmacy.name,
                                          },
                                        );
                                      } else {
                                        // Fallback to external map if no coordinates
                                        launchUrl(
                                          Uri.parse(
                                            'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent("${pharmacy.name} ${pharmacy.address}")}',
                                          ),
                                          mode: LaunchMode.externalApplication,
                                        );
                                      }
                                    },
                                  ),
                                  _DetailActionButton(
                                    icon: Icons.share,
                                    label: 'مشاركة',
                                    colorScheme: colorScheme,
                                    onTap: () {
                                      SharePlus.instance.share(
                                        ShareParams(text: 'صيدلية: ${pharmacy.name}\nالعنوان: ${pharmacy.address}\nتمت المشاركة من تطبيق الرعاية الطبية'),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        _SectionCard(
                          title: 'أوقات العمل',
                          icon: Icons.schedule,
                          colorScheme: colorScheme,
                          theme: theme,
                          children: [
                            Text(
                              pharmacy.hours,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: colorScheme.onSurface,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              pharmacy.fridayHours,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: colorScheme.onSurface,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        _SectionCard(
                          title: 'الموقع',
                          icon: Icons.near_me,
                          colorScheme: colorScheme,
                          theme: theme,
                          children: [
                            Text(
                              pharmacy.address,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: colorScheme.onSurface,
                              ),
                            ),
                            const SizedBox(height: 12),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: AspectRatio(
                                aspectRatio: 16 / 9,
                                child: Image.network(
                                  pharmacy.mapImageUrl,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        }

                                        return Center(
                                          child: CircularProgressIndicator(
                                            value:
                                                loadingProgress
                                                        .expectedTotalBytes !=
                                                    null
                                                ? loadingProgress
                                                          .cumulativeBytesLoaded /
                                                      loadingProgress
                                                          .expectedTotalBytes!
                                                : null,
                                            color: colorScheme.primary,
                                          ),
                                        );
                                      },
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: colorScheme.surfaceContainer,
                                      child: Center(
                                        child: Icon(
                                          Icons.map,
                                          size: 40,
                                          color: colorScheme.primary,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        _SectionCard(
                          title: 'الخدمات المتاحة',
                          icon: Icons.medical_services,
                          colorScheme: colorScheme,
                          theme: theme,
                          children: [
                            GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: pharmacy.services.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: gridColumns,
                                    crossAxisSpacing: 12,
                                    mainAxisSpacing: 12,
                                    childAspectRatio: 0.95,
                                  ),
                              itemBuilder: (context, index) {
                                return _ServiceTile(
                                  label: pharmacy.services[index],
                                  colorScheme: colorScheme,
                                );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        _SectionCard(
                          title: 'عن الصيدلية',
                          icon: Icons.info,
                          colorScheme: colorScheme,
                          theme: theme,
                          children: [
                            Text(
                              pharmacy.description,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: colorScheme.onSurface,
                                height: 1.7,
                              ),
                            ),
                            const SizedBox(height: 16),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: AspectRatio(
                                aspectRatio: 16 / 9,
                                child: Image.network(
                                  pharmacy.imageUrl,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        }

                                        return Center(
                                          child: CircularProgressIndicator(
                                            value:
                                                loadingProgress
                                                        .expectedTotalBytes !=
                                                    null
                                                ? loadingProgress
                                                          .cumulativeBytesLoaded /
                                                      loadingProgress
                                                          .expectedTotalBytes!
                                                : null,
                                            color: colorScheme.primary,
                                          ),
                                        );
                                      },
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: colorScheme.surfaceContainer,
                                      child: Center(
                                        child: Icon(
                                          Icons.local_pharmacy,
                                          size: 40,
                                          color: colorScheme.primary,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 96),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: colorScheme.surface,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: colorScheme.primary,
            foregroundColor: colorScheme.onPrimary,
            minimumSize: const Size.fromHeight(56),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
<<<<<<< HEAD
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ApplicationFormScreen(),
              ),
            );
=======
          onPressed: () async {
            final Uri launchUri = Uri(
              scheme: 'tel',
              path: '+966500000000', // رقم افتراضي للتواصل
            );
            if (await canLaunchUrl(launchUri)) {
              await launchUrl(launchUri);
            }
>>>>>>> 7e3a522efadd6697fa381efcecdfcd323076b326
          },
          icon: const Icon(Icons.chat_bubble),
          label: const Text('تواصل'),
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Widget> children;
  final ColorScheme colorScheme;
  final ThemeData theme;

  const _SectionCard({
    required this.title,
    required this.icon,
    required this.children,
    required this.colorScheme,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.14)),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: colorScheme.primary),
              const SizedBox(width: 10),
              Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: colorScheme.onSurface,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }
}

class _DetailActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final ColorScheme colorScheme;
  final VoidCallback onTap;

  const _DetailActionButton({
    required this.icon,
    required this.label,
    required this.colorScheme,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        width: 148,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, color: colorScheme.primary, size: 24),
            const SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ServiceTile extends StatelessWidget {
  final String label;
  final ColorScheme colorScheme;

  const _ServiceTile({required this.label, required this.colorScheme});

  IconData _serviceIcon() {
    switch (label) {
      case 'توصيل منزلي':
        return Icons.delivery_dining;
      case 'دفع إلكتروني':
        return Icons.credit_card;
      case 'فحص سكري':
        return Icons.bloodtype;
      case 'قياس ضغط':
        return Icons.monitor_heart;
      default:
        return Icons.medical_services;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.16)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: colorScheme.primary.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(_serviceIcon(), color: colorScheme.primary, size: 28),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
