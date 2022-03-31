import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:healingapp/model/CommentModel.dart';
import 'package:healingapp/model/LikeModel.dart';
import 'package:healingapp/model/WatchModel.dart';
import 'package:healingapp/utils/getCurrentMId.dart';
import 'package:healingapp/utils/getCurrentUserId.dart';

class WatchModelAPI with ChangeNotifier {
  static Future<String?> createWatch(WatchModel watchModel) async {
    final docWatchModel = FirebaseFirestore.instance
        .collection('Watch')
        .doc('${GetCurrentMid.mId}');
    watchModel.WatchId = docWatchModel.id;
    await docWatchModel.set(watchModel.toMap());
    return docWatchModel.id;
  }
}
