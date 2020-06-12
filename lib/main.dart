import 'package:flutter/material.dart';

import 'package:medango_medical_retry/themes.dart' show defaultTheme;
import 'package:medango_medical_retry/screens/login/login.dart';
import 'package:medango_medical_retry/screens/main_menu/main_menu.dart';

void main() => runApp(MedangoMedical());

class MedangoMedical extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medango Medical',
      initialRoute: '/login',
      routes: <String, WidgetBuilder>{
        '/login': (context) => Login(),
        // '/signup': (context) => SignUp(),
        '/mainmenu': (context) => MainMenu(),
        // '/contacts': (context) => Contacts(),
        // '/medications': (context) => Medications(),
        // '/calendar': (context) => Calendar(),
        // '/settings': (context) => Settings(),
      }, // Map<String, WidgetBuilder>
      theme: defaultTheme,
      debugShowCheckedModeBanner: false,
    ); // MaterialApp
  }
} // MedangoMedical
