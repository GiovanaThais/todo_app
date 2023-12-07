import 'package:flutter/material.dart';

import '../widgets/text_field_widget.dart';

class AddTaskFormComponent extends StatelessWidget {
  const AddTaskFormComponent({
    super.key,
  });
  void datePicker(BuildContext context) {
    final now = DateTime.now();
    showDatePicker(
        context: context,
        initialDate: now,
        firstDate: now,
        lastDate: now.add(const Duration(days: 30)));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(children: [
        TextFieldWidget(controller: TextEditingController(), label: 'Titulo'),
        const SizedBox(
          height: 20,
        ),
        TextFieldWidget(
          controller: TextEditingController(),
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
          controller: TextEditingController(),
          label: 'Data',
          readOnly: true,
          onTap: () => datePicker(context),
        ),
        Row(
          children: [
            Expanded(
              child: TextFieldWidget(
                controller: TextEditingController(),
                label: 'Hora inicial',
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: TextFieldWidget(
                controller: TextEditingController(),
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
