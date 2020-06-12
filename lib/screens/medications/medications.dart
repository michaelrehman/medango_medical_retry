import 'package:flutter/material.dart';

import '../../widgets/navigation_drawer.dart';

class Medications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Medications')),
      drawer: NavigationDrawer(),
    );
  } // build
} // Medications
