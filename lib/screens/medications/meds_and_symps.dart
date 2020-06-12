import 'package:flutter/material.dart';

import 'package:medango_medical_retry/widgets/details_list.dart';
import 'package:medango_medical_retry/widgets/navigation_drawer.dart';
import 'package:medango_medical_retry/screens/medications/widgets/add_medicaiton.dart';
import 'package:medango_medical_retry/screens/medications/widgets/add_symptom.dart';

class MedsAndSymps extends StatelessWidget {
  /// Parallel array to the tabs.
  final keys = [GlobalKey<DetailsListState>(), GlobalKey<DetailsListState>()];

  @override
  Widget build(BuildContext context) {
    const tabNames = ['Medications', 'Symptoms'];

    return DefaultTabController(
      length: tabNames.length,
      child: Scaffold(
        drawer: NavigationDrawer(),
        appBar: AppBar(
          title: Text('Medications & Symptoms'),
          bottom: TabBar(
            isScrollable: true,
            tabs: <Widget>[
              for (final tab in tabNames) Tab(text: tab),
            ], // <Widget>[]
          ), // TabBar
        ), // AppBar
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => _handlePressed(context),
          ), // FloatingActionButton
        ), // Builder
        body: TabBarView(
          children: <Widget>[
            DetailsList(key: keys[0]),
            DetailsList(key: keys[1]),
          ], // <Widget>[]
        ), // TabBarView
      ), // Scaffold
    ); // DefaultTabController
  } // build

  void _handlePressed(BuildContext fabBuilderContext) async {
    final currentTabIndex = DefaultTabController.of(fabBuilderContext).index;
    final result = await showDialog(
      context: fabBuilderContext,
      builder: (context) =>
          currentTabIndex == 0 ? AddMedication() : AddSymptom(),
    );
    keys[currentTabIndex].currentState.addEntry(
      (onDelete, [_]) => DetailsEntry(
        title: '${result['name']} (${result['relation']})',
        subtitle: '${result['phone']} - ${result['email']}',
        onDelete: onDelete,
      ), // DetailsEntry
    );
  } // _handlePressed
} // Medications
