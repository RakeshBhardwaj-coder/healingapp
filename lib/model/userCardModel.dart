import 'dart:convert';

import 'package:healingapp/model/userModel.dart';

class UserAskCardModel {
  String title;
  String subject;
  String problem;
  String howWeHelp;
  String id;
  String name;
  DateTime createdTime;

  UserAskCardModel({
    required this.title,
    required this.subject,
    required this.problem,
    required this.howWeHelp,
    required this.id,
    required this.name,
    required this.createdTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subject': subject,
      'problem': problem,
      'howWeHelp': howWeHelp,
      'id': id,
      'name': name,
      'createdTime': createdTime.millisecondsSinceEpoch,
    };
  }

  static UserAskCardModel fromMap(Map<String, dynamic> map) {
    return UserAskCardModel(
      title: map['title'] ?? '',
      subject: map['subject'] ?? '',
      problem: map['problem'] ?? '',
      howWeHelp: map['howWeHelp'] ?? '',
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      createdTime: DateTime.fromMillisecondsSinceEpoch(map['createdTime']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserAskCardModel.fromJson(String source) =>
      UserAskCardModel.fromMap(json.decode(source));
}
