import 'package:flutter/material.dart';

import '../../widgets/navigation_drawer.dart';

class Calendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calendar')),
      drawer: NavigationDrawer(),
    );
  } // build
} // Calendar
