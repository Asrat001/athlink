// lib/shared/models/account_type.dart
import 'package:flutter/material.dart';

enum AccountType { athlete, sponsor }

extension AccountTypeExtension on AccountType {
  String get name {
    switch (this) {
      case AccountType.athlete:
        return 'Athlete';
      case AccountType.sponsor:
        return 'Sponsor';
    }
  }

  String get value {
    switch (this) {
      case AccountType.athlete:
        return 'athlete';
      case AccountType.sponsor:
        return 'sponsor';
    }
  }

  // Optional: Get icon or description
  IconData get icon {
    switch (this) {
      case AccountType.athlete:
        return Icons.sports;
      case AccountType.sponsor:
        return Icons.business;
    }
  }

  String get description {
    switch (this) {
      case AccountType.athlete:
        return 'Join as an athlete to connect with sponsors, showcase your skills, and find funding opportunities';
      case AccountType.sponsor:
        return 'Join as a sponsor to discover talented athletes, support promising careers, and build brand partnerships';
    }
  }
}
