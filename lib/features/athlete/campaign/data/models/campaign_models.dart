import 'package:flutter/material.dart';

class CostItem {
  final String? id;
  final String title;
  final double amount;
  final Color color;
  CostItem({
    this.id,
    required this.title,
    required this.amount,
    required this.color,
  });
}

class FinancialGoalData {
  final double amount;
  final DateTime deadline;
  FinancialGoalData({required this.amount, required this.deadline});
}

class GoalMilestone {
  final String? id;
  final String title;
  final DateTime date;
  final String status;

  GoalMilestone({
    this.id,
    required this.title,
    required this.date,
    required this.status,
  });
}

class Sponsor {
  final String? id;
  final String name;
  final String category;
  final String? profileImageUrl;
  final bool? isOnline;

  Sponsor({
    this.id,
    required this.name,
    required this.category,
    this.profileImageUrl,
    this.isOnline,
  });
}

class SponsorshipPreference {
  final String title;
  final IconData icon;

  SponsorshipPreference({required this.title, required this.icon});
}
