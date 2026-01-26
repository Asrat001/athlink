import 'package:flutter/material.dart';

class CostItem {
  final String title;
  final double amount;
  final Color color;
  CostItem({required this.title, required this.amount, required this.color});
}

class FinancialGoalData {
  final double amount;
  final DateTime deadline;
  FinancialGoalData({required this.amount, required this.deadline});
}

class GoalMilestone {
  final String title;
  final DateTime date;
  final String status;

  GoalMilestone({
    required this.title,
    required this.date,
    required this.status,
  });
}

class Sponsor {
  final String name;
  final String category;
  final String logoUrl;

  Sponsor({required this.name, required this.category, required this.logoUrl});
}

class SponsorshipPreference {
  final String title;
  final IconData icon;

  SponsorshipPreference({required this.title, required this.icon});
}
