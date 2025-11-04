class Booking {
  final String title;
  final String location;
  final double price;
  final String unit;
  final String imageUrl;
  final DateTime dateStart;
  final DateTime dateEnd;
  final int guests;
  final double rating;
  final bool isActive;

  Booking({
    required this.title,
    required this.location,
    required this.price,
    required this.unit,
    required this.imageUrl,
    required this.dateStart,
    required this.dateEnd,
    required this.guests,
    required this.rating,
    required this.isActive,
  });
}
