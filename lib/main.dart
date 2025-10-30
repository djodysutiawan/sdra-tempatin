import 'package:flutter/material.dart';
import 'pages/onboarding_page.dart';

void main() {
  runApp(const TempatinApp());
}

class TempatinApp extends StatelessWidget {
  const TempatinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tempatin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFFF7A00),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF7A00),
          primary: const Color(0xFFFF7A00),
          secondary: const Color(0xFF002E5D),
        ),
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      // Halaman pertama kali muncul
      initialRoute: '/onboarding',

      // Daftar semua rute di aplikasi
      routes: {'/onboarding': (context) => const OnboardingPage()},
    );
  }
}
