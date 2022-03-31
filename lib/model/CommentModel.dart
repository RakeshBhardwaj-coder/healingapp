import 'dart:convert';

class CommentModel {
  final String? userId;
  final String? userName;
  String? commId;
  final String? commitMsg;

  CommentModel({
    required this.userId,
    required this.userName,
    this.commId,
    required this.commitMsg,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'userName': userName,
      'commId': commId,
      'commitMsg': commitMsg,
    };
  }

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      userId: map['userId'],
      userName: map['userName'],
      commId: map['commId'],
      commitMsg: map['commitMsg'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentModel.fromJson(String source) =>
      CommentModel.fromMap(json.decode(source));
}
