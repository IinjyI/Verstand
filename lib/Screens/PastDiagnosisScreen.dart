import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PastDiagnosisScreen extends StatelessWidget {
  PastDiagnosisScreen(
      {Key? key,
      required this.pastDiagnosis,
      required this.pastImgPath,
      required this.pastTime})
      : super(key: key);
  static const String id = 'PastDiagnosisScreen';
  final String pastDiagnosis;
  final String pastImgPath;
  final Timestamp pastTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.file(File(pastImgPath)),
              SizedBox(height: 10),
              Text(
                pastDiagnosis,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                DateTime.fromMicrosecondsSinceEpoch(
                        pastTime.microsecondsSinceEpoch)
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
      ),
    );
  }
}
