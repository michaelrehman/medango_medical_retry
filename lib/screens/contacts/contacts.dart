import 'package:flutter/material.dart';

import '../../widgets/navigation_drawer.dart';
import '../../widgets/details_list.dart';
import './widgets/add_contact.dart';

class Contacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contacts')),
      drawer: NavigationDrawer(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final result = await showDialog(
            context: context,
            builder: (context) => AddContact(),
          );
        }, // VoidCallback
      ), // FloatingActionButton
      body: DetailsList(),
    ); // Scaffold
  } // build
} // Contacts
