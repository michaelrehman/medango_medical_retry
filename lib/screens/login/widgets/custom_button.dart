import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;

  final Color buttonColor;
  final Color textColor;

  final String label;
  final IconData icon;

  CustomButton({
    @required this.onPressed,
    @required this.buttonColor,
    @required this.textColor,
    @required this.label,
    @required this.icon,
  }); // CustomButton

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 40,
      minWidth: 150,
      buttonColor: buttonColor,
      child: RaisedButton.icon(
        textColor: textColor,
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ), // TextStyle
        ), // Text
      ), // RaisedButton.icon
    ); // ButtonTheme
  } // build
} // CustomButton
