import 'package:flutter/material.dart';
import 'pages/onboarding_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/home_page.dart';
// import 'pages/explore_page.dart';
// import 'pages/detail_page.dart';
// import 'pages/booking_page.dart';
// import 'pages/checkout_page.dart';
// import 'pages/mybooking_page.dart';
// import 'pages/favorite_page.dart';
// import 'pages/profile_page.dart';
// import 'pages/help_page.dart';

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
        primaryColor: const Color(0xFFFF7A00), // Orange utama
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
      routes: {
        '/onboarding': (context) => const OnboardingPage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const HomePage(),
        // '/explore': (context) => const ExplorePage(),
        // '/detail': (context) => const DetailPage(),
        // '/booking': (context) => const BookingPage(),
        // '/checkout': (context) => const CheckoutPage(),
        // '/mybooking': (context) => const MyBookingPage(),
        // '/profile': (context) => const ProfilePage(),
        // '/help': (context) => const HelpPage(),
      },
    );
  }
}
