import 'package:flutter/material.dart';


class TenantsScreen extends StatefulWidget {
  const TenantsScreen({super.key});

  @override
  State<TenantsScreen> createState() => _TenantsScreenState();
}

class _TenantsScreenState extends State<TenantsScreen> {
  String _selectedFilter = 'All (44)';

  final List<String> _filters = [
    'All (44)',
    'Paid (33)',
    'Pending (6)',
    'Overdue (5)',
  ];

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildSearchBar(),
          ),
          _buildFilterChips(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              children: [
                _buildTenantCard(
                  context,
                  name: 'Ram Bahadur',
                  property: 'Annapurna Residency',
                  room: 'R1',
                  phone: '+977 9800000000',
                  email: 'ram.bahadur@email.com',
                  rent: 'Rs. 15,621/mo',
                  status: 'paid',
                ),
                const SizedBox(height: 16),
                _buildTenantCard(
                  context,
                  name: 'Sita Devi',
                  property: 'Annapurna Residency',
                  room: 'R2',
                  phone: '+977 9800001111',
                  email: 'sita.devi@email.com',
                  rent: 'Rs. 15,620/mo',
                  status: 'paid',
                ),
                const SizedBox(height: 16),
                _buildTenantCard(
                  context,
                  name: 'Hari Shrestha',
                  property: 'Annapurna Residency',
                  room: 'R3',
                  phone: '+977 9800002222',
                  email: 'hari.shrestha@email.com',
                  rent: 'Rs. 15,169/mo',
                  status: 'paid',
                ),
                const SizedBox(height: 16),
                _buildTenantCard(
                  context,
                  name: 'Maya Tamang',
                  property: 'Annapurna Residency',
                  room: 'R4',
                  phone: '+977 9800003333',
                  email: 'maya.tamang@email.com',
                  rent: 'Rs. 15,583/mo',
                  status: 'overdue',
                ),
                const SizedBox(height: 16),
                _buildTenantCard(
                  context,
                  name: 'Arjun Gurung',
                  property: 'Annapurna Residency',
                  room: 'R5',
                  phone: '+977 9800004444',
                  email: 'arjun.gurung@email.com',
                  rent: 'Rs. 15,452/mo',
                  status: 'paid',
                ),
                const SizedBox(height: 100), // padding for bottom nav
              ],
            ),
          ),
        ],
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

  Widget _buildFilterChips() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: _filters.map((filter) {
          final isSelected = filter == _selectedFilter;
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
                  setState(() {
                    _selectedFilter = filter;
                  });
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
    required String name,
    required String property,
    required String room,
    required String phone,
    required String email,
    required String rent,
    required String status,
  }) {
    Color badgeBg;
    Color badgeText;

    if (status == 'paid') {
      badgeBg = const Color(0xFF0F172A);
      badgeText = Colors.white;
    } else if (status == 'overdue') {
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
                  name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  rent,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$property • $room',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: badgeBg,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    status,
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
                  phone,
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
                  email,
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
