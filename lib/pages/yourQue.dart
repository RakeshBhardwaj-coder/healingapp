import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class yourQue extends StatefulWidget {
  const yourQue({Key? key}) : super(key: key);

  @override
  _yourQueState createState() => _yourQueState();
}

class _yourQueState extends State<yourQue> {
  var userId = 123;
  final ref = FirebaseDatabase.instance.ref();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your Questions")),
      body: Material(
        
      ),
    );
  }

  readDataFromDatabase() async {
    await ref.child('users/$userId').get();
  }
}
