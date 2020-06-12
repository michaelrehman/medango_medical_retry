import 'package:flutter/material.dart';

typedef DetailsEntry ConstructDetailsEntry(Map<String, String> data);

class DetailsEntry extends StatelessWidget {
  final String title;
  final String subtitle;

  DetailsEntry({Key key, @required this.title, this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: PopupMenuButton(
        itemBuilder: (context) => <PopupMenuEntry>[
          const PopupMenuItem(
            value: null,
            child: Text('Edit'),
          ), // PopupMenuItem
          const PopupMenuItem(
            value: null,
            child: Text('Delete'),
          ), // PopupMenuItem
        ], // <PopupMenuEntry>[]
      ), // PopupMenuButton
      contentPadding: EdgeInsets.all(15),
      isThreeLine: true,
      title: Text(
        title,
        softWrap: false,
        overflow: TextOverflow.ellipsis,
        style:
            Theme.of(context).textTheme.headline4.copyWith(color: Colors.black),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.grey),
      ),
    ); // ListTile
  } // build
} // DetailsEntry

class DetailsList extends StatefulWidget {
  DetailsList({Key key}) : super(key: key);

  @override
  DetailsListState createState() => DetailsListState();
}

class DetailsListState extends State<DetailsList> {
  /// List of [DetailsEntry] and a corresponding [Divider].
  List<dynamic> entries = [];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[...entries],
    ); // ListView
  } // build

  void addEntry(ConstructDetailsEntry constructor, Map<String, String> data) {
    setState(() => entries.addAll([constructor(data), Divider()]));
  } // addEntry
} // _DetailsListState
