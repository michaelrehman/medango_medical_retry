import 'package:flutter/material.dart';

import 'package:medango_medical_retry/widgets/details_list.dart';
import 'package:medango_medical_retry/widgets/navigation_drawer.dart';
import 'package:medango_medical_retry/screens/contacts/widgets/add_contact.dart';

class Contacts extends StatelessWidget {
  final _detailsKey = GlobalKey<DetailsListState>();

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
          _detailsKey.currentState.addEntry(
            (onDelete, [_]) => DetailsEntry(
              title: '${result['name']} (${result['relation']})',
              subtitle: '${result['phone']} - ${result['email']}',
              onDelete: onDelete,
            ), // DetailsEntry
          );
        }, // VoidCallback,
      ), // FloatingActionButton
      body: DetailsList(key: _detailsKey),
    ); // Scaffold
  } // build
} // Contacts
