import 'package:flutter/material.dart';

class CustomizedInfoItem extends StatelessWidget {
  String label;
  IconData icon;

  CustomizedInfoItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: ListTile(
          dense: false,
          onTap: () {},
          leading: Icon(
            icon,
            color: Color(0xff2952ce),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          title: Text(label),
        ),
      ),
    );
  }
}
