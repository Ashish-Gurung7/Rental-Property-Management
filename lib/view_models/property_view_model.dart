import 'package:flutter/foundation.dart';
import '../models/property_model.dart';

class PropertyViewModel extends ChangeNotifier {
  final List<Property> _properties = [
    Property(
      id: '1',
      name: 'Annapurna Residency',
      address: 'Chabahil, Kathmandu',
      totalRooms: 12,
      occupied: 10,
      vacant: 2,
      tenantsCount: 10,
      revenue: 'Rs. 85,000',
    ),
    Property(
      id: '2',
      name: 'Machhapuchhre Heights',
      address: 'Lakeside, Pokhara',
      totalRooms: 15,
      occupied: 12,
      vacant: 3,
      tenantsCount: 12,
      revenue: 'Rs. 110,000',
    ),
    Property(
      id: '3',
      name: 'Sagarmatha Apartments',
      address: 'Patan, Lalitpur',
      totalRooms: 10,
      occupied: 8,
      vacant: 2,
      tenantsCount: 8,
      revenue: 'Rs. 75,000',
    ),
    Property(
      id: '4',
      name: 'Lumbini Garden',
      address: 'Bhairahawa, Rupandehi',
      totalRooms: 8,
      occupied: 6,
      vacant: 2,
      tenantsCount: 6,
      revenue: 'Rs. 45,000',
    ),
    Property(
      id: '5',
      name: 'Garden Estate',
      address: '654 Maple Lane, West End',
      totalRooms: 10,
      occupied: 7,
      vacant: 3,
      tenantsCount: 7,
      revenue: '₹45,000',
    ),
  ];

  List<Property> get properties => _properties;
}
