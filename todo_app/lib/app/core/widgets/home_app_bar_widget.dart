import 'package:flutter/material.dart';
import 'package:todo_app/app/core/shared/utils/app_pickers.dart';

typedef TapDateCallback = void Function(DateTime);

class HomeAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBarWidget(
      {super.key,
      required this.title,
      required this.onTitleTap,
      required this.onNextTap,
      required this.onPreviousTap});

  final Widget title;
  final TapDateCallback onTitleTap;
  final VoidCallback onNextTap; //final void function()
  final VoidCallback onPreviousTap;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  Future<void> openDatePicker(BuildContext context) async {
    final date = await AppPickers.appDatePicker(context);

    if (date == null) return;

    onTitleTap(date);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.keyboard_arrow_left_rounded),
            onPressed: onPreviousTap,
          ),
          GestureDetector(
            onTap: () => openDatePicker(context),
            child: title,
          ),
          IconButton(
            icon: const Icon(Icons.keyboard_arrow_right_rounded),
            onPressed: onNextTap,
          ),
        ],
      ),
    );
  }
}
