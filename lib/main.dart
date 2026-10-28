import 'package:flutter/material.dart';

import 'screens/login_screen.dart';
import 'widgets/auth_widgets.dart';

void main() {
  runApp(const GlobeGoApp());
}

class GlobeGoApp extends StatelessWidget {
  const GlobeGoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GlobeGo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: authBackground,
        colorScheme: ColorScheme.fromSeed(
          seedColor: authBlue,
          brightness: Brightness.light,
        ),
        fontFamily: 'Roboto',
      ),
      home: const LoginScreen(),
    );
  }
}
