import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:healingapp/widgets/bottomNavigatorBar.dart';

class yourQue extends StatefulWidget {
  const yourQue({Key? key}) : super(key: key);

  @override
  _yourQueState createState() => _yourQueState();
}

class _yourQueState extends State<yourQue> {
  DatabaseReference ref = FirebaseDatabase.instance.ref("User/123");

  //// try to read database through function...........
  // readDataFromDatabase() async {
  //   DatabaseReference tit = FirebaseDatabase.instance.ref('User/123/title');
  //   DatabaseReference desc = FirebaseDatabase.instance.ref('User/123/problem');
  //   DatabaseReference sub = FirebaseDatabase.instance.ref('User/123/subject');

  //   final event = await tit.once(DatabaseEventType.value);
  //   final title = event.snapshot.value;
  // print(title);
  // tit.onValue.listen((DatabaseEvent event) {
  //   final dataTitle = event.snapshot.value;
  // });
  // desc.onValue.listen((event) {
  //   final description = event.snapshot.value;
  //   print(description);
  // });
  // sub.onValue.listen((event) {
  //   final subject = event.snapshot.value;
  //   print(subject);
  // });
  //   return title;
  // }
  Future<void> databaseTitle() async {
    DatabaseReference tit = FirebaseDatabase.instance.ref('User/123/title');
    final event = await tit.once(DatabaseEventType.value);
    final String title = event.snapshot.value.toString();
    // itemRef = database.reference().child('Test');
  }

  final Future<FirebaseApp> _future = Firebase.initializeApp();
  var userId = 123;
  // String tii = databaseTitle().toString();

  final List<String> imageList = [
    "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80",
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your Questions")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Flexible(
              //   child: FirebaseAnimatedList(query: tit, itemBuilder: (BuildContext context,DataSnapshot snapshot.Animation animation , int index){

              //   }),
              // ),
              Text(
                "a",
                // databaseTitle(),

                textAlign: TextAlign.left,
                style: GoogleFonts.oswald(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  "25-10-2022",
                  style: TextStyle(color: Colors.black38),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0)),
                ),
                child: Text(
                  " sugar ",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.oswald(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.lightBlue),
                ),
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
              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  // readDataFromDatabase();
                },
                child: Text(""),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CarouselSlider.builder(
                    itemCount: imageList.length,
                    options: CarouselOptions(
                      // enlargeCenterPage: true,
                      height: 230,
                      // autoPlay: true,
                      // autoPlayInterval: Duration(seconds: 3),
                      reverse: false,
                      aspectRatio: 2.0,
                    ),
                    itemBuilder: (context, i, id) {
                      return GestureDetector(
                          child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.white,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            imageList[i],
                            width: 500,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ));
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  " want to show a superscript text but not found any example or can anyone help me with this. I have tried Text and RichText also, but not found any metwant to show a superscript text but not found any example or can anyone help me with this. I have tried Text and RichText also, but not found any mwant to show a superscript text but not found any example or can anyone help me with this. I have tried Text and RichText also, but not found any mwant to show a superscript text but not found any example or can anyone help me with this. I have tried Text and RichText also, but not fouwant to show a superscript text but not found any example or can anyone help me with this. I have tried Text and RichText also, but not fouwant to show a superscript text but not found any example or can anyone help me with this. I have tried Text and RichText also, but not fouwant to show a superscript text but not found any example or can anyone help me with this. I have tried Text and RichText also, but not found any method or fields.nd any method or fields.nd any method or fields.nd any method or fields.ethod or fields.ethod or fields.hod or fields.",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
