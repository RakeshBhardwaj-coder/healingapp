import 'dart:convert';

import 'package:healingapp/model/userModel.dart';

class UserAskCardModel {
  String title;
  String problem;
  String howWeCanHelp;
  
  UserAskCardModel({
    required this.title,
    required this.problem,
    required this.howWeCanHelp,
  });
  


  UserAskCardModel copyWith({
    String? title,
    String? problem,
    String? howWeCanHelp,
  }) {
    return UserAskCardModel(
      title: title ?? this.title,
      problem: problem ?? this.problem,
      howWeCanHelp: howWeCanHelp ?? this.howWeCanHelp,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'problem': problem,
      'howWeCanHelp': howWeCanHelp,
    };
  }

  factory UserAskCardModel.fromMap(Map<String, dynamic> map) {
    return UserAskCardModel(
      title: map['title'] ?? '',
      problem: map['problem'] ?? '',
      howWeCanHelp: map['howWeCanHelp'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserAskCardModel.fromJson(String source) => UserAskCardModel.fromMap(json.decode(source));

  @override
  String toString() => 'UserAskCardModel(title: $title, problem: $problem, howWeCanHelp: $howWeCanHelp)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserAskCardModel &&
      other.title == title &&
      other.problem == problem &&
      other.howWeCanHelp == howWeCanHelp;
  }

  @override
  int get hashCode => title.hashCode ^ problem.hashCode ^ howWeCanHelp.hashCode;

}
