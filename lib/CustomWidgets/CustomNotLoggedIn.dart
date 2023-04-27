import 'package:flutter/material.dart';

import '../Screens/WelcomeScreen.dart';

class CustomNotLoggedIn extends StatelessWidget {
  const CustomNotLoggedIn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "You are not logged in",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(WelcomeScreen.id);
            },
            child: const Text(
              "Go to sign in / up",
              style: TextStyle(color: Colors.blueGrey, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
