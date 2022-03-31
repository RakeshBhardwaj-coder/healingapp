import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:healingapp/model/CommentModel.dart';
import 'package:healingapp/utils/getCurrentMId.dart';
import 'package:healingapp/utils/getCurrentUserId.dart';

class CommentModelAPI with ChangeNotifier {
  static Future<String?> createComment(CommentModel commentModel) async {
    final docCommentModel = FirebaseFirestore.instance
        .collection('Comment')
        .doc('${GetCurrentUserId.currentUserId}')
        .collection('${GetCurrentMid.mId}')
        .doc();

    commentModel.commId = docCommentModel.id;
    await docCommentModel.set(commentModel.toMap());
    return docCommentModel.id;
  }
}
