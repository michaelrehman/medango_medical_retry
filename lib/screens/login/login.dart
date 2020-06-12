import 'package:flutter/material.dart';

import 'package:medango_medical_retry/screens/login/widgets/custom_button.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Medango Medical')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            children: <Widget>[
              Spacer(flex: 1),
              Expanded(
                flex: 4,
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person_outline),
                        labelText: 'Email',
                      ), // InputDecoration
                    ), // TextField
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline),
                        labelText: 'Password',
                      ), // InputDecoration
                    ), // TextField
                  ], // <Widget>[]
                ), // Column
              ), // Expanded
              Spacer(flex: 1),
            ], // <Widget>[]
          ), // Row
          Row(
            children: <Widget>[
              Spacer(flex: 2),
              Expanded(
                flex: 4,
                child: Column(
                  children: <Widget>[
                    CustomButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/mainmenu');
                      }, // VoidCallback
                      buttonColor: Theme.of(context).primaryColor,
                      textColor: Theme.of(context).secondaryHeaderColor,
                      icon: Icons.send,
                      label: 'Login',
                    ), // CustomButton
                    CustomButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      }, // VoidCallback
                      buttonColor: Theme.of(context).secondaryHeaderColor,
                      textColor: Theme.of(context).primaryColor,
                      icon: Icons.assignment,
                      label: 'Sign Up',
                    ), // CustomButton
                  ], // <Widget>[]
                ), // Column
              ), // Expanded
              Spacer(flex: 2),
            ], // <Widget>[]
          ), // Row
        ], // <Widget>[]
      ),
    ); // Scaffold
  } // build
} // Login
