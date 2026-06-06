import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'features/dashboard/presentation/screens/dashboard_shell.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Azure Ledger',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      home: const DashboardShell(),
    );
  }
}
