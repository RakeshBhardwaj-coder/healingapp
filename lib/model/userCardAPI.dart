import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:healingapp/model/userCardModel.dart';
import 'package:healingapp/utils/userAskQuePreferences.dart';

class UserCardAPI with ChangeNotifier {
  static Future<String?> createCard(UserAskCardModel cardModel) async {
    final docCardModel = FirebaseFirestore.instance.collection('User').doc();

    cardModel.id = docCardModel.id;
    await docCardModel.set(cardModel.toMap());
    return docCardModel.id;
  }

//   static Stream<List<UserAskCardModel>> readCard() => FirebaseFirestore.instance
//       .collection('User')
//       .snapshots()
//       .transform(UserAskQuePreferences.transformer(UserAskCardModel.fromMap));
}
