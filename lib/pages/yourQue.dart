import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:healingapp/pages/HomePage.dart';
import 'package:healingapp/userServices/profileImageDatabase.dart';
import 'package:healingapp/widgets/bottomNavigatorBar.dart';
import 'package:healingapp/utils/navigatePage.dart';

class yourQue extends StatefulWidget {
  yourQue({Key? key}) : super(key: key);

  @override
  _yourQueState createState() => _yourQueState();
}

class _yourQueState extends State<yourQue> {
  final Stream<QuerySnapshot> _usersStreamMSG = FirebaseFirestore.instance
      .collection('User')
      .doc('$userid')
      .collection('Message')
      .snapshots();
  // final Stream<QuerySnapshot> _usersDetailsStream =
  //     FirebaseFirestore.instance.collection('User/$userid').snapshots();

  static get userid => FirebaseAuth.instance.currentUser?.uid;
  DatabaseReference ref = FirebaseDatabase.instance.ref("User");

  final List<String> imageList = [
    "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80",
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
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
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text('Loading...');
                      }
                      final data = snapshot.requireData;
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              "$date",
                              style: TextStyle(color: Colors.black38),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blueAccent[400],
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0),
                                    topLeft: Radius.circular(10.0),
                                    bottomLeft: Radius.circular(10.0)),
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
                      );
                    }),
              ),

              ////sample Image Testing...........
              // Container(
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: ClipRRect(
              //       borderRadius: BorderRadius.circular(10),
              //       child: SizedBox.fromSize(
              //         size: Size.fromRadius(100), // Image radius
              //         child: Image.network(
              //             'https://upload.wikimedia.org/wikipedia/commons/9/9a/Gull_portrait_ca_usa.jpg',
              //             fit: BoxFit.cover),
              //       ),
              //     ),
              //   ),
              // ),

              //levra3     // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: CarouselSlider.builder(
              //       itemCount: imageList.length,
              //       options: CarouselOptions(
              //         // enlargeCenterPage: true,
              //         height: 230,
              //         // autoPlay: true,
              //         // autoPlayInterval: Duration(seconds: 3),
              //         reverse: false,
              //         aspectRatio: 2.0,
              //       ),
              //       itemBuilder: (context, i, id) {
              //         return GestureDetector(
              //             child: Container(
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(15),
              //             border: Border.all(
              //               color: Colors.white,
              //             ),
              //           ),
              //           child: ClipRRect(
              //             borderRadius: BorderRadius.circular(15),
              //             child: Image.network(
              //               imageList[i],
              //               width: 500,
              //               fit: BoxFit.cover,
              //             ),
              //           ),
              //         ));
              //       }),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
