
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healingapp/utils/getCurrentMId.dart';
import 'package:healingapp/utils/getCurrentUserId.dart';

class GetLikes {
  // Stream documentStream = FirebaseFirestore.instance.collection('users').doc('${GetCurrentUserId.currentUserId}').snapshots();
  static int? like;
  static Future getLikes() async {
    FirebaseFirestore.instance
        .collection('User')
        .doc('${GetCurrentUserId.currentUserId}')
        .collection('Message')
        .doc('${GetCurrentMid.mId}')//lev4
        .collection('Like')
        .doc('${GetCurrentUserId.currentUserId}')
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        like = documentSnapshot.data()!['totalLikes'];
        print('Document data: ${like}');
      } else {
        print('Document does not exist on the database');
      }
    });
    return like;
  }

  
}