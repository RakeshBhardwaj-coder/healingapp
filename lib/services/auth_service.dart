import 'package:firebase_auth/firebase_auth.dart';
import 'package:healingapp/model/userModel.dart';
// import 'dart:auth';

class AuthServices {
  FirebaseAuth auth = FirebaseAuth.instance;
}

// Future<User?> createUserWithEmailAndPassword(
//   String email,
//   password,
// ) async {
//   try {
//     UserCredential userCredential = await FirebaseAuth.instance
//         .createUserWithEmailAndPassword(
//             email: "barry.allen@example.com", password: "SuperSecretPassword!");
//   } on FirebaseAuthException catch (e) {
//     if (e.code == 'weak-password') {
//       print('The password provided is too weak.');
//     } else if (e.code == 'email-already-in-use') {
//       print('The account already exists for that email.');
//     }
//   } catch (e) {
//     print(e);
//   }

//   // return;
// }

// Future<User?> signInWithEmailAndPassword() async {
//   try {
//     UserCredential userCredential = await FirebaseAuth.instance
//         .signInWithEmailAndPassword(
//             email: "barry.allen@example.com", password: "SuperSecretPassword!");
//   } on FirebaseAuthException catch (e) {
//     if (e.code == 'user-not-found') {
//       print('No user found for that email.');
//     } else if (e.code == 'wrong-password') {
//       print('Wrong password provided for that user.');
//     }
//   }
// }
