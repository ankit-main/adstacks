import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'screens/dashboard_screen.dart';
import 'utils/app_colors.dart';
import 'providers/dashboard_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => DashboardProvider(),
      child: const AdstacksApp(),
    ),
  );
}

class AdstacksApp extends StatelessWidget {
  const AdstacksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Adstacks Dashboard',

      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),

      home: const DashboardScreen(),
    );
  }
}