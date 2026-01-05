class PlanSubscription {
  final String planName;
  final String planType; // 'monthly' or 'yearly'
  final num price;

  const PlanSubscription({
    required this.planName,
    required this.planType,
    required this.price,
  });

  String get displayPeriod => planType == 'monthly' ? '/mes' : '/año';
}
