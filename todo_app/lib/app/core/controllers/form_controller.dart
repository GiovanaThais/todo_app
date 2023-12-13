import 'package:flutter/material.dart';
import 'package:todo_app/app/core/shared/utils/app_formatters.dart';
import 'package:basic_utils/basic_utils.dart';

import '../models/add_task_param.dart';

abstract class FormController {
  FormController() {
    formKey = GlobalKey<FormState>();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    dateController = TextEditingController();
    initHourController = TextEditingController();
    endHourController = TextEditingController();
  }
  late final GlobalKey<FormState> formKey;
  late final titleController;
  late final descriptionController;
  late final dateController;
  late final initHourController;
  late final endHourController;

  DateTime? _selectedDate;
  TimeOfDay? _initHour;
  TimeOfDay? _endHour;

  Future<void> save(AddTaskParam param);

  Future<void> add() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    //print('add');
    final param = AddTaskParam(
        title: titleController,
        description: descriptionController.text,
        initialDate: _generateDate(time: _initHour!, date: _selectedDate),
        endDate: _generateDate(time: _endHour!, date: _selectedDate));
    await save(param);
  }

  void changeDate(DateTime newDate) {
    final value = AppFormatters.completeDay(newDate);
    dateController.text = value;
    _selectedDate = newDate;
  }

  void changeInitHour(TimeOfDay newTime) {
    final endHour = _endHour;

    if (endHour != null) {
      final initDate = _generateDate(time: newTime);
      final endDate = _generateDate(time: endHour);

      if (initDate.isAfter(endDate)) return;
    }
    final value = AppFormatters.formatHour(newTime);
    initHourController.text = value;
    _initHour = newTime;
  }

  void changeEndHour(TimeOfDay newTime) {
    final initHour = _initHour;

    if (initHour != null) {
      final initDate = _generateDate(time: initHour);
      final endDate = _generateDate(time: newTime);

      if (initDate.isAfter(endDate)) return;
    }

    final value = AppFormatters.formatHour(newTime);
    endHourController.text = value;
    _endHour = newTime;
  }

  DateTime _generateDate({
    required TimeOfDay time,
    DateTime? date,
  }) {
    final baseDate = date ?? DateTime.now();
    return baseDate.copyWith(
        hour: time.hour,
        minute: time.minute,
        second: 0,
        millisecond: 0,
        microsecond: 0);
  }
}
