import 'package:flutter/material.dart';

import '../../widgets/navigation_drawer.dart';

class Contacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contacts')),
      drawer: NavigationDrawer(),
    );
  } // build
} // Contacts
