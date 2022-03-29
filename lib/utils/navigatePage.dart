import 'package:flutter/material.dart';
import 'package:healingapp/pages/userprofiles/userProfile.dart';

class NavigatePage {
  static int? getIndex;
  static String? getDate;
  static void pageNavigatorIndexAndDate(context, page, int index, String date) {
    getIndex = index;
    getDate = date;

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => page,
        ));
  }

  static void pageNavigator(context, page) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => page,
        ));
  }
}
