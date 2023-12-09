import 'package:flutter/material.dart';
import 'package:todo_app/app/core/shared/utils/app_formatters.dart';

class FormController {
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

  Future<void> add() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    print('add');
  }

  void changeDate(DateTime newDate) {
    final value = AppFormatters.completeDay(newDate);
    dateController.text = value;
  }

  void changeInitHour(TimeOfDay newTime) {
    final value = AppFormatters.formatHour(newTime);
    initHourController.text = value;
  }

  void changeEndHour(TimeOfDay newTime) {
    final value = AppFormatters.formatHour(newTime);
    endHourController.text = value;
  }
}
