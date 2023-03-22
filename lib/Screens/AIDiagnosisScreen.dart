import 'dart:io';
import 'package:flutter/material.dart';
import 'package:verstand/CustomWidgets/CustomButton.dart';
import 'package:image_picker/image_picker.dart';

import '../Functions/pickImage.dart';

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
      body: Container(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            CustomButton(
              text: "Choose from gallery",
              function: () async {
                await sendImageFromGallery();
                setState(() {});
              },
            ),
            SizedBox(height: 10),
            CustomButton(
                text: "Choose from camera",
                function: () async {
                  await sendImageFromCamera();
                  setState(() {});
                }),
            SizedBox(height: 10),
            image == null ? Container() : Image.file(File(image!.path)),
            SizedBox(height: 10),
            diagnosis == null
                ? Container()
                : Text(
                    diagnosis!,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
