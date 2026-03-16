import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/tenant_view_model.dart';
import '../models/tenant_model.dart';

class TenantsScreen extends StatelessWidget {
  const TenantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F8FA),
        elevation: 0,
        centerTitle: false,
        title: const Text(
          'Tenants',
          style: TextStyle(
            color: Color(0xFF1A1D27),
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Consumer<TenantViewModel>(
        builder: (context, viewModel, child) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: _buildSearchBar(),
              ),
              _buildFilterChips(viewModel),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  itemCount: viewModel.tenants.length,
                  itemBuilder: (context, index) {
                    final tenant = viewModel.tenants[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: _buildTenantCard(
                        context,
                        tenant: tenant,
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF1F3F5),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: const TextField(
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: Color(0xFF7B8190)),
          hintText: 'Search by name, phone, or email...',
          hintStyle: TextStyle(color: Color(0xFF7B8190)),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildFilterChips(TenantViewModel viewModel) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: viewModel.filters.map((filter) {
          final isSelected = filter == viewModel.selectedFilter;
          return Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: ChoiceChip(
              label: Text(
                filter,
                style: TextStyle(
                  color: isSelected ? const Color(0xFF1A1D27) : const Color(0xFF1A1D27),
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              selected: isSelected,
              onSelected: (selected) {
                if (selected) {
                  viewModel.setFilter(filter);
                }
              },
              backgroundColor: const Color(0xFFEFF1F5),
              selectedColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: isSelected ? const Color(0xFF1A1D27) : Colors.transparent,
                  width: 1,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTenantCard(
    BuildContext context, {
    required Tenant tenant,
  }) {
    Color badgeBg;
    Color badgeText;

    if (tenant.status == TenantStatus.paid) {
      badgeBg = const Color(0xFF0F172A);
      badgeText = Colors.white;
    } else if (tenant.status == TenantStatus.overdue) {
      badgeBg = const Color(0xFFD91E47); // red from design
      badgeText = Colors.white;
    } else {
      // pending
      badgeBg = const Color(0xFFFFF1EB);
      badgeText = const Color(0xFFE4632A);
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  tenant.name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  tenant.rent,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${tenant.property} • ${tenant.room}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: badgeBg,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    tenant.status.name,
                    style: TextStyle(
                      color: badgeText,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.phone_outlined, size: 16, color: Color(0xFF7B8190)),
                const SizedBox(width: 8),
                Text(
                  tenant.phone,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.email_outlined, size: 16, color: Color(0xFF7B8190)),
                const SizedBox(width: 8),
                Text(
                  tenant.email,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
