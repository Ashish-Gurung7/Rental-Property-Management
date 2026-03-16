import 'package:flutter/foundation.dart';
import '../models/tenant_model.dart';

class TenantViewModel extends ChangeNotifier {
  final List<Tenant> _allTenants = [
    Tenant(
      id: '1',
      name: 'Ram Bahadur',
      property: 'Annapurna Residency',
      room: 'R1',
      phone: '+977 9800000000',
      email: 'ram.bahadur@email.com',
      rent: 'Rs. 15,621/mo',
      status: TenantStatus.paid,
    ),
    Tenant(
      id: '2',
      name: 'Sita Devi',
      property: 'Annapurna Residency',
      room: 'R2',
      phone: '+977 9800001111',
      email: 'sita.devi@email.com',
      rent: 'Rs. 15,620/mo',
      status: TenantStatus.paid,
    ),
    Tenant(
      id: '3',
      name: 'Hari Shrestha',
      property: 'Annapurna Residency',
      room: 'R3',
      phone: '+977 9800002222',
      email: 'hari.shrestha@email.com',
      rent: 'Rs. 15,169/mo',
      status: TenantStatus.paid,
    ),
    Tenant(
      id: '4',
      name: 'Maya Tamang',
      property: 'Annapurna Residency',
      room: 'R4',
      phone: '+977 9800003333',
      email: 'maya.tamang@email.com',
      rent: 'Rs. 15,583/mo',
      status: TenantStatus.overdue,
    ),
    Tenant(
      id: '5',
      name: 'Arjun Gurung',
      property: 'Annapurna Residency',
      room: 'R5',
      phone: '+977 9800004444',
      email: 'arjun.gurung@email.com',
      rent: 'Rs. 15,452/mo',
      status: TenantStatus.paid,
    ),
  ];

  String _selectedFilter = 'All (44)';

  final List<String> _filters = [
    'All (44)',
    'Paid (33)',
    'Pending (6)',
    'Overdue (5)',
  ];

  String get selectedFilter => _selectedFilter;
  List<String> get filters => _filters;

  void setFilter(String filter) {
    _selectedFilter = filter;
    notifyListeners();
  }

  List<Tenant> get tenants {
    if (_selectedFilter.startsWith('All')) {
      return _allTenants;
    } else if (_selectedFilter.startsWith('Paid')) {
      return _allTenants.where((t) => t.status == TenantStatus.paid).toList();
    } else if (_selectedFilter.startsWith('Overdue')) {
      return _allTenants.where((t) => t.status == TenantStatus.overdue).toList();
    } else if (_selectedFilter.startsWith('Pending')) {
      return _allTenants.where((t) => t.status == TenantStatus.pending).toList();
    }
    return _allTenants;
  }
}
