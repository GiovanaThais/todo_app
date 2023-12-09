import 'package:flutter/material.dart';

class DateVnStore extends ValueNotifier<DateTime> {
  DateVnStore() : super(DateTime.now());

  void nextDate() {
    value = value.add(const Duration(days: 1));
  }

  void previousDate() {
    value = value.add(const Duration(days: 1));
  }

  void changeDate(DateTime newDate) {
    value = newDate; //entrega notificação
  }
}
