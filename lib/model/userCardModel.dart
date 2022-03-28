import 'dart:convert';

import 'package:healingapp/model/userModel.dart';

class UserAskCardModel {
  String title;
  String subject;
  String problem;
  String howWeHelp;
  String mId;
  String name;
  DateTime createdTime;

  UserAskCardModel({
    required this.title,
    required this.subject,
    required this.problem,
    required this.howWeHelp,
    required this.mId,
    required this.name,
    required this.createdTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subject': subject,
      'problem': problem,
      'howWeHelp': howWeHelp,
      'mId': mId,
      'name': name,
      'createdTime': createdTime.millisecondsSinceEpoch,
    };
  }

  String toJson() => json.encode(toMap());

  factory UserAskCardModel.fromJson(String source) =>
      UserAskCardModel.fromMap(json.decode(source));

  factory UserAskCardModel.fromMap(Map<String, dynamic> map) {
    return UserAskCardModel(
      title: map['title'] ?? '',
      subject: map['subject'] ?? '',
      problem: map['problem'] ?? '',
      howWeHelp: map['howWeHelp'] ?? '',
      mId: map['mId'] ?? '',
      name: map['name'] ?? '',
      createdTime: DateTime.fromMillisecondsSinceEpoch(map['createdTime']),
    );
  }

  UserAskCardModel copyWith({
    String? title,
    String? subject,
    String? problem,
    String? howWeHelp,
    String? mId,
    String? name,
    DateTime? createdTime,
  }) {
    return UserAskCardModel(
      title: title ?? this.title,
      subject: subject ?? this.subject,
      problem: problem ?? this.problem,
      howWeHelp: howWeHelp ?? this.howWeHelp,
      mId: mId ?? this.mId,
      name: name ?? this.name,
      createdTime: createdTime ?? this.createdTime,
    );
  }

  @override
  String toString() {
    return 'UserAskCardModel(title: $title, subject: $subject, problem: $problem, howWeHelp: $howWeHelp, mId: $mId, name: $name, createdTime: $createdTime)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserAskCardModel &&
        other.title == title &&
        other.subject == subject &&
        other.problem == problem &&
        other.howWeHelp == howWeHelp &&
        other.mId == mId &&
        other.name == name &&
        other.createdTime == createdTime;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        subject.hashCode ^
        problem.hashCode ^
        howWeHelp.hashCode ^
        mId.hashCode ^
        name.hashCode ^
        createdTime.hashCode;
  }
}
