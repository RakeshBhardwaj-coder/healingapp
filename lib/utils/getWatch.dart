import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healingapp/utils/getCurrentMId.dart';
import 'package:healingapp/utils/getCurrentUserId.dart';

class GetWatch {
  Stream documentStream = FirebaseFirestore.instance
      .collection('Watch')
      .doc('${GetCurrentMid.mId}')
      .snapshots();
  static int? watch;
  static Future getTotalWatch() async {
    FirebaseFirestore.instance
        .collection('Watch')
        .doc('${GetCurrentMid.mId}')
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        watch = documentSnapshot.data()!['watchingNum'];
        print('Document total watch : ${watch}');
      } else {
        print('Document doe si not exist on the ${watch}');
      }
    });
    return watch;
  }
}
