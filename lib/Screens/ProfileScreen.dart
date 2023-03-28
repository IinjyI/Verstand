import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:verstand/Functions/DBandAuth/sharedPrefs.dart';

import '../CustomWidgets/CustomButton.dart';
import '../CustomWidgets/CustomInfoItem.dart';
import '../CustomWidgets/CustomNotLoggedIn.dart';
import '../Functions/DBandAuth/database.dart';
import '../Functions/DBandAuth/firebaseAuth.dart';
import 'WelcomeScreen.dart';

/// User info,
/// sign out
///
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const String id = 'ProfileScreen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Profile(),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return loggedInUser != "NotLoggedIn"
        ? Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                future: getUserInformation(loggedInUser),
                builder: (c, snapshot) => snapshot.hasData
                    ? Column(
                        children: [
                          CustomizedInfoItem(
                            icon: Icons.person,
                            label: snapshot.data!.data()!['username'],
                          ),
                          CustomizedInfoItem(
                            icon: Icons.email,
                            label: snapshot.data!.data()!['email'],
                          ),
                          CustomButton(
                              text: 'Sign Out',
                              function: () {
                                signOut();
                                Navigator.pushReplacementNamed(
                                    context, WelcomeScreen.id);
                              })
                        ],
                      )
                    : Center(child: CircularProgressIndicator()),
              )
            ]),
          )
        : CustomNotLoggedIn();
  }
}
