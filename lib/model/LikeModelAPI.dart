import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:healingapp/model/CommentModel.dart';
import 'package:healingapp/model/LikeModel.dart';
import 'package:healingapp/utils/getCurrentMId.dart';
import 'package:healingapp/utils/getCurrentUserId.dart';

class LikeModelAPI with ChangeNotifier {
  static Future<String?> createLike(LikeModel likeModel) async {
    final docLikeModel = FirebaseFirestore.instance
        .collection('Likes')
        .doc('${GetCurrentMid.mId}');
    // final messageId = FirebaseFirestore.instance.collection('Message').doc().id;
    // likeModel.mId = messageId;
    likeModel.likeId = GetCurrentUserId.currentUserId;
    await docLikeModel.set(likeModel.toMap());
    return docLikeModel.id;
  }
}
