import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'screens/quick_share_screen.dart';

void main() {
  runApp(const QuickShareApp());
}

class QuickShareApp extends StatelessWidget {
  const QuickShareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Oriflame Quick Share',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const QuickShareScreen(),
    );
  }
}
