import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CustomHistoryItem extends StatelessWidget {
  final String pastDiagnosis;
  final Timestamp time;
  final int index;
  CustomHistoryItem({
    required this.pastDiagnosis,
    required this.time,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            '${index + 1}',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pastDiagnosis,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  DateTime.fromMicrosecondsSinceEpoch(
                          time.microsecondsSinceEpoch)
                      .toString()
                      .substring(0, 19),
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.indigo),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
