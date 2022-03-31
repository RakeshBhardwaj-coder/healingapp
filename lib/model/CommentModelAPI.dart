import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:healingapp/model/CommentModel.dart';
import 'package:healingapp/utils/getCurrentUserId.dart';

class CommentModelAPI with ChangeNotifier {
  static Future<String?> createComment(CommentModel commentModel) async {
    final docCommentModel = FirebaseFirestore.instance
        .collection('User')
        .doc('${GetCurrentUserId.currentUserId}')
        .collection('Message')
        .doc('KepqjAWcolUFzkPGorEL')
        .collection('Comments')
        .doc();

    commentModel.commId = docCommentModel.id;
    await docCommentModel.set(commentModel.toMap());
    return docCommentModel.id;
  }
}
