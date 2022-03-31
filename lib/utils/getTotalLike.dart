import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healingapp/utils/getCurrentMId.dart';
import 'package:healingapp/utils/getCurrentUserId.dart';

class GetTotalLike {
  Stream documentStream = FirebaseFirestore.instance
      .collection('Likes')
      .doc('${GetCurrentMid.mId}')
      .snapshots();
  static int? likes;
  static bool? isLiked;
  static Future getTotalLike() async {
    FirebaseFirestore.instance
        .collection('Likes')
        .doc('${GetCurrentMid.mId}')
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        likes = documentSnapshot.data()!['totalLikes'];
        isLiked = documentSnapshot.data()!['isLiked'];
        print('Document total Like : ${likes}');
      } else {
        print('Document doe si not exist on the ${likes}');
      }
    });
    return likes;
  }
}
