import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:verstand/Screens/PastDiagnosisScreen.dart';

class CustomHistoryItem extends StatelessWidget {
  final String pastDiagnosis;
  final String pastImgPath;
  final Timestamp pastTime;
  final int index;

  const CustomHistoryItem({
    super.key,
    required this.pastDiagnosis,
    required this.index,
    required this.pastImgPath,
    required this.pastTime,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PastDiagnosisScreen(
                    pastDiagnosis: pastDiagnosis,
                    pastImgPath: pastImgPath,
                    pastTime: pastTime)));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(
              '${index + 1}',
              style: const TextStyle(
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
          ],
        ),
      ),
    );
  }
}
