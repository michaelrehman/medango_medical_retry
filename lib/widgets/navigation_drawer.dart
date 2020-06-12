import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
            onTap: () {
              Navigator.pushReplacementNamed(context, '/contacts');
            }, // GestureTapCallback
          ), // ListTile
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Messages'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/messages');
            }, // GestureTapCallback
          ), // ListTile
          ListTile(
            leading: Icon(Icons.healing),
            title: Text('Medications'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/medications');
            }, // GestureTapCallback
          ), // ListTile
          ListTile(
            leading: Icon(Icons.date_range),
            title: Text('Calendar'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/calendar');
            }, // GestureTapCallback
          ), // ListTile
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/settings');
            }, // GestureTapCallback
          ), // ListTile
        ],
      ),
    );
  } // build
} // NavigationDrawer
