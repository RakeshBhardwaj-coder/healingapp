import 'package:cloud_firestore/cloud_firestore.dart';

class UserDetails {
  final String uid;
  UserDetails({
    required this.uid,
  });

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future updateUserData(String name, String email, String title) async {
    return await users
        .doc(uid)
        .set({'name': name, 'email': email, 'title': title});
  }
}
