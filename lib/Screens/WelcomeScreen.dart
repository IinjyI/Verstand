import 'package:flutter/material.dart';
import 'package:verstand/Screens/HomeScreen.dart';

import 'package:verstand/Screens/SigninScreen.dart';
import 'package:verstand/Screens/SignupScreen.dart';
import '../CustomWidgets/CustomButton.dart';

///First screen if user didn't sign in/up
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static const String id = 'WelcomeScreen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Welcome(),
      ),
    );
  }
}

class Welcome extends StatelessWidget {
  const Welcome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(HomeScreen.id);
              },
              child: const Text(
                "Skip",
                style: TextStyle(color: Colors.blueGrey, fontSize: 20),
              ),
            ),
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Image.asset('assets/doctors.png'),
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            "Verstand",
            style: TextStyle(
                color: Color(0xFF12346a),
                fontSize: 40,
                fontWeight: FontWeight.bold),
          ),
          const Text(
            "Checkup on your brain",
            style: TextStyle(
                color: Color(0xFF17346a),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(
                  text: "Sign In",
                  function: () {
                    Navigator.of(context).pushNamed(SigninScreen.id);
                  }),
              CustomButton(
                  text: "Sign Up",
                  function: () {
                    Navigator.of(context).pushNamed(SignupScreen.id);
                  })
            ],
          )
        ],
      ),
    );
  }
}
