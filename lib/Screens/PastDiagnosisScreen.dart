import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PastDiagnosisScreen extends StatelessWidget {
  const PastDiagnosisScreen(
      {Key? key,
      required this.pastDiagnosis,
      required this.pastImgPath,
      required this.pastTime})
      : super(key: key);
  final String pastDiagnosis;
  final String pastImgPath;
  final Timestamp pastTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(11),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Info:',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 35),
                ),
                const SizedBox(
                  height: 15,
                ),
                Image.file(
                  File(pastImgPath),
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 10),
                Text(
                  pastDiagnosis,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  DateTime.fromMicrosecondsSinceEpoch(
                          pastTime.microsecondsSinceEpoch)
                      .toString()
                      .substring(0, 19),
                  style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.indigo),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
