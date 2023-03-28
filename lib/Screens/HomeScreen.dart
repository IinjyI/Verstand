import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:verstand/Functions/DBandAuth/database.dart';

import '../CustomWidgets/CustomHistoryItem.dart';
import '../CustomWidgets/CustomNotLoggedIn.dart';
import '../Functions/DBandAuth/sharedPrefs.dart';
import 'WelcomeScreen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  static const String id = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return loggedInUser != "NotLoggedIn"
        ? SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(11),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello, $loggedInUser!',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 35),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'History:',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: Colors.black45),
                      ),
                      FutureBuilder<
                          List<QueryDocumentSnapshot<Map<String, dynamic>>>>(
                        future: getHistory(loggedInUser),
                        builder: (context, snapshot) => snapshot.hasData
                            ? ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: snapshot.data!.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return CustomHistoryItem(
                                    index: index,
                                    pastDiagnosis: snapshot.data![index]
                                        .data()['diagnosis'],
                                    time: snapshot.data![index]
                                        .data()['timestamp'],
                                  );
                                })
                            : Center(
                                child: CircularProgressIndicator(),
                              ),
                      ),
                    ])),
          )
        : CustomNotLoggedIn();
  }
}
