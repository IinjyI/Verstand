import 'package:shared_preferences/shared_preferences.dart';

String? loggedInUser = 'NotLoggedIn';
setLoggedInUser(String? username) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('username', username!);
}

Future<void> getLoggedInUser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.getString('username') != null
      ? loggedInUser = (prefs.getString('username'))
      : loggedInUser = 'NotLoggedIn';
}

Future<void> deletePrefs() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
}
