import 'dart:js';

import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo_app/app/core/services/i_overlay_service.dart';

class AsukaOverLayService implements IOverlayService {
  OverlayEntry? _entry;

  @override
  Future<void> hide() async {
    if (_entry == null) return;

    _entry!.remove();
    _entry = null;
    await Future.delayed(Duration(milliseconds: 200));
  }

  @override
  void show({Widget? child}) {
    _entry = OverlayEntry(builder: (context) {
      return Container(
        //fuhndo opaco
        color: Colors.black.withOpacity(0.3),
        alignment: Alignment.center,
        child: child ?? const CircularProgressIndicator(),
      );
    });
    Asuka.addOverlay(_entry!);
  }

  @override
  void dispose() {
    hide();
  }
}
