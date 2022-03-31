import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healingapp/utils/getCurrentUserId.dart';

class GetFirstName {
  Stream documentStream = FirebaseFirestore.instance.collection('users').doc('${GetCurrentUserId.currentUserId}').snapshots();
  static String? name;
  static Future getFirstName() async {
    FirebaseFirestore.instance
        .collection('User')
        .doc('${GetCurrentUserId.currentUserId}')
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        name = documentSnapshot.data()!['name'].split(' ')[0];
        print('Document data: ${name}');
      } else {
        print('Document does not exist on the database');
      }
    });
    return name;
  }

  
}



//    getFirstName() {
//     // Create a reference to the document the transaction will use
// DocumentReference documentReference = FirebaseFirestore.instance
//   .collection('users')
//   .doc(documentId);

// return FirebaseFirestore.instance.runTransaction((transaction) async {
//   // Get the document
//   DocumentSnapshot snapshot = await transaction.get(documentReference);

//   if (!snapshot.exists) {
//     throw Exception("User does not exist!");
//   }

//   // Update the follower count based on the current count
//   // Note: this could be done without a transaction
//   // by updating the population using FieldValue.increment()

//   int newFollowerCount = snapshot.data()!['followers'] + 1;

//   // Perform an update on the document
//   transaction.update(documentReference, {'followers': newFollowerCount});

//   // Return the new count
//   return newFollowerCount;
// })
// .then((value) => print("Follower count updated to $value"))
// .catchError((error) => print("Failed to update user followers: $error"));
//   }