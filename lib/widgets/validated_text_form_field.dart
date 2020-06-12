import 'package:flutter/material.dart';

String _textValidator(String value) {
  if (value.isEmpty) {
    return 'Must be non-empty.';
  } // if
  return null;
} // _textValidator

class ValidatedTextFormField extends StatelessWidget {
  final String labelText;
  final TextInputType keyboardType;
  final TextEditingController controller;

  ValidatedTextFormField({
    this.controller,
    @required this.labelText,
    this.keyboardType = TextInputType.text,
  }); // ValidatedTextFormField

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: _textValidator,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
      ), // InputDecoration
    ); // TextFormField
  } // build
} // ValidatedTextFormField
