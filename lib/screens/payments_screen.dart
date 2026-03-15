import 'package:flutter/material.dart';

class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F8FA),
        elevation: 0,
        centerTitle: false,
        title: const Text(
          'Payments',
          style: TextStyle(
            color: Color(0xFF1A1D27),
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildMonthSelector(),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: _buildSummaryCard(
                  context,
                  title: 'Collected',
                  amount: 'Rs. 133,165',
                  count: '24 payments',
                  icon: Icons.attach_money,
                  iconColor: const Color(0xFF0C944B),
                  iconBgColor: const Color(0xFFE9F7F0),
                  amountColor: const Color(0xFF0C944B),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildSummaryCard(
                  context,
                  title: 'Pending',
                  amount: 'Rs. 109,101',
                  count: '20 payments',
                  icon: Icons.trending_up,
                  iconColor: const Color(0xFFE4632A),
                  iconBgColor: const Color(0xFFFFF1EB),
                  amountColor: const Color(0xFFE4632A),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          const Text(
            'Transaction History',
            style: TextStyle(
              color: Color(0xFF1A1D27),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildDateHeader('Friday, Mar 27', 'Rs. 5,949'),
          _buildTransactionCard(
            context,
            name: 'Bijay Shrestha',
            property: 'Annapurna Residency',
            amount: '+Rs. 5,949',
            method: 'online',
            time: '5:45 AM',
          ),
          const SizedBox(height: 24),
          _buildDateHeader('Wednesday, Mar 25', 'Rs. 5,941'),
          _buildTransactionCard(
            context,
            name: 'Sapana Rai',
            property: 'Machhapuchhre Heights',
            amount: '+Rs. 5,941',
            method: 'cash',
            time: '5:45 AM',
          ),
          const SizedBox(height: 24),
          _buildDateHeader('Monday, Mar 23', 'Rs. 16,266'),
          _buildTransactionCard(
            context,
            name: 'Santosh Gurung',
            property: 'Sagarmatha Apartments',
            amount: '+Rs. 5,896',
            method: 'online',
            time: '5:45 AM',
          ),
          _buildTransactionCard(
            context,
            name: 'Binod Tamang',
            property: 'Sagarmatha Apartments',
            amount: '+Rs. 5,095',
            method: 'online',
            time: '5:45 AM',
          ),
          _buildTransactionCard(
            context,
            name: 'Kabita Magar',
            property: 'Lumbini Garden',
            amount: '+Rs. 5,275',
            method: 'online',
            time: '5:45 AM',
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _buildMonthSelector() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFE2E4E9).withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(child: _buildMonthTab('Jan 2026', false)),
          Expanded(child: _buildMonthTab('Feb 2026', false)),
          Expanded(child: _buildMonthTab('Mar 2026', true)),
        ],
      ),
    );
  }

  Widget _buildMonthTab(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                )
              ]
            : null,
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? const Color(0xFF1A1D27) : const Color(0xFF7B8190),
          fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildSummaryCard(
    BuildContext context, {
    required String title,
    required String amount,
    required String count,
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required Color amountColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFEBF0F5), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF7B8190),
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            amount,
            style: TextStyle(
              color: amountColor,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            count,
            style: const TextStyle(
              color: Color(0xFF7B8190),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateHeader(String date, String amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            date,
            style: const TextStyle(
              color: Color(0xFF1A1D27),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            amount,
            style: const TextStyle(
              color: Color(0xFF0C944B),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionCard(
    BuildContext context, {
    required String name,
    required String property,
    required String amount,
    required String method,
    required String time,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: Color(0xFF1A1D27),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: method == 'online'
                            ? const Color(0xFFEDF2FF)
                            : const Color(0xFFE9F7F0),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        method,
                        style: TextStyle(
                          color: method == 'online'
                              ? const Color(0xFF1D5CFF)
                              : const Color(0xFF0C944B),
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  amount,
                  style: const TextStyle(
                    color: Color(0xFF0C944B),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  property,
                  style: const TextStyle(
                    color: Color(0xFF7B8190),
                    fontSize: 14,
                  ),
                ),
                Text(
                  time,
                  style: const TextStyle(
                    color: Color(0xFF7B8190),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
