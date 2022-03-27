import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healingapp/pages/askQue.dart';
import 'package:healingapp/widgets/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

const userImageUrl =
    "https://raw.githubusercontent.com/RakeshBhardwaj-coder/RakeshBhardwaj.github.io/master/rks_logo.jpeg";

class _HomePageState extends State<HomePage> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('User').snapshots();

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
            CircleAvatar(
              backgroundImage: NetworkImage(userImageUrl),
            )
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
                  Text(
                    "Hello!!!",
                    style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                  Text(
                    "Rakesh",
                    style: GoogleFonts.inter(
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  // Container(
                  //   height: 250,
                  //   child: StreamBuilder<QuerySnapshot>(
                  //     stream: _usersStream,
                  //     builder: (BuildContext context,
                  //         AsyncSnapshot<QuerySnapshot> snapshot) {
                  //       if (snapshot.hasError) {
                  //         return Text('Something went wrong');
                  //       }
                  //       if (snapshot.connectionState ==
                  //           ConnectionState.waiting) {
                  //         return Text("Loading");
                  //       }
                  //       final data = snapshot.requireData;
                  //       return ListView.builder(
                  //         itemCount: data.size,
                  //         itemBuilder: (context, index) {
                  //           return Text(
                  //               'My Name is ${data.docs[index]['title']} and ');
                  //         },
                  //       );
                  //     },
                  //   ),
                  // )
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
                    // index += 1;
                    // print('index' + '$index');
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
                    return Container(
                      height: 30,
                      child: CircularProgressIndicator(),
                    );
                  }
                  final data = snapshot.requireData;
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.size,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(right: 10),
                        height: 500,
                        width: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            color: Colors
                                .blueAccent), // Color(cards[index].cardBackgorund)

                        child: Expanded(
                          child: Column(
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
                                            bottomRight: Radius.circular(10.0),
                                            topLeft: Radius.circular(10.0),
                                            bottomLeft: Radius.circular(10.0)),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5.0, right: 5),
                                        child: Text(
                                          "${data.docs[index]['subject']}",
                                          textAlign: TextAlign.start,
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
                                          "Rakesh",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.lato(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          "25-03-2022",
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
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, left: 16),
                                    child: Text(
                                      "Title",
                                      style: GoogleFonts.lato(
                                        color: Colors.white70,
                                        fontSize: 18,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, top: 6.0),
                                child: Expanded(
                                  child: Text(
                                    "${data.docs[index]['title']}",
                                    maxLines: 2,
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, left: 16),
                                    child: Text(
                                      "Problem:",
                                      style: GoogleFonts.lato(
                                        color: Colors.white70,
                                        fontSize: 18,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, top: 6.0),
                                child: Text(
                                  "${data.docs[index]['problem']}",
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.inter(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
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
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Icon(
                                                  Icons.remove_red_eye,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5.0, right: 5),
                                                child: Text(
                                                  "3",
                                                  textAlign: TextAlign.start,
                                                  style: GoogleFonts.inter(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color.fromARGB(
                                                          255, 255, 255, 255)),
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
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Icon(
                                                  Icons.thumb_up,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5.0, right: 5),
                                                child: Text(
                                                  "54",
                                                  textAlign: TextAlign.start,
                                                  style: GoogleFonts.inter(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color.fromARGB(
                                                          255, 255, 255, 255)),
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
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Icon(
                                                  Icons.comment,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5.0, right: 5),
                                                child: Text(
                                                  "123",
                                                  textAlign: TextAlign.start,
                                                  style: GoogleFonts.inter(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color.fromARGB(
                                                          255, 255, 255, 255)),
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
