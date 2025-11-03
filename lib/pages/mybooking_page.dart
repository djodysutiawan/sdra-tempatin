import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/booking.dart';

class MyBookingPage extends StatelessWidget {
  MyBookingPage({super.key});

  final List<Booking> bookings = [
    Booking(
      placeName: "Kopi Senja Café",
      startDate: DateTime(2025, 11, 2),
      endDate: DateTime(2025, 11, 5),
      imageUrl: "https://images.unsplash.com/photo-1541167760496-1628856ab772",
    ),
    Booking(
      placeName: 'Hotel Mawar Indah',
      startDate: DateTime(2025, 10, 20),
      endDate: DateTime(2025, 10, 23),
      imageUrl: "https://images.unsplash.com/photo-1566073771259-6a8506099945",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final activeBookings = bookings.where((b) => b.isActive).toList();
    final pastBookings = bookings.where((b) => !b.isActive).toList();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("My Booking"),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Aktif"),
              Tab(text: "Riwayat"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildBookingList(activeBookings, "Belum ada booking aktif"),
            _buildBookingList(pastBookings, "Belum ada riwayat booking"),
          ],
        ),
      ),
    );
  }

  Widget _buildBookingList(List<Booking> list, String emptyMessage) {
    if (list.isEmpty) {
      return Center(child: Text(emptyMessage));
    }

    final formatter = DateFormat('dd MMM yyyy');

    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        final booking = list[index];
        return Card(
          margin: const EdgeInsets.all(12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 3,
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                booking.imageUrl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(booking.placeName),
            subtitle: Text(
              "${formatter.format(booking.startDate)} - ${formatter.format(booking.endDate)}",
            ),
            trailing: booking.isActive
                ? const Chip(
                    label: Text("Aktif"),
                    backgroundColor: Colors.greenAccent,
                  )
                : const Chip(
                    label: Text("Selesai"),
                    backgroundColor: Colors.grey,
                  ),
          ),
        );
      },
    );
  }
}
