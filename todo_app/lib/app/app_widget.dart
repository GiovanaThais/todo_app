import 'package:flutter/material.dart';
import 'package:todo_app/app/pages/home_page.dart';
import 'package:todo_app/app/theme/app_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.light,
      // This is the theme of your application.
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
