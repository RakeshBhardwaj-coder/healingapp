import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healingapp/model/userCardModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:healingapp/model/userCardModel.dart';

class UserAskQuePreferences {
//   static SharedPreferences? _preferences;

//   static final _keyUser = 'userAskID';
//   static final userAskModel =
//       UserAskCardModel(title: 'title', subject: 'subject', problem: 'problem');

//   static Future setAskUser(UserAskCardModel user) async {
//     final json = jsonEncode(user.toJson());
//     print("json:" + json);

//     await _preferences?.setString(_keyUser, json);
//   }

//   static UserAskQuePreferences getUser() {
//     final json = _preferences?.getString(_keyUser);
//     return json == null ? userAskModel : UserAskCardModel.fromMap(jsonDecode(map));

  static StreamTransformer transformer<T>(
          T Function(Map<String, dynamic> json) fromJson) =>
      StreamTransformer<QuerySnapshot, List<T>>.fromHandlers(
        handleData: (QuerySnapshot data, EventSink<List<T>> sink) {
          final snaps = data.docs.map((doc) => doc.data()).toList();
          final objects = snaps.map((json) => fromJson(json)).toList();

          sink.add(objects);
        },
      );
}
