// lib/features/profile/presentation/widgets/savings_stats_card.dart

import 'package:flutter/material.dart';

/// Widget that displays user statistics: distance traveled and estimated savings
/// This widget is part of the profile feature and can be reused in different contexts
class SavingsStatsCard extends StatelessWidget {
  final double distanceKm;
  final double savingsAmount;

  const SavingsStatsCard({
    super.key,
    required this.distanceKm,
    required this.savingsAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Distance Section
        _buildStatItem(
          label: 'Recorrido',
          value: '${distanceKm.toStringAsFixed(0)} Km',
          valueColor: Colors.black87,
        ),
        const SizedBox(height: 16),

        // Savings Section
        _buildStatItem(
          label: 'Ahorro estimado',
          value: 'S/ ${savingsAmount.toStringAsFixed(2)} en gasolina',
          valueColor: Colors.black54,
        ),
      ],
    );
  }

  Widget _buildStatItem({
    required String label,
    required String value,
    required Color valueColor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            fontFamily: 'Inter',
            color: Colors.black87,
            letterSpacing: 0,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            color: valueColor,
            fontWeight: FontWeight.w500,
            fontFamily: 'Inter',
          ),
        ),
      ],
    );
  }
}
