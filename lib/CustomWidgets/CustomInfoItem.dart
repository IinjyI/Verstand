import 'package:flutter/material.dart';

class CustomizedInfoItem extends StatelessWidget {
  String label;
  IconData icon;

  CustomizedInfoItem({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: ListTile(
          dense: false,
          onTap: () {},
          leading: Icon(
            icon,
            color: const Color(0xff2952ce),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          title: Text(label),
        ),
      ),
    );
  }
}
