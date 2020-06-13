import 'package:flutter/material.dart';

import 'package:medango_medical_retry/widgets/validated_text_form_field.dart';

class AddContact extends StatefulWidget {
  static const relationships = [
    'Mother',
    'Father',
    'Step-Mother',
    'Step-Father',
    'Grandmother',
    'Grandfather',
    'Sibling',
    'Granddaughter',
    'Grandson',
    'Friend',
    'Other'
  ];

  AddContact({Key key}) : super(key: key);

  @override
  _AddContactState createState() => _AddContactState();
} // AddContact

class _AddContactState extends State<AddContact> {
  final _formKey = GlobalKey<FormState>();
  String selectedRelationship = AddContact.relationships.first;

  final controllers = {
    'name': TextEditingController(),
    'phone': TextEditingController(),
    'email': TextEditingController(),
  };

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: _formKey,
        autovalidate: true,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ValidatedTextFormField(
              labelText: 'Name',
              controller: controllers['name'],
            ), // ValidatedTextFormField
            ValidatedTextFormField(
              labelText: 'Phone Number',
              keyboardType: TextInputType.phone,
              controller: controllers['phone'],
            ), // ValidatedTextFormField
            ValidatedTextFormField(
              labelText: 'Email',
              keyboardType: TextInputType.emailAddress,
              controller: controllers['email'],
            ), // ValidatedTextFormField
            DropdownButton<String>(
              value: selectedRelationship,
              onChanged: (newValue) {
                setState(() => selectedRelationship = newValue);
              }, // ValueChanged<String>
              items: AddContact.relationships.map((String relation) {
                return DropdownMenuItem<String>(
                  value: relation,
                  child: Text(relation),
                ); // DropdownMenuItem<String>
              }).toList(),
            ), // DropdownButton
          ], // <Widget>[]
        ),
      ), // Form
      actions: <Widget>[
        FlatButton(
          child: Text('Submit'),
          // title: '${result['name']} (${result['relation']})',
          // subtitle: '${result['phone']} - ${result['email']}',
          onPressed: () {
            if (_formKey.currentState.validate()) {
              final values = {
                'title': '${controllers['name'].text} ($selectedRelationship)',
                'subtitle': '${controllers['phone'].text}'
                    ' - ${controllers['email'].text}',
              };
              Navigator.pop(context, values);
            } // if
          }, // VoidCallback
        ), // FlatButton
      ], // <Widget>[]
    ); // AlertDialog
  } // build

  @override
  void dispose() {
    controllers.forEach((_, value) => value.dispose());
    super.dispose();
  } // dispose
} // AddContact
