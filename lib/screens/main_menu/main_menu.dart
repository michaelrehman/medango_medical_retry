import 'package:flutter/material.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome')),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ), // BoxDecoration
              child: Text(
                'John Doe',
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ), // TextStyle
              ), // Text
            ), // DrawerHeader
            ListTile(
              leading: Icon(Icons.contacts),
              title: Text('Contacts'),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            ListTile(
              leading: Icon(Icons.healing),
              title: Text('Medications'),
            ),
            ListTile(
              leading: Icon(Icons.date_range),
              title: Text('Calendar'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
    );
  } // build
} // MainMenu
