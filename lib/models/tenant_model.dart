enum TenantStatus { paid, overdue, pending }

class Tenant {
  final String id;
  final String name;
  final String property;
  final String room;
  final String phone;
  final String email;
  final String rent;
  final TenantStatus status;
  final String? imagePath;

  Tenant({
    required this.id,
    required this.name,
    required this.property,
    required this.room,
    required this.phone,
    required this.email,
    required this.rent,
    required this.status,
    this.imagePath,
  });
}
