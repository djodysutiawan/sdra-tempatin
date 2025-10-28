import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: const Color(0xFFFF7A00),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Selamat Datang di Tempatin",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF002E5D),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "E-mail",
                prefixIcon: const Icon(Icons.email_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                prefixIcon: const Icon(Icons.lock_outline),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF7A00),
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: const Text(
                "Login",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: const Text("Belum punya akun? Daftar di sini"),
            ),
          ],
        ),
      ),
    );
  }
}
