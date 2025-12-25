import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/main_screen.dart';
import 'screens/pengumuman_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/dashboard_class_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LMS Mobile',
      theme: ThemeData(primarySwatch: Colors.red),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/main': (context) => const MainScreen(),
        '/pengumuman': (context) => const PengumumanScreen(),
        '/profil': (context) => const ProfileScreen(),
        '/dashboard_class': (context) => const DashboardClassScreen(),
      },
    );
  }
}
