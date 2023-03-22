import 'dart:io';

import 'package:flutter/material.dart';
import '../Functions/diagnose.dart';
import 'package:image_picker/image_picker.dart';

class AIDiagnosisScreen extends StatefulWidget {
  AIDiagnosisScreen({Key? key}) : super(key: key);
  static const String id = 'AIDiagnosisScreen';

  @override
  State<AIDiagnosisScreen> createState() => _AIDiagnosisScreenState();
}

class _AIDiagnosisScreenState extends State<AIDiagnosisScreen> {
  ImagePicker picker = ImagePicker();

  XFile? image;

  String? d;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Image Picker from Gallery"),
            backgroundColor: Colors.redAccent),
        body: Container(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () async {
                      image =
                          await picker.pickImage(source: ImageSource.gallery);
                      setState(() {
                        //update UI
                      });
                      d = await diagnose(image);
                      setState(() {});
                    },
                    child: Text("Pick Image")),
                image == null ? Container() : Image.file(File(image!.path)),
                d == null
                    ? Container()
                    : Text(
                        d!,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      )
              ],
            )));
  }
}
