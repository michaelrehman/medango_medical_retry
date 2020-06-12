import 'package:flutter/material.dart';

import '../../widgets/navigation_drawer.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Messages')),
      drawer: NavigationDrawer(),
    );
  } // build
} // Messages
