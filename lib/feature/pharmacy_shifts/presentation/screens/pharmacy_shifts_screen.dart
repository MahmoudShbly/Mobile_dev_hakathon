import 'package:flutter/material.dart';

class PharmacyShiftsScreen extends StatelessWidget {
  const PharmacyShiftsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('مناوبات ودوام الصدليات')),
      body: const Center(child: Text('شاشة مناوبات أيام ودوام الصدليات')),
    );
  }
}
