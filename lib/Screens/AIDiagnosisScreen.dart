import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:verstand/CustomWidgets/CustomButton.dart';

import '../Functions/DBandAuth/database.dart';
import '../Functions/DBandAuth/sharedPrefs.dart';
import '../Functions/SYSandAPI/diagnose.dart';
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
  const AIDiagnosis({Key? key}) : super(key: key);

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
                      await getImageFromGallery();
                      if (image != null) {
                        Provider.of<DiagnosisProvider>(context, listen: false)
                            .processing();

                        diagnosis = await diagnose(image);

                        Provider.of<DiagnosisProvider>(context, listen: false)
                            .done();
                        if (loggedInUser != "NotLoggedIn") {
                          Map<String, dynamic> diagnosisInfo = {
                            'diagnosis': diagnosis,
                            'timestamp': Timestamp.fromDate(DateTime.now()),
                            'imgPath': image!.path
                          };
                          int len = await getHistoryLength(loggedInUser!);
                          await storeHistory(
                              loggedInUser!, diagnosisInfo, '${len + 1}');
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
                      await getImageFromCamera();
                      if (image != null) {
                        Provider.of<DiagnosisProvider>(context, listen: false)
                            .processing();
                        diagnosis = await diagnose(image);

                        Provider.of<DiagnosisProvider>(context, listen: false)
                            .done();
                        if (loggedInUser != "NotLoggedIn") {
                          Map<String, dynamic> diagnosisInfo = {
                            'diagnosis': diagnosis,
                            'timestamp': Timestamp.fromDate(DateTime.now()),
                            'imgPath': image!.path
                          };
                          int len = await getHistoryLength(loggedInUser!);
                          await storeHistory(
                              loggedInUser!, diagnosisInfo, '${len + 1}');
                        }
                      }
                    },
                  );
                }),
                SizedBox(height: 10),
                Center(
                    child: image == null
                        ? Container()
                        : Provider.of<DiagnosisProvider>(context).isProcessing
                            ? Text('Just a sec...')
                            : Image.file(File(image!.path))),
                SizedBox(height: 10),
                Provider.of<DiagnosisProvider>(context).isProcessing
                    ? Center(child: CircularProgressIndicator())
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
