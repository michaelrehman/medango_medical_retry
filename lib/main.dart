import 'package:flutter/material.dart';

import 'package:medango_medical_retry/themes.dart' show defaultTheme;
import 'package:medango_medical_retry/screens/login/login.dart';
import 'package:medango_medical_retry/screens/contacts/contacts.dart';
import 'package:medango_medical_retry/screens/messages/messages.dart';
import 'package:medango_medical_retry/screens/medications/meds_and_symps.dart';
import 'package:medango_medical_retry/screens/calendar/calendar.dart';
import 'package:medango_medical_retry/screens/settings/settings.dart';

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
        '/contacts': (context) => Contacts(),
        '/messages': (context) => Messages(),
        '/medications': (context) => MedsAndSymps(),
        '/calendar': (context) => Calendar(),
        '/settings': (context) => Settings(),
      }, // Map<String, WidgetBuilder>
      theme: defaultTheme,
      debugShowCheckedModeBanner: false,
    ); // MaterialApp
  } // build
} // MedangoMedical
