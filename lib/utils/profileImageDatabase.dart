import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

final userId = FirebaseAuth.instance.currentUser!.uid;

class ProfileImageDatabase {
  static String? downloadURL;

  static Future getData() async {
    try {
      await downloadProfile();
      return downloadURL;
    } catch (e) {
      print("Error - $e");
      return CircularProgressIndicator();
    }
  }

  static Future<void> downloadProfile() async {
    downloadURL = await FirebaseStorage.instance
        .refFromURL('gs://healingapp-72930.appspot.com/profileImages')
        .child('$userId.jpg')
        .getDownloadURL();
    print(downloadURL.toString());
  }
}
