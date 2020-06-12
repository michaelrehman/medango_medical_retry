import 'package:flutter/material.dart';

import '../../widgets/navigation_drawer.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      drawer: NavigationDrawer(),
    );
  } // build
} // Settings
