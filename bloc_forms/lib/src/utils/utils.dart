import 'package:flutter/material.dart';

bool isNumeric(String input) {
  bool value = false;

  if (input.isNotEmpty && (num.tryParse(input) != null)) {
    value = true;
  }

  return value;
}

showAlert(BuildContext context, String message) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Información incorrecta"),
          content: Text("message"),
          actions: <Widget>[
            FlatButton(
              child: Text("Ok"),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        );
      });
}
