import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    required this.icon,
    required this.labelText,
    required this.validator,
    required this.controller,
    this.prefix = Icons.account_circle_rounded,
    this.obscure = false,
  });

  final IconData icon;
  final String labelText;
  bool obscure;
  String? Function(String?) validator;
  final TextEditingController controller;
  IconData prefix;
  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        obscureText: widget.obscure,
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            child: Icon(widget.prefix),
            onTap: () {
              setState(() {
                widget.obscure = !widget.obscure;
                widget.prefix == Icons.remove_red_eye_outlined
                    ? widget.prefix = Icons.remove_red_eye
                    : widget.prefix = Icons.remove_red_eye_outlined;
              });
            },
          ),
          labelText: widget.labelText,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              widget.icon,
              size: 30,
              color: const Color(0xff2952ce),
            ),
          ),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
