import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.function,
  });
  final String text;
  final VoidCallback function;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: function,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
