import 'package:flutter/material.dart';

void buildSnackBar(context, String message) {
  final snackBar = SnackBar(
    content: Text('$message'),
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {},
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
