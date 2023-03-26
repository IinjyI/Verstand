import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore _fireStore = FirebaseFirestore.instance;

/// store data
void upLoadProfile(Map<String, dynamic> userInfo, String username) {
  _fireStore.collection('users').doc(username).set(userInfo);
}

/// get user information  from firebase
Future<DocumentSnapshot<Map<String, dynamic>>> getUserInformation(
    String? username) {
  return _fireStore.collection('users').doc(username).get();
}

///get username for specific email
Future<String?> getUsername(email) async {
  return _fireStore
      .collection('users')
      .where('email', isEqualTo: email)
      .get()
      .then((value) {
    return value.docs[0].id;
  });
}

/// search by username
Future searchUserName(String userName) {
  return _fireStore
      .collection('users')
      .where('username', isEqualTo: userName)
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

/// store history in firebase
Future storeHistory(
    String username, Map<String, dynamic> info, String title) async {
  _fireStore
      .collection('users')
      .doc(username)
      .collection('history')
      .doc(title)
      .set(info);
}

/// get history in firestore
Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getHistory(
    String? username) {
  return _fireStore
      .collection('users')
      .doc(username)
      .collection('history')
      .orderBy("timestamp", descending: true)
      .get()
      .then((value) => value.docs);
}

/// delete history
void deleteHistory(String username) {
  _fireStore
      .collection('users')
      .doc(username)
      .collection('history')
      .get()
      .then((value) {
    for (DocumentSnapshot doc in value.docs) {
      doc.reference.delete();
    }
  });
}
