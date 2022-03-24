// import 'package:cloud_firestore/cloud_firestore.dart';

// class UserDetails {
//   final String uid;
//   UserDetails({
//     required this.uid,
//   });

//   CollectionReference users = FirebaseFirestore.instance.collection('users');

//   Future updateUserData(String name, String email, String title) async {
//     return await users
//         .doc(uid)
//         .set({'name': name, 'email': email, 'title': title});
//   }
// }
class User {
  final String imagePath;
  final String name;
  final String email;
  final String about;

  const User({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.about,
  });
  User copy({
    String? imagePath,
    String? name,
    String? email,
    String? about,
    bool? isDarkMode,
  }) =>
      User(
        imagePath: imagePath ?? this.imagePath,
        name: name ?? this.name,
        email: email ?? this.email,
        about: about ?? this.about,
      );

  static User fromJson(Map<String, dynamic> json) => User(
        imagePath: json['imagePath'],
        name: json['name'],
        email: json['email'],
        about: json['about'],
      );

  Map<String, dynamic> toJson() => {
        'imagePath': imagePath,
        'name': name,
        'email': email,
        'about': about,
      };
}
