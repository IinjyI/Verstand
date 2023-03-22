import 'package:flutter/material.dart';

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
    return Container();
  }
}
