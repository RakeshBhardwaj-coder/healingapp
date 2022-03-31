import 'dart:convert';

import 'package:healingapp/model/userModel.dart';

class UserAskCardModel {
  String title;
  String subject;
  String problem;
  String howWeHelp;
  String uId;
  String? mId;
  String name;
  DateTime createdTime;
  int like;
  int watch;
  int comments;

  UserAskCardModel({
    required this.title,
    required this.subject,
    required this.problem,
    required this.howWeHelp,
    required this.uId,
    this.mId,
    required this.name,
    required this.createdTime,
    required this.like,
    required this.watch,
    required this.comments,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subject': subject,
      'problem': problem,
      'howWeHelp': howWeHelp,
      'uId': uId,
      'mId': mId,
      'name': name,
      'createdTime': createdTime.millisecondsSinceEpoch,
      'like': like,
      'watch': watch,
      'comments': comments,
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
      uId: map['uId'] ?? '',
      mId: map['mId'],
      name: map['name'] ?? '',
      createdTime: DateTime.fromMillisecondsSinceEpoch(map['createdTime']),
      like: map['like']?.toInt() ?? 0,
      watch: map['watch']?.toInt() ?? 0,
      comments: map['comments']?.toInt() ?? 0,
    );
  }

  UserAskCardModel copyWith({
    String? title,
    String? subject,
    String? problem,
    String? howWeHelp,
    String? uId,
    String? mId,
    String? name,
    DateTime? createdTime,
    int? like,
    int? watch,
    int? comments,
  }) {
    return UserAskCardModel(
      title: title ?? this.title,
      subject: subject ?? this.subject,
      problem: problem ?? this.problem,
      howWeHelp: howWeHelp ?? this.howWeHelp,
      uId: uId ?? this.uId,
      mId: mId ?? this.mId,
      name: name ?? this.name,
      createdTime: createdTime ?? this.createdTime,
      like: like ?? this.like,
      watch: watch ?? this.watch,
      comments: comments ?? this.comments,
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
