import 'dart:convert';

class WatchModel {
  String? WatchId;
  bool? isWatched;
  int? watchingNum;

  WatchModel({
    this.WatchId,
    required this.isWatched,
    required this.watchingNum,
  });

  Map<String, dynamic> toMap() {
    return {
      'WatchId': WatchId,
      'isWatched': isWatched,
      'watchingNum': watchingNum,
    };
  }

  String toJson() => json.encode(toMap());

  factory WatchModel.fromMap(Map<String, dynamic> map) {
    return WatchModel(
      WatchId: map['WatchId'],
      isWatched: map['isWatched'],
      watchingNum: map['watchingNum']?.toInt(),
    );
  }

  factory WatchModel.fromJson(String source) =>
      WatchModel.fromMap(json.decode(source));

  WatchModel copyWith({
    String? WatchId,
    bool? isWatched,
    int? watchingNum,
  }) {
    return WatchModel(
      WatchId: WatchId ?? this.WatchId,
      isWatched: isWatched ?? this.isWatched,
      watchingNum: watchingNum ?? this.watchingNum,
    );
  }
}
