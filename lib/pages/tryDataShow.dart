import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class tryDataShow extends StatefulWidget {
  const tryDataShow({Key? key}) : super(key: key);

  @override
  _tryDataShowState createState() => _tryDataShowState();
}

class _tryDataShowState extends State<tryDataShow> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('User').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('chus')),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Read"),
            Container(
              height: 250,
              child: StreamBuilder<QuerySnapshot>(
                stream: _usersStream,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading");
                  }
                  final data = snapshot.requireData;
                  return ListView.builder(
                    itemCount: data.size,
                    itemBuilder: (context, index) {
                      return Text(
                          'My Name is ${data.docs[index]['title']} and ');
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
    // StreamBuilder<QuerySnapshot>(
    //   stream: _usersStream,
    //   builder: {

    //     return ListView.builder(
    //       itemCount: data.size,
    //       itemBuilder: (context, index) {
    //         return Text('My Name is ${data.docs[index]['title']} ');
    //       },
    //       // children: snapshot.data!.docs.map((DocumentSnapshot document) {
    //       //   Map<String, dynamic> data =
    //       //       document.data()! as Map<String, dynamic>;
    //       //   return ListTile(
    //       //     title: Text(data['title']),
    //       //     subtitle: Text(data['company']),
    //       //   );
    //       // }).toList(),
    //     );
    //   },
    // );
  }
}


                // scrollDirection: Axis.horizontal,
                // padding: EdgeInsets.only(left: 16, right: 6),
                // itemCount: 1, //card.leght
                // itemBuilder: (context, index) {
                //   return Container(
                //     margin: EdgeInsets.only(right: 10),
                //     height: 500,
                //     width: 300,
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(28),
                //         color: Colors
                //             .blueAccent), // Color(cards[index].cardBackgorund)

                //     child: Expanded(
                //       child: Column(
                //         children: <Widget>[
                //           Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               Padding(
                //                 padding:
                //                     const EdgeInsets.only(top: 16, left: 16.0),
                //                 child: Container(
                //                   alignment: Alignment.topCenter,
                //                   decoration: BoxDecoration(
                //                     color: Colors.indigo[50],
                //                     borderRadius: BorderRadius.only(
                //                         topRight: Radius.circular(10.0),
                //                         bottomRight: Radius.circular(10.0),
                //                         topLeft: Radius.circular(10.0),
                //                         bottomLeft: Radius.circular(10.0)),
                //                   ),
                //                   child: Padding(
                //                     padding: const EdgeInsets.only(
                //                         left: 5.0, right: 5),
                //                     child: Text(
                //                       "sugar",
                //                       textAlign: TextAlign.start,
                //                       style: GoogleFonts.oswald(
                //                           fontSize: 20,
                //                           fontWeight: FontWeight.w500,
                //                           color: Colors.lightBlue),
                //                     ),
                //                   ),
                //                 ),
                //               ),
                //               Padding(
                //                 padding:
                //                     const EdgeInsets.only(top: 16, right: 16.0),
                //                 child: Column(
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: [
                //                     Text(
                //                       "Rakesh",
                //                       maxLines: 1,
                //                       overflow: TextOverflow.ellipsis,
                //                       style: GoogleFonts.lato(
                //                           fontSize: 15,
                //                           fontWeight: FontWeight.bold,
                //                           color: Colors.white),
                //                     ),
                //                     Text(
                //                       "25-03-2022",
                //                       maxLines: 1,
                //                       overflow: TextOverflow.ellipsis,
                //                       style: GoogleFonts.lato(
                //                           fontSize: 13,
                //                           fontWeight: FontWeight.bold,
                //                           color: Colors.white),
                //                     ),
                //                     // Text(
                //                     //   "12:48 PM",
                //                     //   style: GoogleFonts.lato(
                //                     //       fontSize: 12,
                //                     //       fontWeight: FontWeight.bold,
                //                     //       color: Colors.white),
                //                     // ),
                //                   ],
                //                 ),
                //               )
                //             ],
                //           ),
                //           Row(
                //             children: [
                //               Padding(
                //                 padding:
                //                     const EdgeInsets.only(top: 8.0, left: 16),
                //                 child: Text(
                //                   "Title:",
                //                   style: GoogleFonts.lato(
                //                     color: Colors.white70,
                //                     fontSize: 18,
                //                     decoration: TextDecoration.underline,
                //                   ),
                //                 ),
                //               ),
                //             ],
                //           ),
                //           Padding(
                //             padding: const EdgeInsets.only(left: 16, top: 6.0),
                //             child: Expanded(
                //               child: Text(
                //                 "I wang ot get mor akjk  dkfja er kerjk f akre a; mdf kejoie a;a a; ",
                //                 maxLines: 2,
                //                 overflow: TextOverflow.ellipsis,
                //                 style: GoogleFonts.inter(
                //                     color: Colors.white, fontSize: 20),
                //               ),
                //             ),
                //           ),
                //           Row(
                //             children: [
                //               Padding(
                //                 padding:
                //                     const EdgeInsets.only(top: 8.0, left: 16),
                //                 child: Text(
                //                   "Problem:",
                //                   style: GoogleFonts.lato(
                //                     color: Colors.white70,
                //                     fontSize: 18,
                //                     decoration: TextDecoration.underline,
                //                   ),
                //                 ),
                //               ),
                //             ],
                //           ),
                //           Padding(
                //             padding: const EdgeInsets.only(left: 16, top: 6.0),
                //             child: Text(
                //               "I wang ot get mor akjk  dkfja er kerjk f ddddddddddddddddddsssssd",
                //               maxLines: 3,
                //               overflow: TextOverflow.ellipsis,
                //               style: GoogleFonts.inter(
                //                   color: Colors.white, fontSize: 20),
                //             ),
                //           ),
                //           SizedBox(
                //             height: 10,
                //           ),
                //           Padding(
                //             padding: const EdgeInsets.all(16.0),
                //             child: Row(
                //               children: [
                //                 Container(
                //                     alignment: Alignment.topCenter,
                //                     decoration: BoxDecoration(
                //                       color: Color.fromARGB(255, 129, 181, 241),
                //                       borderRadius: BorderRadius.only(
                //                           topRight: Radius.circular(10.0),
                //                           bottomRight: Radius.circular(10.0),
                //                           topLeft: Radius.circular(10.0),
                //                           bottomLeft: Radius.circular(10.0)),
                //                     ),
                //                     child: Padding(
                //                       padding: const EdgeInsets.all(5.0),
                //                       child: Row(
                //                         children: [
                //                           Padding(
                //                             padding: const EdgeInsets.only(
                //                                 left: 8.0),
                //                             child: Icon(
                //                               Icons.remove_red_eye,
                //                               color: Colors.white,
                //                             ),
                //                           ),
                //                           Padding(
                //                             padding: const EdgeInsets.only(
                //                                 left: 5.0, right: 5),
                //                             child: Text(
                //                               "3",
                //                               textAlign: TextAlign.start,
                //                               style: GoogleFonts.inter(
                //                                   fontSize: 18,
                //                                   fontWeight: FontWeight.w500,
                //                                   color: Color.fromARGB(
                //                                       255, 255, 255, 255)),
                //                             ),
                //                           ),
                //                         ],
                //                       ),
                //                     )),
                //                 SizedBox(
                //                   width: 5,
                //                 ),
                //                 Container(
                //                     alignment: Alignment.topCenter,
                //                     decoration: BoxDecoration(
                //                       color: Color.fromARGB(255, 129, 181, 241),
                //                       borderRadius: BorderRadius.only(
                //                           topRight: Radius.circular(10.0),
                //                           bottomRight: Radius.circular(10.0),
                //                           topLeft: Radius.circular(10.0),
                //                           bottomLeft: Radius.circular(10.0)),
                //                     ),
                //                     child: Padding(
                //                       padding: const EdgeInsets.all(5.0),
                //                       child: Row(
                //                         children: [
                //                           Padding(
                //                             padding: const EdgeInsets.only(
                //                                 left: 8.0),
                //                             child: Icon(
                //                               Icons.thumb_up,
                //                               color: Colors.white,
                //                             ),
                //                           ),
                //                           Padding(
                //                             padding: const EdgeInsets.only(
                //                                 left: 5.0, right: 5),
                //                             child: Text(
                //                               "54",
                //                               textAlign: TextAlign.start,
                //                               style: GoogleFonts.inter(
                //                                   fontSize: 18,
                //                                   fontWeight: FontWeight.w500,
                //                                   color: Color.fromARGB(
                //                                       255, 255, 255, 255)),
                //                             ),
                //                           ),
                //                         ],
                //                       ),
                //                     )),
                //                 SizedBox(
                //                   width: 5,
                //                 ),
                //                 Container(
                //                     alignment: Alignment.topCenter,
                //                     decoration: BoxDecoration(
                //                       color: Color.fromARGB(255, 129, 181, 241),
                //                       borderRadius: BorderRadius.only(
                //                           topRight: Radius.circular(10.0),
                //                           bottomRight: Radius.circular(10.0),
                //                           topLeft: Radius.circular(10.0),
                //                           bottomLeft: Radius.circular(10.0)),
                //                     ),
                //                     child: Padding(
                //                       padding: const EdgeInsets.all(5.0),
                //                       child: Row(
                //                         children: [
                //                           Padding(
                //                             padding: const EdgeInsets.only(
                //                                 left: 8.0),
                //                             child: Icon(
                //                               Icons.comment,
                //                               color: Colors.white,
                //                             ),
                //                           ),
                //                           Padding(
                //                             padding: const EdgeInsets.only(
                //                                 left: 5.0, right: 5),
                //                             child: Text(
                //                               "123",
                //                               textAlign: TextAlign.start,
                //                               style: GoogleFonts.inter(
                //                                   fontSize: 18,
                //                                   fontWeight: FontWeight.w500,
                //                                   color: Color.fromARGB(
                //                                       255, 255, 255, 255)),
                //                             ),
                //                           ),
                //                         ],
                //                       ),
                //                     )),
                //               ],
                //             ),
                //           )
                //         ],
                //       ),
                //     ),
                //   );
                // },