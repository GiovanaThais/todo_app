import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppFormatters {
  static String formatHour(TimeOfDay time) {
    final date = DateTime.now().copyWith(hour: time.hour, minute: time.minute);

    final formattedValue = DateFormat('h:mm a', 'pt_BR').format(date);
    return formattedValue;
  }

  static String formatHourFromDate(DateTime date) {
    final formattedValue = DateFormat('h:mm a', 'pt_BR').format(date);
    return formattedValue;
  }

  static String? dayMessage(DateTime date) {
    final today = _resetHour(DateTime.now());
    final handleValue = _resetHour(date);
    final tomorrow = today.add(const Duration(days: 1));
    final yesterday = today.add(const Duration(days: 1));

    if (handleValue.isAtSameMomentAs(today)) {
      return 'Hoje';
    } else if (handleValue.isAtSameMomentAs(tomorrow)) {
      return 'Amanhã';
    } else if (handleValue.isAtSameMomentAs(yesterday)) {
      return 'Ontem';
    }

    return null;
  }

  static String onlyDays(DateTime date) {
    final formatter = DateFormat("d 'de' MMMM ", 'pt_BR');
    final formattedValue = formatter.format(date);

    return formattedValue;
  }

  static String completeDay(DateTime date) {
    final formatter = DateFormat("EEEE, d 'de' MMMM ", 'pt_BR');
    final formattedValue = formatter.format(date);

    return formattedValue;
  }

  static DateTime _resetHour(DateTime date) {
    return date.copyWith(
        hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0);
  }
}
