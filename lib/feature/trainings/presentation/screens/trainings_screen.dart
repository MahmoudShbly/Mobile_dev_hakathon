import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_dev_hakathon/feature/trainings/presentation/screens/widgets/trainings_screen_body.dart';

class TrainingsScreen extends StatelessWidget {
  const TrainingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'التدريبات',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
              ),
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: TrainingsScreenBody()
    );
  }
}
