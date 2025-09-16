import 'package:intl/intl.dart';

class DateFormatter {
  // Format: 16 Sep, 2025
  static String formatDateShort(DateTime dateTime) {
    return DateFormat('dd MMM, yyyy').format(dateTime);
  }

  // Format: 16/09/2025
  static String formatDateNumeric(DateTime dateTime) {
    return DateFormat('dd/MM/yyyy').format(dateTime);
  }

  // Format: 16 Sep, 2025 - 04:30 PM
  static String formatDateTime(DateTime dateTime) {
    return DateFormat('dd MMM, yyyy - hh:mm a').format(dateTime);
  }

  // Format: just time like 04:30 PM
  static String formatTime(DateTime dateTime) {
    return DateFormat('hh:mm a').format(dateTime);
  }

  static String format(DateTime dateTime) {
    final now = DateTime.now();
    final diff = now.difference(dateTime);

    if (diff.inMinutes < 1) {
      return "Just now";
    } else if (diff.inMinutes < 60) {
      return "${diff.inMinutes} mins ago";
    } else if (diff.inHours < 24) {
      return "${diff.inHours} hrs ago";
    } else {
      return "${diff.inDays} days ago";
    }
  }
}
