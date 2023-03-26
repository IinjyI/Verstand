import 'package:shared_preferences/shared_preferences.dart';

String? loggedInEmail = 'NotLoggedIn';
setLoggedInEmail(String email) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('email', email);
}

Future<void> getLoggedInEmail() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.getString('email') != null
      ? loggedInEmail = (prefs.getString('email'))
      : loggedInEmail = 'NotLoggedIn';
}

Future<void> deletePrefs() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
}
