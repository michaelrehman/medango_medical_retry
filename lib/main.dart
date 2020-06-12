import 'package:flutter/material.dart';

import './themes.dart' show defaultTheme;
import './screens/login/login.dart';
import './screens/contacts/contacts.dart';
import './screens/messages/messages.dart';
import './screens/medications/medications.dart';
import './screens/calendar/calendar.dart';
import './screens/settings/settings.dart';

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
        '/medications': (context) => Medications(),
        '/calendar': (context) => Calendar(),
        '/settings': (context) => Settings(),
      }, // Map<String, WidgetBuilder>
      theme: defaultTheme,
      debugShowCheckedModeBanner: false,
    ); // MaterialApp
  }
} // MedangoMedical
