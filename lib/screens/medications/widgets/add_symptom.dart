import 'package:flutter/material.dart';

import 'package:medango_medical_retry/widgets/validated_text_form_field.dart';

class AddSymptom extends StatefulWidget {
  static const symptoms = [
    'Abdominal Pain',
    'Blurry Vision/Difficulty Seeing',
    'Chest Pain',
    'Congestion',
    'Constipation',
    'Cough',
    'Diarrhea',
    'Difficulty Swallowing',
    'Dizziness',
    'Earache',
    'Eye Discomfort/Redness',
    'Fever',
    'Foot/Leg Swelling',
    'Headaches',
    'Heart Palpatations',
    'Joint/Muscle Pain',
    'Mirgraines',
    'Nausea or Vomiting',
    'Neck Pain',
    'Other Pain',
    'Pelvic Pain',
    'Rash',
    'Shortness of Breath',
    'Sore Throat',
    'Urinary Problems',
    'Wheezing',
    'Other',
  ];

  @override
  _AddSymptomState createState() => _AddSymptomState();
} // AddSymptom

class _AddSymptomState extends State<AddSymptom> {
  final _formKey = GlobalKey<FormState>();
  final detailsController = TextEditingController();
  String selectedSymptom = AddSymptom.symptoms.first;
  DateTime startDate = DateTime.now().toLocal();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: _formKey,
        autovalidate: true,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            DropdownButton(
              value: selectedSymptom,
              onChanged: (newValue) {
                setState(() => selectedSymptom = newValue);
              }, // ValueChanged<String>
              items: AddSymptom.symptoms.map((String symptom) {
                return DropdownMenuItem<String>(
                  value: symptom,
                  child: Text(symptom),
                ); // DropdownMenuItem<String>
              }).toList(),
            ), // DropdownButton
            ValidatedTextFormField(
              labelText: 'Other information',
              controller: detailsController,
            ), // ValidatedTextFormField
            TextFormField(
              decoration: InputDecoration(
                labelText: startDate?.toString(),
                labelStyle: TextStyle(color: Colors.black),
                helperText: 'The day you started feeling this symptom.',
              ), // InputDecoration
              onTap: () async {
                FocusScope.of(context).requestFocus(new FocusNode());
                final now = DateTime.now().toLocal();
                final result = await showDatePicker(
                  context: context,
                  initialDate: now,
                  firstDate: DateTime.fromMillisecondsSinceEpoch(0),
                  lastDate: now,
                );
                setState(() => startDate = result);
              }, // GestureTapCallback
            ), // TextFormField
          ], // <Widget>[]
        ), // Column
      ), // Form
      actions: <Widget>[
        FlatButton(
          child: Text('Submit'),
          onPressed: () {
            if (_formKey.currentState.validate()) {
              final values = {
                'title': selectedSymptom,
                'subtitle': '${detailsController.text}\n${startDate.toLocal()}',
              };
              Navigator.pop(context, values);
            } // if
          }, // VoidCallback
        ), // FlatButton
      ], // <Widget>[]
    ); // AlertDialog
  } // build
} // _AddSymptomState
