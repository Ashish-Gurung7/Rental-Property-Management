import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/payment_view_model.dart';
import '../models/payment_model.dart';

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
      body: Consumer<PaymentViewModel>(
        builder: (context, viewModel, child) {
          final groupedPayments = viewModel.paymentsGroupedByDate;
          return ListView(
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
              ...groupedPayments.entries.map((entry) {
                final date = entry.key;
                final payments = entry.value;
                final totalForDate = 'Rs. 5,949'; // Placeholder for total, could be calculated
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDateHeader(date, totalForDate),
                    ...payments.map((payment) => _buildTransactionCard(
                          context,
                          payment: payment,
                        )),
                    const SizedBox(height: 16),
                  ],
                );
              }),
              const SizedBox(height: 100),
            ],
          );
        },
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
    required Payment payment,
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
                      payment.tenantName,
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
                        color: payment.method == 'online'
                            ? const Color(0xFFEDF2FF)
                            : const Color(0xFFE9F7F0),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        payment.method,
                        style: TextStyle(
                          color: payment.method == 'online'
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
                  payment.amount,
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
                  payment.propertyName,
                  style: const TextStyle(
                    color: Color(0xFF7B8190),
                    fontSize: 14,
                  ),
                ),
                Text(
                  payment.time,
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
