import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:verstand/CustomWidgets/CustomButton.dart';

import '../Functions/DBandAuth/database.dart';
import '../Functions/DBandAuth/sharedPrefs.dart';
import '../Functions/SYSandAPI/processAndStore.dart';
import '../Functions/SYSandAPI/getDiagnosis.dart';
import '../Functions/SYSandAPI/pickImage.dart';
import '../Providers/diagnosisProvider.dart';

class AIDiagnosisScreen extends StatelessWidget {
  AIDiagnosisScreen({Key? key}) : super(key: key);
  static const String id = 'AIDiagnosisScreen';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => DiagnosisProvider(), child: AIDiagnosis());
  }
}

class AIDiagnosis extends StatelessWidget {
  AIDiagnosis({Key? key}) : super(key: key);
  String? diagnosis;
  XFile? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(11),
            alignment: Alignment.topCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'AI-based diagnosis',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
                ),
                Consumer<DiagnosisProvider>(builder: (_, value, child) {
                  return CustomButton(
                    text: "Choose from gallery",
                    function: () async {
                      image = await getImageFromGallery();
                      if (image != null) {
                        Provider.of<DiagnosisProvider>(context, listen: false)
                            .processing();
                        diagnosis = await getDiagnosis(image!.path);
                        if (loggedInUser != "NotLoggedIn") {
                          Map<String, dynamic> diagnosisInfo = {
                            'diagnosis': diagnosis,
                            'timestamp': Timestamp.fromDate(DateTime.now()),
                            'imgPath': image!.path
                          };
                          int len = await getHistoryLength(loggedInUser!);
                          await storeHistoryItem(
                              loggedInUser!, diagnosisInfo, '${len + 1}');
                          Provider.of<DiagnosisProvider>(context, listen: false)
                              .done();
                        }
                      }
                    },
                  );
                }),
                SizedBox(height: 10),
                Consumer<DiagnosisProvider>(builder: (_, value, child) {
                  return CustomButton(
                    text: "Choose from camera",
                    function: () async {
                      image = await getImageFromCamera();
                      diagnosis = await getDiagnosis(image!.path);
                    },
                  );
                }),
                SizedBox(height: 10),
                Center(
                  child: Provider.of<DiagnosisProvider>(
                    context,
                  ).isProcessing
                      ? Text('Just a sec...')
                      : image == null
                          ? Container()
                          : Image.file(
                              File(image!.path),
                            ),
                ),
                SizedBox(height: 10),
                Provider.of<DiagnosisProvider>(context).isProcessing
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Text(
                        diagnosis != null ? ' diagnosis: $diagnosis' : ' ',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
