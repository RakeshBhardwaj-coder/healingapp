import 'package:firebase_auth/firebase_auth.dart';

class GetCurrentUserId {
  static final currentUserId = FirebaseAuth.instance.currentUser!.uid;
}
