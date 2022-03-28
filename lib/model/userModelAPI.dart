import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healingapp/model/userModel.dart';

class UserModelAPI with ChangeNotifier {
  static Future<String?> createModel(UserDetails userDetails) async {
    final docUserModel = FirebaseFirestore.instance.collection('User').doc();
    String? userid = FirebaseAuth.instance.currentUser?.uid;

    userDetails.userId = userid.toString();
    // await docCardModel.set(cardModel.toMap());
    await docUserModel.set(userDetails.toJson());
    return userid;
  }

//   static Stream<List<UserAskCardModel>> readCard() => FirebaseFirestore.instance
//       .collection('User')
//       .snapshots()
//       .transform(UserAskQuePreferences.transformer(UserAskCardModel.fromMap));
}
