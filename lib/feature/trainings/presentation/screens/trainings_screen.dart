import 'package:flutter/material.dart';

class TrainingsScreen extends StatelessWidget {
  const TrainingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('التدريبات المتاحة')),
      body: const Center(child: Text('شاشة التدريبات المتاحة')),
    );
  }
}
