import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healingapp/features/CommentWriten.dart';
import 'package:healingapp/model/CommentModel.dart';
import 'package:healingapp/model/CommentModelAPI.dart';
import 'package:healingapp/userServices/yourQue.dart';
import 'package:healingapp/utils/getCurrentUserId.dart';
import 'package:healingapp/utils/getFirstName.dart';
import 'package:healingapp/utils/profileImageDatabase.dart';
import 'package:healingapp/utils/navigatePage.dart';
import 'package:healingapp/widgets/bottomNavigatorBar.dart';

class CommentBoxWidget extends StatefulWidget {
  @override
  _CommentBoxWidgetState createState() => _CommentBoxWidgetState();
}

class _CommentBoxWidgetState extends State<CommentBoxWidget> {
  final docCommentModel = FirebaseFirestore.instance
      .collection('User')
      .doc('${GetCurrentUserId.currentUserId}')
      .collection('Message')
      .doc('KepqjAWcolUFzkPGorEL')
      .collection('Comments')
      .snapshots();
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  List filedata = [
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
  @override
  void initState() {
    // TODO: implement initState
    GetFirstName.getFirstName();
    GetFirstName.name;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(
          color: Colors.black,
          onPressed: () => NavigatePage.pageNavigator(context, yourQue()),
        ),
      ),
      body: Container(
        child: CommentBox(
          userImage: "${ProfileImageDatabase.downloadURL}",
          child: ListView(
            children: [
              for (var i = 0; i < filedata.length; i++)
                Padding(
                  padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
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
                                  new BorderRadius.all(Radius.circular(50))),
                          child: CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  NetworkImage(filedata[i]['pic'] + "$i")),
                        ),
                      ),
                      title: Text(
                        filedata[i]['name'], //data[i]['name']
                        style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Expanded(
                        child: Text(
                          filedata[i]['message'],
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
          ),
          labelText: 'Write a comment...',
          withBorder: false,
          errorText: 'Comment cannot be blank',
          sendButtonMethod: () {
            if (formKey.currentState!.validate()) {
              print(commentController.text);
              setState(() {
                var value = {
                  'name': 'New User',
                  'pic':
                      'https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400',
                  'message': commentController.text
                };
                filedata.insert(0, value);
                CommentWriten(filedata.length);
                CommentModelAPI.createComment(CommentModel(
                    userId: GetCurrentUserId.currentUserId,
                    // commId: '123',
                    userName: GetFirstName.name,
                    commitMsg: commentController.text));
              });
              commentController.clear();
              FocusScope.of(context).unfocus();
            } else {
              print("Not validated");
            }
          },
          formKey: formKey,
          commentController: commentController,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          sendWidget: Icon(Icons.send_sharp, size: 30, color: Colors.black),
        ),
      ),
    );
  }
}

// StreamBuilder<QuerySnapshot>(
//               stream: docCommentModel,
//               builder: (BuildContext context,
//                   AsyncSnapshot<QuerySnapshot> snapshot) {
//                 if (snapshot.hasError) {
//                   return Text('Something went wrong');
//                 }
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Text('Name is Loading...');
//                 }
//                 final data = snapshot.requireData;
//                 return ListView.builder(
//                   // scrollDirection: Axis.horizontal,
//                   itemCount: data.size,
//                   itemBuilder: (context, index) {
//                     return ListView(
//                       children: [
//                         for (var i = 0; i < filedata.length; i++)
//                           Padding(
//                             padding:
//                                 const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
//                             child: Container(
//                               child: ListTile(
//                                 leading: GestureDetector(
//                                   onTap: () async {
//                                     // Display the image in large form.
//                                     print("Comment Clicked");
//                                   },
//                                   child: Container(
//                                     height: 50.0,
//                                     width: 50.0,
//                                     decoration: new BoxDecoration(
//                                         color: Colors.blue,
//                                         borderRadius: new BorderRadius.all(
//                                             Radius.circular(50))),
//                                     child: CircleAvatar(
//                                         radius: 50,
//                                         backgroundImage: NetworkImage(
//                                             filedata[i]['pic'] + "$i")),
//                                   ),
//                                 ),
//                                 title: Text(
//                                   filedata[i]['name'], //data[i]['name']
//                                   style: GoogleFonts.inter(
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                                 subtitle: Expanded(
//                                   child: Text(
//                                     filedata[i]['message'],
//                                     textAlign: TextAlign.left,
//                                     style: GoogleFonts.lato(
//                                         color: Colors.black87,
//                                         fontWeight: FontWeight.w500,
//                                         fontSize: 19),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                       ],
//                     ); //levra
//                   },
//                 );
//               }),
