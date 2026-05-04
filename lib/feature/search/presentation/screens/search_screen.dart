import 'package:flutter/material.dart';
import 'package:mobile_dev_hakathon/feature/search/presentation/screens/widgets/search_screen_body.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'الدواء',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: false,
      ),
      body: SearchScreenBody(),
    );
  }
}
