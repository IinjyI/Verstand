import 'package:flutter/material.dart';

void buildSnackBar(context, String message) {
  final snackBar = SnackBar(
    content: Text(message),
    action: SnackBarAction(
      label: 'ok',
      onPressed: () {},
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
