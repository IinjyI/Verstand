import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:verstand/Functions/SYSandAPI/pickImage.dart';

import '../../Providers/diagnosisProvider.dart';
import '../DBandAuth/database.dart';
import '../DBandAuth/sharedPrefs.dart';
import 'getDiagnosis.dart';

Future<void> diagnoseAndStore(context) async {
  if (image != null) {
    Provider.of<DiagnosisProvider>(context, listen: false).processing();
    diagnosis = await getDiagnosis(image);

    if (loggedInUser != "NotLoggedIn") {
      Map<String, dynamic> diagnosisInfo = {
        'diagnosis': diagnosis,
        'timestamp': Timestamp.fromDate(DateTime.now()),
        'imgPath': image!.path
      };
      int len = await getHistoryLength(loggedInUser!);
      await storeHistoryItem(loggedInUser!, diagnosisInfo, '${len + 1}');
    }
    Provider.of<DiagnosisProvider>(context, listen: false).done();
  }
}
