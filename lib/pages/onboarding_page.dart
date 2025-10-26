import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  // Data onboarding (pakai gambar dari assets/images)
  final List<Map<String, String>> onboardingData = [
    {
      "title": "Cari dan Booking Tempat",
      "desc":
          "Temukan tempat favoritmu dengan mudah hanya di genggaman tangan.",
      "image": "assets/images/onboard1.png",
    },
    {
      "title": "Lengkap dengan Lokasi & Maps",
      "desc":
          "Lihat lokasi langsung di peta dan pilih tempat yang paling cocok.",
      "image": "assets/images/onboard2.png",
    },
    {
      "title": "Booking & Bayar Praktis",
      "desc": "Pesan tempat, dapatkan promo, dan kumpulkan poin dengan mudah.",
      "image": "assets/images/onboard3.png",
    },
  ];

  // Fungsi tombol "Berikutnya" / "Mulai Sekarang"
  void nextPage() {
    if (_currentIndex < onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Bagian isi slide
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() => _currentIndex = index);
              },
              itemCount: onboardingData.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ✅ Tampilkan gambar dari assets/images/
                      SizedBox(
                        height: 250,
                        width: 250,
                        child: Image.asset(
                          onboardingData[index]['image']!,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: 40),
                      Text(
                        onboardingData[index]['title']!,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF002E5D),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        onboardingData[index]['desc']!,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Indikator slide (titik di bawah)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              onboardingData.length,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: _currentIndex == index ? 12 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _currentIndex == index
                      ? const Color(0xFFFF7A00)
                      : Colors.grey,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Tombol "Berikutnya" atau "Mulai Sekarang"
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF7A00),
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: nextPage,
              child: Text(
                _currentIndex == onboardingData.length - 1
                    ? "Mulai Sekarang"
                    : "Berikutnya",
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
