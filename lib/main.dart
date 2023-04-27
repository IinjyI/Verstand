import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Functions/DBandAuth/sharedPrefs.dart';
import 'Screens/NavBottomBar.dart';
import 'Screens/WelcomeScreen.dart';
import 'Screens/SigninScreen.dart';
import 'Screens/SignupScreen.dart';
import 'Screens/ProfileScreen.dart';
import 'Screens/HomeScreen.dart';
import 'Screens/AIDiagnosisScreen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// connection with firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  ///check if user is logged in
  await getLoggedInUser();

  ///run
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        SignupScreen.id: (context) => const SignupScreen(),
        SigninScreen.id: (context) => const SigninScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
        AIDiagnosisScreen.id: (context) => const AIDiagnosisScreen(),
        ProfileScreen.id: (context) => const ProfileScreen(),
        NavBottomBar.id: (context) => const NavBottomBar()
      },
      initialRoute:
          loggedInUser == "NotLoggedIn" ? WelcomeScreen.id : NavBottomBar.id,
    );
  }
}
