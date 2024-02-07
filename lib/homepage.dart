import 'package:backfeed/features/zen/zenmode_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color(0xFFFCFCFE),
        body: SafeArea(
          child: ZenModePage(),
        ));
  }
}
