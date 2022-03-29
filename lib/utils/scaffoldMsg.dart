import 'package:flutter/material.dart';

class ScaffoldMsg {
  static void ErrorMsg(context, message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          "$message",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 18, color: Color.fromARGB(255, 255, 255, 255)),
        )));
    return message;
  }

  static void SuccessMsg(context, successMsg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          "$successMsg",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 18, color: Color.fromARGB(255, 255, 255, 255)),
        )));
  }
}
