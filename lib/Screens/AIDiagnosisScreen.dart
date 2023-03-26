import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:verstand/CustomWidgets/CustomButton.dart';

import '../Functions/DBandAuth/database.dart';
import '../Functions/DBandAuth/sharedPrefs.dart';
import '../Functions/SYSandAPI/pickImage.dart';

class AIDiagnosisScreen extends StatefulWidget {
  AIDiagnosisScreen({Key? key}) : super(key: key);
  static const String id = 'AIDiagnosisScreen';

  ///use deep learning model to predict if user is unhealthy

  @override
  State<AIDiagnosisScreen> createState() => _AIDiagnosisScreenState();
}

class _AIDiagnosisScreenState extends State<AIDiagnosisScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("AI based diagnosis"),
          backgroundColor: Colors.blueAccent),
      body: SafeArea(child: AIDiagnosis()),
    );
  }
}

class AIDiagnosis extends StatefulWidget {
  const AIDiagnosis({Key? key}) : super(key: key);

  @override
  State<AIDiagnosis> createState() => _AIDiagnosisState();
}

class _AIDiagnosisState extends State<AIDiagnosis> {
  bool processing = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          CustomButton(
            text: "Choose from gallery",
            function: () async {
              setState(() {
                processing = true;
              });
              await sendImageFromGallery();
              if (loggedInUser != "NotLoggedIn") {
                Map<String, dynamic> diagnosisInfo = {
                  'diagnosis': diagnosis,
                  'timestamp': Timestamp.fromDate(DateTime.now()),
                };

                await storeHistory(loggedInUser!, diagnosisInfo, '${count++}');
              }
              setState(() {
                processing = false;
              });
            },
          ),
          SizedBox(height: 10),
          CustomButton(
            text: "Choose from camera",
            function: () async {
              setState(() {
                processing = true;
              });
              await sendImageFromCamera();
              if (loggedInUser != "NotLoggedIn") {
                Map<String, dynamic> diagnosisInfo = {
                  'diagnosis': diagnosis,
                  'timestamp': Timestamp.fromDate(DateTime.now()),
                };

                await storeHistory(loggedInUser!, diagnosisInfo, '${count++}');
              }
              setState(() {
                processing = false;
              });
            },
          ),
          SizedBox(height: 10),
          image == null ? Container() : Image.file(File(image!.path)),
          SizedBox(height: 10),
          processing
              ? CircularProgressIndicator()
              : Text(
                  diagnosis,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
        ],
      ),
    );
  }
}
