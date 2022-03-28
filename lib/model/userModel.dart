import 'dart:convert';

class UserDetails {
  final String imagePath;
  final String name;
  final String email;
  final String about;
   String userId;
  UserDetails({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.about,
    required this.userId,
  });

  Map<String, dynamic> toJson() {
    return {
      'imagePath': imagePath,
      'name': name,
      'email': email,
      'about': about,
      'userId': userId,
    };
  }

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return UserDetails(
      imagePath: json['imagePath'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      about: json['about'] ?? '',
      userId: json['userId'] ?? '',
    );
  }

  // String toJson() => json.encode(toMap());

//   factory UserDetails.fromJson(String source) => UserDetails.fromMap(json.decode(source));

  UserDetails copyWith({
    String? imagePath,
    String? name,
    String? email,
    String? about,
    String? userId,
  }) {
    return UserDetails(
      imagePath: imagePath ?? this.imagePath,
      name: name ?? this.name,
      email: email ?? this.email,
      about: about ?? this.about,
      userId: userId ?? this.userId,
    );
  }
}

 // const UserDetails({
  //   required this.imagePath,
  //   required this.name,
  //   required this.email,
  //   required this.about,
  // });
  // UserDetails copy({
  //   String? imagePath,
  //   String? name,
  //   String? email,
  //   String? about,
  // }) =>
  //     UserDetails(
  //       imagePath: imagePath ?? this.imagePath,
  //       name: name ?? this.name,
  //       email: email ?? this.email,
  //       about: about ?? this.about,
  //     );

  // static UserDetails fromJson(Map<String, dynamic> json) => UserDetails(
  //       imagePath: json['imagePath'],
  //       name: json['name'],
  //       email: json['email'],
  //       about: json['about'],
  //     );

  // Map<String, dynamic> toJson() => {
  //       'imagePath': imagePath,
  //       'name': name,
  //       'email': email,
  //       'about': about,
  //     };