import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

// تم التحقق من المكتبات وجاري تحديث الخريطة...

class MapScreen extends StatefulWidget {
  final LatLng? initialLocation;
  final String? targetPharmacyName;

  const MapScreen({super.key, this.initialLocation, this.targetPharmacyName});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController _mapController = MapController();
  bool _showPharmacies = true;
  late LatLng _currentLocation;

  // بيانات وهمية للصيدليات المناوبة
  final List<Map<String, dynamic>> _mockPharmacies = [
    {
      'name': 'صيدلية النور',
      'location': const LatLng(33.515, 36.280),
      'address': 'شارع بغداد',
      'status': 'مناوبة',
      'phone': '+963114455667',
    },
    {
      'name': 'صيدلية الشفاء',
      'location': const LatLng(33.510, 36.270),
      'address': 'حي الميدان',
      'status': 'مناوبة',
      'phone': '+963112233445',
    },
    {
      'name': 'صيدلية الأمل',
      'location': const LatLng(33.520, 36.285),
      'address': 'مشروع دمر',
      'status': 'مناوبة',
      'phone': '+963119988776',
    },
  ];

  // بيانات وهمية للمستشفيات
  final List<Map<String, dynamic>> _mockHospitals = [
    {
      'name': 'مشفى المواساة',
      'location': const LatLng(33.518, 36.265),
      'services': 'إسعاف، جراحة، عناية مشددة',
      'address': 'المزة',
      'phone': '+963112133445',
    },
    {
      'name': 'مشفى الشامي',
      'location': const LatLng(33.512, 36.255),
      'services': 'قلبية، أشعة، مختبرات',
      'address': 'المزة - أوتوستراد',
      'phone': '+963116677889',
    },
    {
      'name': 'مشفى المجتهد',
      'location': const LatLng(33.505, 36.285),
      'services': 'عام، نسائية، أطفال',
      'address': 'البرامكة',
      'phone': '+963112211000',
    },
  ];

  @override
  void initState() {
    super.initState();
    _currentLocation = widget.initialLocation ?? const LatLng(33.5138, 36.2765);
    _determinePosition();
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return;
    }
    
    if (permission == LocationPermission.deniedForever) return; 

    Position position = await Geolocator.getCurrentPosition();
    if (mounted && widget.initialLocation == null) {
      setState(() {
        _currentLocation = LatLng(position.latitude, position.longitude);
        _mapController.move(_currentLocation, 14);
      });
    }
  }

  void _showDetails(Map<String, dynamic> data, bool isHospital) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(24.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                  Text(
                    data['name'],
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF00408B),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _buildDetailItem(Icons.location_on_outlined, 'العنوان: ${data['address']}'),
              const SizedBox(height: 12),
              if (isHospital)
                _buildDetailItem(Icons.medical_services_outlined, 'الخدمات: ${data['services']}')
              else
                _buildDetailItem(Icons.access_time, 'الحالة: ${data['status']}'),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () async {
                  final phone = data['phone'];
                  if (phone != null) {
                    final Uri launchUri = Uri(
                      scheme: 'tel',
                      path: phone,
                    );
                    if (await canLaunchUrl(launchUri)) {
                      await launchUrl(launchUri);
                    } else {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('لا يمكن إجراء المكالمة حالياً')),
                        );
                      }
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00408B),
                  minimumSize: Size(double.infinity, 54.h),
                  elevation: 4,
                  shadowColor: const Color(0xFF00408B).withValues(alpha: 0.4),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                ),
                child: Text('الاتصال الآن', style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w600)),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDetailItem(IconData icon, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(text, style: TextStyle(fontSize: 14.sp, color: const Color(0xFF545F73))),
        const SizedBox(width: 8),
        Icon(icon, size: 20.sp, color: const Color(0xFF0057B8)),
      ],
    );
  }

  Widget _buildProfessionalMarker(IconData icon, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.3),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Center(
        child: Icon(icon, color: color, size: 30.sp),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final markers = <Marker>[];
    
    // إضافة الصيدليات أو المستشفيات الوهمية
    if (_showPharmacies) {
      markers.addAll(_mockPharmacies.map((p) => Marker(
            point: p['location'],
            width: 60.w,
            height: 60.w,
            child: GestureDetector(
              onTap: () => _showDetails(p, false),
              child: _buildProfessionalMarker(Icons.local_pharmacy, Colors.green),
            ),
          )));
    } else {
      markers.addAll(_mockHospitals.map((h) => Marker(
            point: h['location'],
            width: 60.w,
            height: 60.w,
            child: GestureDetector(
              onTap: () => _showDetails(h, true),
              child: _buildProfessionalMarker(Icons.local_hospital, Colors.red),
            ),
          )));
    }

    // إضافة علامة للصيدلية المستهدفة إذا تم تمريرها
    if (widget.initialLocation != null && widget.targetPharmacyName != null) {
      markers.add(Marker(
        point: widget.initialLocation!,
        width: 70.w,
        height: 70.w,
        child: GestureDetector(
          onTap: () => _showDetails({
            'name': widget.targetPharmacyName,
            'address': 'موقع الصيدلية المحدد',
            'status': 'مفتوح',
          }, false),
          child: _buildProfessionalMarker(Icons.location_on, Colors.blue),
        ),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('الخريطة الطبية'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: _currentLocation,
              initialZoom: 14,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://{s}.basemaps.cartocdn.com/rastertiles/voyager/{z}/{x}/{y}{r}.png',
                subdomains: const ['a', 'b', 'c', 'd'],
                userAgentPackageName: 'com.hakk.hack.medical_app',
              ),
              MarkerLayer(markers: markers),
              MarkerLayer(
                markers: [
                  Marker(
                    point: _currentLocation,
                    child: const Icon(Icons.my_location, color: Colors.blue, size: 30),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 20.h,
            left: 24.w,
            right: 24.w,
            child: Container(
              padding: EdgeInsets.all(6.w),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.9),
                borderRadius: BorderRadius.circular(30.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  )
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _showPharmacies = true),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        decoration: BoxDecoration(
                          color: _showPharmacies ? const Color(0xFF00408B) : Colors.transparent,
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                        child: Center(
                          child: Text(
                            'صيدليات',
                            style: TextStyle(
                              color: _showPharmacies ? Colors.white : const Color(0xFF545F73),
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _showPharmacies = false),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        decoration: BoxDecoration(
                          color: !_showPharmacies ? const Color(0xFF00408B) : Colors.transparent,
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                        child: Center(
                          child: Text(
                            'مستشفيات',
                            style: TextStyle(
                              color: !_showPharmacies ? Colors.white : const Color(0xFF545F73),
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
