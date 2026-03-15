import 'package:flutter/material.dart';


class PropertiesScreen extends StatelessWidget {
  const PropertiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F8FA),
        elevation: 0,
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Properties',
              style: TextStyle(
                color: Color(0xFF1A1D27),
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '5 properties in portfolio',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
            _buildPropertyCard(
              context,
              name: 'Annapurna Residency',
              address: 'Chabahil, Kathmandu',
              totalRooms: 12,
              occupied: 10,
              vacant: 2,
              tenantsCount: 10,
              revenue: 'Rs. 85,000',
            ),
            const SizedBox(height: 16),
            _buildPropertyCard(
              context,
              name: 'Machhapuchhre Heights',
              address: 'Lakeside, Pokhara',
              totalRooms: 15,
              occupied: 12,
              vacant: 3,
              tenantsCount: 12,
              revenue: 'Rs. 110,000',
            ),
            const SizedBox(height: 16),
            _buildPropertyCard(
              context,
              name: 'Sagarmatha Apartments',
              address: 'Patan, Lalitpur',
              totalRooms: 10,
              occupied: 8,
              vacant: 2,
              tenantsCount: 8,
              revenue: 'Rs. 75,000',
            ),
            const SizedBox(height: 16),
            _buildPropertyCard(
              context,
              name: 'Lumbini Garden',
              address: 'Bhairahawa, Rupandehi',
              totalRooms: 8,
              occupied: 6,
              vacant: 2,
              tenantsCount: 6,
              revenue: 'Rs. 45,000',
            ),
          const SizedBox(height: 16),
          _buildPropertyCard(
            context,
            name: 'Garden Estate',
            address: '654 Maple Lane, West End',
            totalRooms: 10,
            occupied: 7,
            vacant: 3,
            tenantsCount: 7,
            revenue: '₹45,000',
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildPropertyCard(
    BuildContext context, {
    required String name,
    required String address,
    required int totalRooms,
    required int occupied,
    required int vacant,
    required int tenantsCount,
    required String revenue,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEDF2FF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.domain,
                    color: const Color(0xFF1D5CFF),
                    size: 28,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        address,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: _buildStatBox(
                    context,
                    icon: Icons.door_front_door_outlined,
                    iconColor: const Color(0xFF7B8190),
                    value: totalRooms.toString(),
                    label: 'Total Rooms',
                    backgroundColor: const Color(0xFFF7F8FA),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildStatBox(
                    context,
                    icon: Icons.check_circle_outline,
                    iconColor: const Color(0xFF0C944B),
                    value: occupied.toString(),
                    label: 'Occupied',
                    backgroundColor: const Color(0xFFE9F7F0),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildStatBox(
                    context,
                    icon: Icons.cancel_outlined,
                    iconColor: const Color(0xFFD9483A),
                    value: vacant.toString(),
                    label: 'Vacant',
                    backgroundColor: const Color(0xFFFCEEED),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Divider(height: 1, color: Color(0xFFE2E4E9)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.people_outline, color: Color(0xFF7B8190), size: 20),
                    const SizedBox(width: 8),
                    Text(
                      '$tenantsCount Tenants',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Monthly Revenue',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      revenue,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: const Color(0xFF0C944B),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatBox(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required String value,
    required String label,
    required Color backgroundColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: iconColor, size: 20),
          const SizedBox(height: 8),
          Text(
            value,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
