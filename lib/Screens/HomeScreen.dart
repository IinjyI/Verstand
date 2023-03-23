import 'package:flutter/material.dart';

import '../CustomWidgets/CustomButton.dart';
import '../Functions/getQuote.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String id = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          CustomButton(
              text: "get quote",
              function: () {
                getQuote();
              })
        ]));
  }
}
