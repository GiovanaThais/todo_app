import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app/core/theme/app_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/home/');
    //final key = GlobalKey<NavigatorState>();
    //key.currentState.pushNamed(routeName) //sem o modular
    //Modular.setNavigatorKey(key); //sem o modular

    return MaterialApp.router(
      //navigatorKey: key, //sem o modular
      //add route because modular lib
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      theme: AppTheme.light,
      // This is the theme of your application.
      debugShowCheckedModeBanner: false,
      //home: HomePage(),
      locale: const Locale('pt', 'BR'),
      supportedLocales: const [Locale('pt', 'BR')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
    );
  }
}
