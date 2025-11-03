class Booking {
  final String placeName;
  final DateTime startDate;
  final DateTime endDate;
  final String imageUrl;

  Booking({
    required this.placeName,
    required this.startDate,
    required this.endDate,
    required this.imageUrl,
  });

  bool get isActive => endDate.isAfter(DateTime.now());
}
