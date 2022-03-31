import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:healingapp/utils/getCurrentUserId.dart';

class GetFirstNameWidget extends StatefulWidget {
  const GetFirstNameWidget({Key? key}) : super(key: key);

  @override
  _GetFirstNameWidgetState createState() => _GetFirstNameWidgetState();
}

class _GetFirstNameWidgetState extends State<GetFirstNameWidget> {
  String? name;
  final documentStream = FirebaseFirestore.instance
      .collection('User')
      .doc('${GetCurrentUserId.currentUserId}')
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: documentStream,
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
          return Container(child: Text('${snapshot.data!['name']}'));
        });
  }
}
