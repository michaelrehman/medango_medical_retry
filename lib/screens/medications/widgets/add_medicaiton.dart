import 'package:flutter/material.dart';

import 'package:medango_medical_retry/widgets/validated_text_form_field.dart';

class AddMedication extends StatefulWidget {
  static const dosages = ['mg', 'g', 'mL', 'drops'];

  static const frequencies = ['a day', 'a week', 'a month', 'a year'];

  @override
  _AddMedicationState createState() => _AddMedicationState();
} // AddMedication

class _AddMedicationState extends State<AddMedication> {
  final _formKey = GlobalKey<FormState>();
  String selectedDosage = AddMedication.dosages.first;
  String selectedFrequency = AddMedication.frequencies.first;

  final controllers = {
    'medication': TextEditingController(),
    'dosage': TextEditingController(),
    'frequency': TextEditingController()
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
              labelText: 'Medication',
              controller: controllers['medication'],
            ), // ValidatedTextFormField
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: ValidatedTextFormField(
                    labelText: 'Dosage',
                    controller: controllers['dosage'],
                    keyboardType: TextInputType.number,
                  ), // ValidatedTextFormField
                ), // Expanded
                Expanded(
                  flex: 1,
                  child: DropdownButton(
                    value: selectedDosage,
                    onChanged: (newValue) {
                      setState(() => selectedDosage = newValue);
                    }, // ValueChanged<String>
                    items: AddMedication.dosages.map((String dosageUnit) {
                      return DropdownMenuItem<String>(
                        value: dosageUnit,
                        child: Text(dosageUnit),
                      ); // DropdownMenuItem<String>
                    }).toList(),
                  ), // DropDownButton
                ), // Expanded
              ], // <Widget>[]
            ), // Row
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: ValidatedTextFormField(
                    labelText: 'Frequency',
                    controller: controllers['frequency'],
                    keyboardType: TextInputType.number,
                  ), // ValidatedTextFormField
                ), //Expanded
                Expanded(
                  flex: 1,
                  child: DropdownButton(
                    value: selectedFrequency,
                    onChanged: (newValue) {
                      setState(() => selectedFrequency = newValue);
                    }, // ValueChanged<String>
                    items:
                        AddMedication.frequencies.map((String frequencyUnit) {
                      return DropdownMenuItem<String>(
                        value: frequencyUnit,
                        child: Text(frequencyUnit),
                      ); // DropdownMenuItem<String>
                    }).toList(),
                  ), // DropDownButton
                ), // Expanded
              ], // <Widget>[]
            ), // Row
          ], // <Widget>[]
        ), // Column
      ), // Form
      actions: <Widget>[
        FlatButton(
          child: Text('Submit'),
          onPressed: () {
            if (_formKey.currentState.validate()) {
              final values = {
                'title': controllers['medication'].text,
                'subtitle': '${controllers['dosage'].text}$selectedDosage'
                    ' - ${controllers['frequency'].text} $selectedFrequency',
              };
              Navigator.pop(context, values);
            } // if
          }, // VoidCallback
        ), // FlatButton
      ], // <Widget>[]
    ); // AlertDialog
  } // build
} // _AddMedicationState
