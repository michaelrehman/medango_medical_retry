import 'package:flutter/material.dart';

typedef DetailsEntry ConstructDetailsEntry(DeleteDetailsEntry onDelete, [Map<String, String> data]);
typedef void DeleteDetailsEntry(DetailsEntry entry);

enum PopupMenuActions { edit, delete }

class DetailsEntry extends StatelessWidget {
  final String title;
  final String subtitle;

  final DeleteDetailsEntry onDelete;

  DetailsEntry({@required this.title, this.subtitle, @required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: PopupMenuButton(
        itemBuilder: (context) => <PopupMenuEntry>[
          const PopupMenuItem(
            value: PopupMenuActions.edit,
            child: Text('Edit'),
          ), // PopupMenuItem
          const PopupMenuItem(
            value: PopupMenuActions.delete,
            child: Text('Delete'),
          ), // PopupMenuItem
        ], // <PopupMenuEntry>[]
        onSelected: (value) {
          if (value == PopupMenuActions.delete) {
            onDelete(this);
          } // if
        }, // PopupMenuItemSelected
      ), // PopupMenuButton
      contentPadding: EdgeInsets.all(15),
      isThreeLine: true,
      title: Text(
        title,
        softWrap: false,
        overflow: TextOverflow.ellipsis,
        style:
            Theme.of(context).textTheme.headline4.copyWith(color: Colors.black),
      ), // Text
      subtitle: Text(
        subtitle,
        style:
            Theme.of(context).textTheme.headline6.copyWith(color: Colors.grey),
      ), // Text
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

  void addEntry(ConstructDetailsEntry constructor, [Map<String, String> data]) {
    if (data != null) {
      setState(() => entries.addAll([constructor(removeEntry, data), Divider()]));
    } else {
      setState(() => entries.addAll([constructor(removeEntry), Divider()]));
    } // if
  } // addEntry

  void removeEntry(DetailsEntry entry) {
    setState(() {
      final index = entries.indexOf(entry);
      entries.removeAt(index);
      entries.removeAt(index); // Remove the Divider as well
    });
  } // removeEntry
} // _DetailsListState
