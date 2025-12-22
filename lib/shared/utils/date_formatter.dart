/// Helper class for date formatting utilities
///
/// Provides centralized date formatting logic to eliminate
/// duplication across the app.
class DateFormatter {
  // Private constructor to prevent instantiation
  DateFormatter._();

  /// Month names abbreviations
  static const List<String> _monthsShort = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  /// Full month names
  static const List<String> _monthsFull = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  /// Format date to "Jan 15, 2025" format
  ///
  /// Example: DateTime(2025, 1, 15) → "Jan 15, 2025"
  static String formatMedium(DateTime date) {
    return '${_monthsShort[date.month - 1]} ${date.day}, ${date.year}';
  }

  /// Format date to "January 15, 2025" format
  ///
  /// Example: DateTime(2025, 1, 15) → "January 15, 2025"
  static String formatLong(DateTime date) {
    return '${_monthsFull[date.month - 1]} ${date.day}, ${date.year}';
  }

  /// Format date to "01/15/2025" format
  ///
  /// Example: DateTime(2025, 1, 15) → "01/15/2025"
  static String formatShort(DateTime date) {
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '$month/$day/${date.year}';
  }

  /// Format date to "2025-01-15" format (ISO 8601)
  ///
  /// Example: DateTime(2025, 1, 15) → "2025-01-15"
  static String formatISO(DateTime date) {
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '${date.year}-$month-$day';
  }

  /// Format date and time to "Jan 15, 2025 at 2:30 PM" format
  ///
  /// Example: DateTime(2025, 1, 15, 14, 30) → "Jan 15, 2025 at 2:30 PM"
  static String formatDateTime(DateTime date) {
    final dateStr = formatMedium(date);
    final timeStr = formatTime(date);
    return '$dateStr at $timeStr';
  }

  /// Format only time to "2:30 PM" format
  ///
  /// Example: DateTime(2025, 1, 15, 14, 30) → "2:30 PM"
  static String formatTime(DateTime date) {
    final hour = date.hour > 12
        ? date.hour - 12
        : (date.hour == 0 ? 12 : date.hour);
    final minute = date.minute.toString().padLeft(2, '0');
    final period = date.hour >= 12 ? 'PM' : 'AM';
    return '$hour:$minute $period';
  }

  /// Smart chat timestamp formatter
  /// Shows contextual time based on how recent the message is:
  /// - Today → "2:30 PM"
  /// - Yesterday → "Yesterday, 2:30 PM"
  /// - This week → "Mon, 2:30 PM"
  /// - Older → "Jan 15, 2:30 PM"
  static String formatChatTimestamp(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final messageDate = DateTime(date.year, date.month, date.day);
    final difference = today.difference(messageDate).inDays;

    final timeStr = formatTime(date);

    if (difference == 0) {
      // Today - just show time
      return timeStr;
    } else if (difference == 1) {
      // Yesterday
      return 'Yesterday, $timeStr';
    } else if (difference < 7) {
      // This week - show day name
      const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
      return '${days[date.weekday - 1]}, $timeStr';
    } else {
      // Older - show month and day
      return '${_monthsShort[date.month - 1]} ${date.day}, $timeStr';
    }
  }

  /// Get relative time string (e.g., "2 hours ago", "3 days ago")
  ///
  /// Example:
  /// - 2 hours ago → "2 hours ago"
  /// - Yesterday → "1 day ago"
  /// - Last week → "7 days ago"
  static String formatRelative(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays > 365) {
      final years = (difference.inDays / 365).floor();
      return '$years ${years == 1 ? 'year' : 'years'} ago';
    } else if (difference.inDays > 30) {
      final months = (difference.inDays / 30).floor();
      return '$months ${months == 1 ? 'month' : 'months'} ago';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} ago';
    } else {
      return 'Just now';
    }
  }
}
