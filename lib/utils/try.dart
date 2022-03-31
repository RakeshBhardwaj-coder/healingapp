import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:healingapp/utils/getCurrentUserId.dart';

class trytt extends StatefulWidget {
  const trytt({Key? key}) : super(key: key);

  @override
  _tryttState createState() => _tryttState();
}

class _tryttState extends State<trytt> {
  final docCommentModel = FirebaseFirestore.instance
      .collection('User')
      .doc('${GetCurrentUserId.currentUserId}')
      .collection('Message')
      .doc('KepqjAWcolUFzkPGorEL')
      .collection('Comments')
      .doc('52dZ8FM8XAhpttKWfYCn')
      ;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('$docCommentModel'),
    );
  }
}
