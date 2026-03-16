class Payment {
  final String id;
  final String tenantName;
  final String propertyName;
  final String amount;
  final String method;
  final String time;
  final String date;

  Payment({
    required this.id,
    required this.tenantName,
    required this.propertyName,
    required this.amount,
    required this.method,
    required this.time,
    required this.date,
  });
}
