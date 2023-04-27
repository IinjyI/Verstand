import 'package:firebase_auth/firebase_auth.dart';
import 'package:verstand/Functions/DBandAuth/sharedPrefs.dart';

import '../../CustomWidgets/CustomSnackBar.dart';
import 'database.dart';

int resultOfUserName = 0;
int resultOfEmail = 0;
FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

/// check username and email are valid or not.
checkUsersName(userName) async {
  await searchUserName(userName).then((value) => resultOfUserName = value);
}

checkEmail(email) async {
  await searchEmail(email).then((value) => resultOfEmail = value);
}

Future signUp(String email, String password) async {
  try {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}

Future signIn(context, email, password) async {
  try {
    return await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
      buildSnackBar(context, 'No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
      buildSnackBar(context, 'Wrong password provided for that user.');
    }
  }
}

Future<void> signOut() async {
  try {
    await _firebaseAuth.signOut();
    deletePrefs();
    getLoggedInUser();
  } catch (e) {
    print(e);
  }
}
