import 'package:flutter/foundation.dart';
import '../models/payment_model.dart';

class PaymentViewModel extends ChangeNotifier {
  final List<Payment> _payments = [
    Payment(
      id: '1',
      tenantName: 'Bijay Shrestha',
      propertyName: 'Annapurna Residency',
      amount: '+Rs. 5,949',
      method: 'online',
      time: '5:45 AM',
      date: 'Friday, Mar 27',
    ),
    Payment(
      id: '2',
      tenantName: 'Sapana Rai',
      propertyName: 'Machhapuchhre Heights',
      amount: '+Rs. 5,941',
      method: 'cash',
      time: '5:45 AM',
      date: 'Wednesday, Mar 25',
    ),
    Payment(
      id: '3',
      tenantName: 'Santosh Gurung',
      propertyName: 'Sagarmatha Apartments',
      amount: '+Rs. 5,896',
      method: 'online',
      time: '5:45 AM',
      date: 'Monday, Mar 23',
    ),
    Payment(
      id: '4',
      tenantName: 'Binod Tamang',
      propertyName: 'Sagarmatha Apartments',
      amount: '+Rs. 5,095',
      method: 'online',
      time: '5:45 AM',
      date: 'Monday, Mar 23',
    ),
    Payment(
      id: '5',
      tenantName: 'Kabita Magar',
      propertyName: 'Lumbini Garden',
      amount: '+Rs. 5,275',
      method: 'online',
      time: '5:45 AM',
      date: 'Monday, Mar 23',
    ),
  ];

  List<Payment> get payments => _payments;

  Map<String, List<Payment>> get paymentsGroupedByDate {
    final Map<String, List<Payment>> grouped = {};
    for (var payment in _payments) {
      if (!grouped.containsKey(payment.date)) {
        grouped[payment.date] = [];
      }
      grouped[payment.date]!.add(payment);
    }
    return grouped;
  }
}
