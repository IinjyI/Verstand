import 'package:cloud_firestore/cloud_firestore.dart';

import 'database.dart';
import 'sharedPrefs.dart';

Future<void> mapAndStore(diagnosis, imagePath) async {
  if (loggedInUser != "NotLoggedIn") {
    Map<String, dynamic> diagnosisInfo = {
      'diagnosis': diagnosis,
      'timestamp': Timestamp.fromDate(DateTime.now()),
      'imgPath': imagePath
    };
    int len = await getHistoryLength(loggedInUser!);
    await storeHistoryItem(loggedInUser!, diagnosisInfo, '${len + 1}');
  }
}
