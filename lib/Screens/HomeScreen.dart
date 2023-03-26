import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:verstand/Functions/DBandAuth/database.dart';

import '../CustomWidgets/CustomButton.dart';
import '../CustomWidgets/CustomHistoryItem.dart';
import '../Functions/DBandAuth/sharedPrefs.dart';
import '../Functions/SYSandAPI/getQuote.dart';

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
    return SingleChildScrollView(
      child: Column(children: [
        CustomButton(
            text: "get quote",
            function: () async {
              await getQuote();
              setState(() {});
            }),
        quote == null
            ? Container()
            : Text(
                quote!,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
        author == null
            ? Container()
            : Text(
                author!,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
        Text(
          loggedInUser!,
        ),
        FutureBuilder<List<QueryDocumentSnapshot<Map<String, dynamic>>>>(
          future: getHistory(loggedInUser),
          builder: (context, snapshot) => snapshot.hasData
              ? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return CustomHistoryItem(
                      index: index,
                      pastDiagnosis: snapshot.data![index].data()['diagnosis'],
                      time: snapshot.data![index].data()['timestamp'],
                    );
                  })
              : Center(
                  child: CircularProgressIndicator(),
                ),
        )
      ]),
    );
  }
}
