import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore _fireStore = FirebaseFirestore.instance;
int count = 0;

/// store data
void upLoadProfile(Map<String, dynamic> userInfo, String username) {
  _fireStore.collection('users').doc(username).set(userInfo);
}

/// get user information  from firebase
Future getUserInformation(String username) {
  return _fireStore.collection('users').doc(username).get();
}

/// search by username
Future searchUserName(String userName) {
  return _fireStore
      .collection('users')
      .where('name', isEqualTo: userName)
      .get()
      .then((value) => value.docs.length);
}

/// search by email
Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> searchEmail(
    String email) {
  return _fireStore
      .collection('users')
      .where('email', isEqualTo: email)
      .get()
      .then((value) => value.docs);
}
