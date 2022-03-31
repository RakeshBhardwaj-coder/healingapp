import 'dart:convert';

class LikeModel {
  bool? isLiked;
  String? likeId;
  int? totalLikes;
  String? mId;
  LikeModel({
    required this.isLiked,
    this.likeId,
    required this.totalLikes,
    required this.mId,
  });

  Map<String, dynamic> toMap() {
    return {
      'isLiked': isLiked,
      'likeId': likeId,
      'totalLikes': totalLikes,
      'mId': mId,
    };
  }

  factory LikeModel.fromMap(Map<String, dynamic> map) {
    return LikeModel(
      isLiked: map['isLiked'],
      likeId: map['likeId'],
      totalLikes: map['totalLikes']?.toInt(),
      mId: map['mId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LikeModel.fromJson(String source) =>
      LikeModel.fromMap(json.decode(source));
}
