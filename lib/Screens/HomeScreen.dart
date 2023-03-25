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

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(10),
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
              )
      ]),
    );
  }
}
