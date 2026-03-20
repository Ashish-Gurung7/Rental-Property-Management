class Property {
  final String id;
  final String name;
  final String address;
  final int totalRooms;
  final int occupied;
  final int vacant;
  final int tenantsCount;
  final String revenue;
  final String? imagePath;

  Property({
    required this.id,
    required this.name,
    required this.address,
    required this.totalRooms,
    required this.occupied,
    required this.vacant,
    required this.tenantsCount,
    required this.revenue,
    this.imagePath,
  });
}
