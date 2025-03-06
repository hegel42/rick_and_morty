import 'package:intl/intl.dart';

// ignore: avoid_classes_with_only_static_members
class Formatter {
  static String stringDateFormatter(String date) {
    final dateTime = DateTime.tryParse(date);
    if (dateTime != null) {
      final formattedDate = DateFormat('dd.MM.yyyy').format(dateTime);
      return formattedDate;
    } else {
      return '';
    }
  }

  static String longTextFormatter(String text) {
    final pattern = RegExp(r'\[\+\d+ chars\]');

    final result = text.replaceAll(pattern, '');

    return result;
  }
}
