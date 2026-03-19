import 'package:flutter_test/flutter_test.dart';
import 'package:rental_app/models/tenant_model.dart';
import 'package:rental_app/view_models/tenant_view_model.dart';

void main() {
  group('TenantViewModel Tests', () {
    late TenantViewModel viewModel;

    setUp(() {
      viewModel = TenantViewModel();
    });

    test('Initial tenants list is not empty', () {
      expect(viewModel.tenants.isNotEmpty, true);
    });

    test('addTenant adds a new tenant', () {
      final initialCount = viewModel.getCountByStatus('All');
      final newTenant = Tenant(
        id: 'new-id',
        name: 'Test Tenant',
        property: 'Annapurna Residency',
        room: 'R10',
        phone: '123',
        email: 'test@test.com',
        rent: 'Rs. 5000/mo',
        status: TenantStatus.pending,
      );

      viewModel.addTenant(newTenant);

      expect(viewModel.getCountByStatus('All'), initialCount + 1);
      expect(viewModel.tenants.any((t) => t.id == 'new-id'), true);
    });

    test('updateTenant updates existing tenant', () {
      final firstTenant = viewModel.tenants.first;
      final updatedTenant = Tenant(
        id: firstTenant.id,
        name: 'Updated Name',
        property: firstTenant.property,
        room: firstTenant.room,
        phone: firstTenant.phone,
        email: firstTenant.email,
        rent: firstTenant.rent,
        status: firstTenant.status,
      );

      viewModel.updateTenant(updatedTenant);

      expect(viewModel.tenants.any((t) => t.name == 'Updated Name'), true);
    });

    test('deleteTenant removes tenant', () {
      final firstTenant = viewModel.tenants.first;
      final initialCount = viewModel.getCountByStatus('All');

      viewModel.deleteTenant(firstTenant.id);

      expect(viewModel.getCountByStatus('All'), initialCount - 1);
      expect(viewModel.tenants.any((t) => t.id == firstTenant.id), false);
    });

    test('setFilter updates filtering logic', () {
      viewModel.setFilter('Overdue');
      expect(viewModel.selectedFilter, 'Overdue');
      
      final overdueCount = viewModel.getCountByStatus('Overdue');
      expect(viewModel.tenants.length, overdueCount);
      expect(viewModel.tenants.every((t) => t.status == TenantStatus.overdue), true);
    });
  });
}
