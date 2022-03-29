import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healingapp/pages/askQue.dart';
import 'package:healingapp/pages/blogPage.dart';
import 'package:healingapp/pages/yourQue.dart';
import 'package:healingapp/userServices/profileImageDatabase.dart';
import 'package:healingapp/utils/navigatePage.dart';
import 'package:healingapp/widgets/commentChildWidget.dart';
import 'package:healingapp/widgets/drawer.dart';
import 'package:intl/intl.dart';
import 'package:comment_box/comment/comment.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

const userImageUrl =
    "https://raw.githubusercontent.com/RakeshBhardwaj-coder/RakeshBhardwaj.github.io/master/rks_logo.jpeg";

class _HomePageState extends State<HomePage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  // final userid = FirebaseAuth.instance.currentUser?.uid;
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('User')
      .doc('$userid')
      .collection('Message')
      .snapshots();
  // final Stream<QuerySnapshot> _usersDetailsStream =
  //     FirebaseFirestore.instance.collection('User/$userid').snapshots();

  static get userid => FirebaseAuth.instance.currentUser?.uid;

  List filedata = [
    {
      'name': 'Adeleye Ayodeji',
      'pic': 'https://picsum.photos/300/30',
      'message': 'I love to code'
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
    {
      'name': 'Biggi Man',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Very cool'
    },
  ];
  // String? userName;
  // final document = FirebaseFirestore.instance
  //     .collection('User')
  //     .get()
  //     .then((QuerySnapshot snapshot) {
  //   snapshot.docs.forEach((element) {
  //     // userName = (element.data()['name']).toString();
  //   });
  // });
  // final userRef = FirebaseFirestore.instance.collection('User');
  // getUser() async {
  //   userRef.get().then((QuerySnapshot querySnapshot) {
  //     querySnapshot.docs.forEach((element) {
  //       userName = (element.data()['name']).toString();
  //     });
  //   });

  // }
  var dateString;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Colors.white,
        title: new Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //     FutureBuilder(
            // future: FireStoreDataBase().getData(),
            // builder: (context, snapshot) {
            //   if (snapshot.hasError) {
            //     return const Text(
            //       "Something went wrong",
            //     );
            //   }
            //   if (snapshot.connectionState == ConnectionState.done) {
            //     return Image.network(
            //       snapshot.data.toString(),
            //     );
            FutureBuilder(
                future: ProfileImageDatabase.getData(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text(
                      "Something went wrong",
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                    // Image.network(
                    //   snapshot.data.toString(),
                    // );
                  }
                  return CircleAvatar(
                    backgroundImage: NetworkImage('${snapshot.data}'),
                  );
                }),
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 8),
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Container(
                  //   child: StreamBuilder<QuerySnapshot>(
                  //     stream: _usersDetailsStream,
                  //     builder: (BuildContext context,
                  //         AsyncSnapshot<QuerySnapshot> snapshot) {
                  //       if (snapshot.hasError) {
                  //         return Text('Something went wrong');
                  //       }
                  //       if (snapshot.connectionState ==
                  //           ConnectionState.waiting) {
                  //         return Text('Loading...');
                  //       }
                  //       final data = snapshot.data;
                  //       // levra
                  //       return Text('${snapshot.data}');
                  //     },
                  //   ),
                  // ),

                  Text(
                    "Hello!!!",
                    style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),

                  Text(
                    '',
                    style: GoogleFonts.inter(
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.indigo.shade100,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Container(
                    // alignment: Alignment.topLeft,
                    child: Text(
                      "Your Questions...",
                      style: GoogleFonts.lato(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Container(
                    child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => AskQue()));
                  },
                  child: Text(
                    "Add Question",
                    style: TextStyle(fontSize: 16),
                  ),
                )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 300,
              child: StreamBuilder<QuerySnapshot>(
                stream: _usersStream,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text('Loading...');
                  }
                  final data = snapshot.requireData;

                  final index = 0;
                  final time = int.parse('${data.docs[index]['createdTime']}');
                  final date = DateTime.fromMillisecondsSinceEpoch(time);
                  var format = new DateFormat("d-M-y");
                  dateString = format.format(date);

                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.size,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: Container(
                          margin: EdgeInsets.only(right: 10, left: 10),
                          height: 500,
                          width: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(28),
                              color: Colors
                                  .blueAccent), // Color(cards[index].cardBackgorund)

                          child: Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 16, left: 16.0),
                                      child: Container(
                                        alignment: Alignment.topCenter,
                                        decoration: BoxDecoration(
                                          color: Colors.indigo[50],
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(10.0),
                                              bottomRight:
                                                  Radius.circular(10.0),
                                              topLeft: Radius.circular(10.0),
                                              bottomLeft:
                                                  Radius.circular(10.0)),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 5.0, right: 5),
                                          child: Text(
                                            "${data.docs[index]['subject']}",

                                            // textAlign: TextAlign.start,
                                            style: GoogleFonts.oswald(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.lightBlue),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 16, right: 16.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${data.docs[index]['name']}",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.lato(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            //levra
                                            "$dateString",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.lato(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                          // Text(
                                          //   "12:48 PM",
                                          //   style: GoogleFonts.lato(
                                          //       fontSize: 12,
                                          //       fontWeight: FontWeight.bold,
                                          //       color: Colors.white),
                                          // ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, left: 16),
                                      child: Text(
                                        "Title:",
                                        style: GoogleFonts.lato(
                                          color: Colors.white70,
                                          fontSize: 18,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16,
                                          top: 6.0,
                                          bottom: 6,
                                          right: 5),
                                      child: Expanded(
                                        child: Text(
                                          "${data.docs[index]['title']}",
                                          maxLines: 2,
                                          textAlign: TextAlign.right,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.inter(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, left: 16, right: 6),
                                      child: Text(
                                        "Problem:",
                                        style: GoogleFonts.lato(
                                          color: Colors.white70,
                                          fontSize: 18,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16, top: 6.0, right: 5),
                                      child: Text(
                                        "${data.docs[index]['problem']}",
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.inter(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          alignment: Alignment.topCenter,
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 129, 181, 241),
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
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0),
                                                  child: Icon(
                                                    Icons.remove_red_eye,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5.0, right: 5),
                                                  child: Text(
                                                    "3",
                                                    textAlign: TextAlign.start,
                                                    style: GoogleFonts.inter(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Color.fromARGB(
                                                            255,
                                                            255,
                                                            255,
                                                            255)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                          alignment: Alignment.topCenter,
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 129, 181, 241),
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
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0),
                                                  child: Icon(
                                                    Icons.thumb_up,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5.0, right: 5),
                                                  child: Text(
                                                    "54",
                                                    textAlign: TextAlign.start,
                                                    style: GoogleFonts.inter(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Color.fromARGB(
                                                            255,
                                                            255,
                                                            255,
                                                            255)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                          alignment: Alignment.topCenter,
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 129, 181, 241),
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
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0),
                                                  child: Icon(
                                                    Icons.comment,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5.0, right: 5),
                                                  child: Text(
                                                    "123",
                                                    textAlign: TextAlign.start,
                                                    style: GoogleFonts.inter(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Color.fromARGB(
                                                            255,
                                                            255,
                                                            255,
                                                            255)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          print('clicked index ' + '$index');
                          NavigatePage.pageNavigatorIndexAndDate(
                              context, yourQue(), index, dateString);
                        },
                      );
                    },
                  );
                },
              ),
            ),
            // SizedBox(height: 10),
            // Divider(),
            // Padding(
            //   padding: const EdgeInsets.only(left: 16.0),
            //   child: Container(
            //     // alignment: Alignment.topLeft,
            //     child: Text(
            //       "Frequetly Asked...",
            //       style: GoogleFonts.lato(
            //         fontSize: 20,
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Container(
            //   height: 340,
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     padding: EdgeInsets.only(left: 16, right: 6),
            //     itemCount: 3, //card.leght
            //     itemBuilder: (context, index) {
            //       return Container(
            //         margin: EdgeInsets.only(right: 10),
            //         height: 500,
            //         width: 300,
            //         decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(28),
            //             color: Colors
            //                 .blueAccent), // Color(cards[index].cardBackgorund)

            //         child: Expanded(
            //           child: Column(
            //             children: <Widget>[
            //               Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: [
            //                   Padding(
            //                     padding:
            //                         const EdgeInsets.only(top: 16, left: 16.0),
            //                     child: Container(
            //                       alignment: Alignment.topCenter,
            //                       decoration: BoxDecoration(
            //                         color: Colors.indigo[50],
            //                         borderRadius: BorderRadius.only(
            //                             topRight: Radius.circular(10.0),
            //                             bottomRight: Radius.circular(10.0),
            //                             topLeft: Radius.circular(10.0),
            //                             bottomLeft: Radius.circular(10.0)),
            //                       ),
            //                       child: Padding(
            //                         padding: const EdgeInsets.only(
            //                             left: 5.0, right: 5),
            //                         child: Text(
            //                           "sugar",
            //                           textAlign: TextAlign.start,
            //                           style: GoogleFonts.oswald(
            //                               fontSize: 20,
            //                               fontWeight: FontWeight.w500,
            //                               color: Colors.lightBlue),
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //                   Padding(
            //                     padding:
            //                         const EdgeInsets.only(top: 16, right: 16.0),
            //                     child: Column(
            //                       crossAxisAlignment: CrossAxisAlignment.start,
            //                       children: [
            //                         Text(
            //                           "Rakesh",
            //                           maxLines: 1,
            //                           overflow: TextOverflow.ellipsis,
            //                           style: GoogleFonts.lato(
            //                               fontSize: 15,
            //                               fontWeight: FontWeight.bold,
            //                               color: Colors.white),
            //                         ),
            //                         Text(
            //                           "25-03-2022",
            //                           maxLines: 1,
            //                           overflow: TextOverflow.ellipsis,
            //                           style: GoogleFonts.lato(
            //                               fontSize: 13,
            //                               fontWeight: FontWeight.bold,
            //                               color: Colors.white),
            //                         ),
            //                         // Text(
            //                         //   "12:48 PM",
            //                         //   style: GoogleFonts.lato(
            //                         //       fontSize: 12,
            //                         //       fontWeight: FontWeight.bold,
            //                         //       color: Colors.white),
            //                         // ),
            //                       ],
            //                     ),
            //                   )
            //                 ],
            //               ),
            //               Row(
            //                 children: [
            //                   Padding(
            //                     padding:
            //                         const EdgeInsets.only(top: 8.0, left: 16),
            //                     child: Text(
            //                       "Title:",
            //                       style: GoogleFonts.lato(
            //                         color: Colors.white70,
            //                         fontSize: 18,
            //                         decoration: TextDecoration.underline,
            //                       ),
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //               Padding(
            //                 padding: const EdgeInsets.only(left: 16, top: 6.0),
            //                 child: Expanded(
            //                   child: Text(
            //                     "I wang ot get mor akjk  dkfja er kerjk f akre a; mdf kejoie a;a a; ",
            //                     maxLines: 2,
            //                     overflow: TextOverflow.ellipsis,
            //                     style: GoogleFonts.inter(
            //                         color: Colors.white, fontSize: 20),
            //                   ),
            //                 ),
            //               ),
            //               Row(
            //                 children: [
            //                   Padding(
            //                     padding:
            //                         const EdgeInsets.only(top: 8.0, left: 16),
            //                     child: Text(
            //                       "Problem:",
            //                       style: GoogleFonts.lato(
            //                         color: Colors.white70,
            //                         fontSize: 18,
            //                         decoration: TextDecoration.underline,
            //                       ),
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //               Padding(
            //                 padding: const EdgeInsets.only(left: 16, top: 6.0),
            //                 child: Text(
            //                   "I wang ot get mor akjk  dkfja er kerjk f ddddddddddddddddddsssssd",
            //                   maxLines: 3,
            //                   overflow: TextOverflow.ellipsis,
            //                   style: GoogleFonts.inter(
            //                       color: Colors.white, fontSize: 20),
            //                 ),
            //               ),
            //               SizedBox(
            //                 height: 10,
            //               ),
            //               Padding(
            //                 padding: const EdgeInsets.all(16.0),
            //                 child: Row(
            //                   children: [
            //                     Container(
            //                         alignment: Alignment.topCenter,
            //                         decoration: BoxDecoration(
            //                           color: Color.fromARGB(255, 129, 181, 241),
            //                           borderRadius: BorderRadius.only(
            //                               topRight: Radius.circular(10.0),
            //                               bottomRight: Radius.circular(10.0),
            //                               topLeft: Radius.circular(10.0),
            //                               bottomLeft: Radius.circular(10.0)),
            //                         ),
            //                         child: Padding(
            //                           padding: const EdgeInsets.all(5.0),
            //                           child: Row(
            //                             children: [
            //                               Padding(
            //                                 padding: const EdgeInsets.only(
            //                                     left: 8.0),
            //                                 child: Icon(
            //                                   Icons.remove_red_eye,
            //                                   color: Colors.white,
            //                                 ),
            //                               ),
            //                               Padding(
            //                                 padding: const EdgeInsets.only(
            //                                     left: 5.0, right: 5),
            //                                 child: Text(
            //                                   "3",
            //                                   textAlign: TextAlign.start,
            //                                   style: GoogleFonts.inter(
            //                                       fontSize: 18,
            //                                       fontWeight: FontWeight.w500,
            //                                       color: Color.fromARGB(
            //                                           255, 255, 255, 255)),
            //                                 ),
            //                               ),
            //                             ],
            //                           ),
            //                         )),
            //                     SizedBox(
            //                       width: 5,
            //                     ),
            //                     Container(
            //                         alignment: Alignment.topCenter,
            //                         decoration: BoxDecoration(
            //                           color: Color.fromARGB(255, 129, 181, 241),
            //                           borderRadius: BorderRadius.only(
            //                               topRight: Radius.circular(10.0),
            //                               bottomRight: Radius.circular(10.0),
            //                               topLeft: Radius.circular(10.0),
            //                               bottomLeft: Radius.circular(10.0)),
            //                         ),
            //                         child: Padding(
            //                           padding: const EdgeInsets.all(5.0),
            //                           child: Row(
            //                             children: [
            //                               Padding(
            //                                 padding: const EdgeInsets.only(
            //                                     left: 8.0),
            //                                 child: Icon(
            //                                   Icons.thumb_up,
            //                                   color: Colors.white,
            //                                 ),
            //                               ),
            //                               Padding(
            //                                 padding: const EdgeInsets.only(
            //                                     left: 5.0, right: 5),
            //                                 child: Text(
            //                                   "54",
            //                                   textAlign: TextAlign.start,
            //                                   style: GoogleFonts.inter(
            //                                       fontSize: 18,
            //                                       fontWeight: FontWeight.w500,
            //                                       color: Color.fromARGB(
            //                                           255, 255, 255, 255)),
            //                                 ),
            //                               ),
            //                             ],
            //                           ),
            //                         )),
            //                     SizedBox(
            //                       width: 5,
            //                     ),
            //                     Container(
            //                         alignment: Alignment.topCenter,
            //                         decoration: BoxDecoration(
            //                           color: Color.fromARGB(255, 129, 181, 241),
            //                           borderRadius: BorderRadius.only(
            //                               topRight: Radius.circular(10.0),
            //                               bottomRight: Radius.circular(10.0),
            //                               topLeft: Radius.circular(10.0),
            //                               bottomLeft: Radius.circular(10.0)),
            //                         ),
            //                         child: Padding(
            //                           padding: const EdgeInsets.all(5.0),
            //                           child: Row(
            //                             children: [
            //                               Padding(
            //                                 padding: const EdgeInsets.only(
            //                                     left: 8.0),
            //                                 child: Icon(
            //                                   Icons.comment,
            //                                   color: Colors.white,
            //                                 ),
            //                               ),
            //                               Padding(
            //                                 padding: const EdgeInsets.only(
            //                                     left: 5.0, right: 5),
            //                                 child: Text(
            //                                   "123",
            //                                   textAlign: TextAlign.start,
            //                                   style: GoogleFonts.inter(
            //                                       fontSize: 18,
            //                                       fontWeight: FontWeight.w500,
            //                                       color: Color.fromARGB(
            //                                           255, 255, 255, 255)),
            //                                 ),
            //                               ),
            //                             ],
            //                           ),
            //                         )),
            //                   ],
            //                 ),
            //               )
            //             ],
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),
            Container(
              height: 250,
            )
          ],
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
