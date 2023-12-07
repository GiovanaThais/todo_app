import 'package:flutter/material.dart';
import 'package:todo_app/app/controllers/form_controller.dart';
import 'package:todo_app/app/core/shared/utils/app_pickers.dart';

import '../widgets/text_field_widget.dart';

class AddTaskFormComponent extends StatelessWidget {
  const AddTaskFormComponent({
    super.key,
    required this.formController,
  });

  final FormController formController;

  Future<void> datePicker(BuildContext context) async {
    final date = await AppPickers.appDatePicker(context);
    if (date == null) return;
    formController.changeDate(date);
  }

  Future<void> initTimePicker(BuildContext context) async {
    final time = await AppPickers.appTimePicker(context);
    if (time == null) return;
    formController.changeInitHour(time);
  }

  Future<void> endTimePicker(BuildContext context) async {
    final time = await AppPickers.appTimePicker(context);
    if (time == null) return;
    formController.changeEndHour(time);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formController.formKey,
      child: Column(children: [
        TextFieldWidget(
            controller: formController.titleController, label: 'Titulo'),
        const SizedBox(
          height: 20,
        ),
        TextFieldWidget(
          controller: formController.descriptionController,
          label: 'Descrição',
          maxLines: 3,
          keyboardType: TextInputType.multiline,
        ),
        const SizedBox(
          height: 20,
        ),
        const SizedBox(
          height: 20,
        ),
        TextFieldWidget(
          controller: formController.dateController,
          label: 'Data',
          readOnly: true,
          onTap: () => datePicker(context),
        ),
        Row(
          children: [
            Expanded(
              child: TextFieldWidget(
                controller: formController.initHourController,
                label: 'Hora inicial',
                onTap: () => initTimePicker(context),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: TextFieldWidget(
                controller: formController.endHourController,
                label: 'Hora final',
                onTap: () => endTimePicker(context),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(onPressed: () {}, child: const Text('Adicionar')),
      ]),
    );
  }
}
