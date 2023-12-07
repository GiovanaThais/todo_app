import 'package:flutter/material.dart';
import 'package:todo_app/app/controllers/form_controller.dart';

import '../widgets/text_field_widget.dart';

class AddTaskFormComponent extends StatelessWidget {
  const AddTaskFormComponent({
    super.key,
    required this.formController,
  });

  final FormController formController;

  Future<void> datePicker(BuildContext context) async {
    final now = DateTime.now();
    final date = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: now,
        lastDate: now.add(const Duration(days: 30)));
    if (date == null) return;
    formController.changeDate(date);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
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
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: TextFieldWidget(
                controller: formController.endHourController,
                label: 'Hora final',
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
