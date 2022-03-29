import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:healingapp/model/userModel.dart';

class UserPreferences {
  static SharedPreferences? _preferences;

  static const _keyUser = 'user';
  static final myUser = UserDetails(
      imagePath:
          'https://w7.pngwing.com/pngs/81/570/png-transparent-profile-logo-computer-icons-user-user-blue-heroes-logo-thumbnail.png', //form pngwing.com
      name: 'Unnamed',
      email: 'email',
      about: 'about',
      userId: 'userId');

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future setUser(UserDetails user) async {
    final json = jsonEncode(user.toJson());

    await _preferences?.setString(_keyUser, json);
  }

  static UserDetails getUser() {
    final json = _preferences?.getString(_keyUser);

    return json == null ? myUser : UserDetails.fromJson(jsonDecode(json));
  }
}
// // UserDetails(
//     imagePath:
//         'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80',
//     name: 'Sarah rak',
//     email: 'sarah.abs@gmail.com',
//     about:
//         'Certified Personal Trainer and Nutritionist with years of experience in creating effective diets and training plans focused on achieving individual customers goals in a smooth way.',
//   userId: '');