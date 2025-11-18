import 'package:flutter/material.dart';

void main() {
  runApp(const TempatinApp());
}

class TempatinApp extends StatelessWidget {
  const TempatinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: JelajahiPage());
  }
}

class JelajahiPage extends StatefulWidget {
  const JelajahiPage({super.key});

  @override
  State<JelajahiPage> createState() => _JelajahiPageState();
}

class _JelajahiPageState extends State<JelajahiPage> {
  String selectedFilter = "All";
  String searchText = "";
  bool showFilterChips = true;

  final List<Map<String, dynamic>> allPlaces = [
    {
      'name': 'Golden Cafe',
      'location': 'Tasikmalaya',
      'details': '8 chairs 2 tables',
      'price': 50,
      'discount': false,
      'image':
          'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=800',
    },
    {
      'name': 'Sunset Resto',
      'location': 'Bandung',
      'details': '10 chairs 4 tables',
      'price': 80,
      'discount': true,
      'image':
          'https://images.unsplash.com/photo-1498654896293-37aacf113fd9?w=800',
    },
    {
      'name': 'Kopi Hitz',
      'location': 'Tasikmalaya',
      'details': '5 chairs 2 tables',
      'price': 30,
      'discount': true,
      'image':
          'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=800',
    },
    {
      'name': 'Kopi Keghan',
      'location': 'Rusia',
      'details': '30 chairs 10 tables',
      'price': 90,
      'discount': true,
      'image':
          'https://images.unsplash.com/photo-1567880905822-56f8e06fe630?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=735',
    },
    {
      'name': 'Kopi Kenangan',
      'location': 'Singaparna',
      'details': '6 chairs 2 tables',
      'price': 12,
      'discount': true,
      'image':
          'https://images.unsplash.com/photo-1511081692775-05d0f180a065?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=686',
    },
  ];

  List<Map<String, dynamic>> get filteredPlaces {
    List<Map<String, dynamic>> places;

    switch (selectedFilter) {
      case "Harga":
        places = List.from(allPlaces)
          ..sort((a, b) => a['price'].compareTo(b['price']));
        break;
      case "Lokasi":
        places = allPlaces
            .where((place) => place['location'] == 'Tasikmalaya')
            .toList();
        break;
      case "Discount":
        places = allPlaces.where((place) => place['discount'] == true).toList();
        break;
      default:
        places = allPlaces;
        break;
    }

    if (searchText.isNotEmpty) {
      final query = searchText.toLowerCase();
      places = places.where((place) {
        final name = place['name'].toLowerCase();
        final location = place['location'].toLowerCase();
        return name.contains(query) || location.contains(query);
      }).toList();
    }

    return places;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Jelajahi',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const NotificationPage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.search, color: Colors.grey),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          searchText = value;
                        });
                      },
                      decoration: const InputDecoration(
                        hintText: 'Search...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.tune,
                      color: showFilterChips ? Colors.teal : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        showFilterChips = !showFilterChips;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Visibility(
              visible: showFilterChips,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (final label in ["All", "Harga", "Lokasi", "Discount"])
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: FilterChipWidget(
                          label: label,
                          isSelected: selectedFilter == label,
                          onTap: () {
                            setState(() {
                              selectedFilter = label;
                            });
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: showFilterChips,
              child: const SizedBox(height: 16),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredPlaces.length,
                itemBuilder: (context, index) {
                  final place = filteredPlaces[index];
                  return PlaceCard(place: place);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterChipWidget extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterChipWidget({
    super.key,
    required this.label,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.teal : Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class PlaceCard extends StatelessWidget {
  final Map<String, dynamic> place;
  const PlaceCard({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              place['image'],
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  place['name'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Text(
                  place['location'],
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Text(
                  place['details'],
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${place['price']}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                    const Text(
                      'Per Hour',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//
// ==========================
//     HALAMAN NOTIFIKASI
// ==========================
//

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Notifikasi",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        foregroundColor: Colors.black,
      ),
      body: const Center(
        child: Text(
          "Belum ada notifikasi untuk saat ini.",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ),
    );
  }
}
