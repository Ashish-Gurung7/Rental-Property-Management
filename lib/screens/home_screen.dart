import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const SizedBox(height: 16),
                _buildTotalCollectionCard(context),
                const SizedBox(height: 16),
                _buildStatsRow(context),
                const SizedBox(height: 16),
                _buildOverdueAlert(context),
                const SizedBox(height: 24),
                Text(
                  'Property-wise Collection',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 16),
                _buildPropertyCollectionCard(
                  context,
                  name: 'Annapurna Residency',
                  address: 'Chabahil, Kathmandu',
                  collected: 'Rs. 33,205',
                  total: 'of Rs. 49,272',
                  progress: 0.67,
                  paidText: '6/9 paid',
                  pendingText: '3 pending',
                  isPendingWarning: true,
                ),
                const SizedBox(height: 16),
                _buildPropertyCollectionCard(
                  context,
                  name: 'Machhapuchhre Heights',
                  address: 'Lakeside, Pokhara',
                  collected: 'Rs. 43,840',
                  total: 'of Rs. 54,831',
                  progress: 0.8,
                  paidText: '8/10 paid',
                  pendingText: '2 pending',
                  isPendingWarning: true,
                ),
                 const SizedBox(height: 16),
                _buildPropertyCollectionCard(
                  context,
                  name: 'Sagarmatha Apartments',
                  address: 'Patan, Lalitpur',
                  collected: 'Rs. 38,827',
                  total: 'of Rs. 44,146',
                  progress: 0.88,
                  paidText: '7/8 paid',
                  pendingText: '1 pending',
                  isPendingWarning: true,
                ),
                 const SizedBox(height: 16),
                _buildPropertyCollectionCard(
                  context,
                  name: 'Lumbini Garden',
                  address: 'Bhairahawa, Rupandehi',
                  collected: 'Rs. 32,956',
                  total: 'of Rs. 54,989',
                  progress: 0.6,
                  paidText: '6/10 paid',
                  pendingText: '4 pending',
                  isPendingWarning: true,
                ),
                const SizedBox(height: 24),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: const Color(0xFF1D5CFF),
      expandedHeight: 120.0,
      pinned: true,
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Property Manager',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'March 2026 Overview',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.9),
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTotalCollectionCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Collected',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Rs. 181,722',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: const Color(0xFF0C944B),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    color: const Color(0xFFE9F7F0),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.attach_money,
                    color: const Color(0xFF0C944B),
                    size: 28,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Collection Progress',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  '75.1%',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            _buildProgressBar(progress: 0.751, height: 8),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '33 of 44 paid',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  'Rs. 60,253 pending',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsRow(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1D5CFF).withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.people_outline,
                          color: const Color(0xFF1D5CFF),
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Total Tenants',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '44',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.purple.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.show_chart,
                          color: Colors.purple,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Properties',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '5',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOverdueAlert(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFCEEED),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFFCEEED), width: 1), 
      ),
      child: Row(
        children: [
          const Icon(
            Icons.error_outline,
            color: const Color(0xFFD9483A),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Overdue Payments',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: const Color(0xFFD9483A),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '5 tenants have overdue rent',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: const Color(0xFFD9483A),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPropertyCollectionCard(
    BuildContext context, {
    required String name,
    required String address,
    required String collected,
    required String total,
    required double progress,
    required String paidText,
    required String pendingText,
    required bool isPendingWarning,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        address,
                        style: Theme.of(context).textTheme.bodySmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      collected,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: const Color(0xFF0C944B),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      total,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildProgressBar(progress: progress),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  paidText,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  pendingText,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: isPendingWarning ? const Color(0xFFE4632A) : const Color(0xFF7B8190),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressBar({
    required double progress,
    double height = 6.0,
  }) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFE2E4E9),
        borderRadius: BorderRadius.circular(height / 2),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: progress.clamp(0.0, 1.0),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF0F172A),
            borderRadius: BorderRadius.circular(height / 2),
          ),
        ),
      ),
    );
  }
}
