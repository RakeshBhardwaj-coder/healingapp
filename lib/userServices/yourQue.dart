import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comment_box/comment/comment.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:healingapp/model/CommentModelAPI.dart';
import 'package:healingapp/model/LikeModel.dart';
import 'package:healingapp/model/LikeModelAPI.dart';
import 'package:healingapp/pages/HomePage.dart';
import 'package:healingapp/utils/profileImageDatabase.dart';
import 'package:healingapp/widgets/bottomNavigatorBar.dart';
import 'package:healingapp/utils/navigatePage.dart';
import 'package:healingapp/widgets/commentChildWidget.dart';
import 'package:healingapp/features/Like.dart';

class yourQue extends StatefulWidget {
  yourQue({Key? key}) : super(key: key);

  @override
  _yourQueState createState() => _yourQueState();
}

class _yourQueState extends State<yourQue> {
  bool isPressed = false;

  final Stream<QuerySnapshot> _usersStreamMSG = FirebaseFirestore.instance
      .collection('User')
      .doc('$userid')
      .collection('Message')
      .snapshots();
  // final Stream<QuerySnapshot> _usersDetailsStream =
  //     FirebaseFirestore.instance.collection('User/$userid').snapshots();

  static get userid => FirebaseAuth.instance.currentUser?.uid;
  DatabaseReference ref = FirebaseDatabase.instance.ref("User");

  List filedata = [
    {
      'name': 'Biggi Man',
      'pic': 'https://picsum.photos/300/30',
      'message':
          'https://picsum.photos/300/30https://picsum.photos/300/30https://picsum.photos/300/30https://picsum.photos/300/30'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Very cool'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Very cool'
    },
  ];
  int? index;
  String? date;
  @override
  void initState() {
    index = NavigatePage.getIndex;
    date = NavigatePage.getDate;
    print(index);
    super.initState();
  }

  // final data = snapshot.requireData;
  //               final index = 0;
  //               final time = int.parse('${data.docs[index]['createdTime']}');
  //               final date = DateTime.fromMillisecondsSinceEpoch(time);
  //               var format = new DateFormat("d-M-y");
  //               var dateString = format.format(date);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: BackButton(
            onPressed: () =>
                NavigatePage.pageNavigator(context, bottomNavigatorBar()),
          ),
          title: Text("Problems")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: StreamBuilder<QuerySnapshot>(
                        stream: _usersStreamMSG,
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return Text('Something went wrong');
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Text('Loading...');
                          }
                          final data = snapshot.requireData;
                          return Column(
                            children: [
                              Container(
                                margin: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2, color: Colors.blue),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Text(
                                          "$date",
                                          style:
                                              TextStyle(color: Colors.black38),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.blueAccent[400],
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(10.0),
                                                bottomRight:
                                                    Radius.circular(10.0),
                                                topLeft: Radius.circular(10.0),
                                                bottomLeft:
                                                    Radius.circular(10.0)),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Text(
                                              "${data.docs[index!]['subject']}",
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.inter(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "${data.docs[index!]['title']}",
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.lato(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          "${data.docs[index!]['problem']}",
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.inter(
                                            fontSize: 22,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "${data.docs[index!]['howWeHelp']}",
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.inter(
                                            fontSize: 22,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              for (var i = 0; i < filedata.length; i++)
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      2.0, 8.0, 2.0, 0.0),
                                  child: Container(
                                    child: ListTile(
                                      leading: GestureDetector(
                                        onTap: () async {
                                          // Display the image in large form.
                                          print("Comment Clicked");
                                        },
                                        child: Container(
                                          height: 45.0,
                                          width: 45.0,
                                          decoration: new BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius:
                                                  new BorderRadius.all(
                                                      Radius.circular(50))),
                                          child: CircleAvatar(
                                              radius: 50,
                                              backgroundImage: NetworkImage(
                                                  filedata[i]['pic'] + "$i")),
                                        ),
                                      ),
                                      title: Text(
                                        '${data.docs[index!]['problem']}', //data[i]['name']
                                        style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w600),
                                      ),
                                      subtitle: Expanded(
                                        child: Text(
                                          '${data.docs[index!]['problem']}',
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.lato(
                                              color: Colors.black87,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 19),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                            ],
                          );
                        }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.white, elevation: 0),
                onPressed: () {
                  setState(() {
                    isPressed = !isPressed;
                    LikeModelAPI.createLike(LikeModel(
                        isLiked: isPressed,
                        totalLikes: (LikedPage.isLike(0, isPressed))));

                    // LikedPage.isLike(1, isPressed);
                  });
                  // NavigatePage.pageNavigator(context, CommentBoxWidget());
                },
                child: isPressed
                    ? Icon(
                        Icons.thumb_up,
                        color: Colors.blue,
                      )
                    : Icon(
                        Icons.thumb_up_alt_outlined,
                        color: Colors.black,
                      ),

                // color: Colors.blue,
                // textColor: Colors.white,
                // elevation: 5,
              ),
              ElevatedButton(
                onPressed: () {
                  NavigatePage.pageNavigator(context, CommentBoxWidget());
                },
                child: const Text('Write your Comment',
                    style: TextStyle(fontSize: 20)),

                // color: Colors.blue,
                // textColor: Colors.white,
                // elevation: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
