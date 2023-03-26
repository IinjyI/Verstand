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
  /// connection with firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  /// check if user already logged in (will use it in routing)
  await getLoggedInUser();

  ///run
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        SignupScreen.id: (context) => SignupScreen(),
        SigninScreen.id: (context) => SigninScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        AIDiagnosisScreen.id: (context) => AIDiagnosisScreen(),
        ProfileScreen.id: (context) => ProfileScreen(),
        NavBottomBar.id: (context) => NavBottomBar()
      },
      initialRoute:
          loggedInUser == "NotLoggedIn" ? WelcomeScreen.id : NavBottomBar.id,
    );
  }
}
