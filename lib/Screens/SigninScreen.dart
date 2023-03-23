import 'package:flutter/material.dart';
import 'package:verstand/Screens/HomeScreen.dart';

import '../CustomWidgets/CustomButton.dart';

class SigninScreen extends StatelessWidget {
  static const String id = 'SigninScreen';

  const SigninScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Signin(),
      ),
    );
  }
}

class Signin extends StatelessWidget {
  const Signin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(10),
      child: Column(children: [
        CustomButton(
            text: "go to home",
            function: () {
              Navigator.of(context).pushNamed(HomeScreen.id);
            }),
      ]),
    );
  }
}
