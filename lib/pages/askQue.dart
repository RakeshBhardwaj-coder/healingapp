import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:healingapp/model/userCardAPI.dart';
import 'package:healingapp/model/userCardModel.dart';
import 'package:healingapp/model/userModel.dart';
import 'package:healingapp/userServices/yourQue.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:healingapp/utils/getCurrentUserId.dart';
import 'package:healingapp/utils/getFirstName.dart';
import 'package:healingapp/utils/userAskQuePreferences.dart';
import 'package:healingapp/widgets/bottomNavigatorBar.dart';
import 'package:image_picker/image_picker.dart';

class AskQue extends StatefulWidget {
  AskQue({Key? key}) : super(key: key);

  @override
  _AskQueState createState() => _AskQueState();
}

final FirebaseAuth auth = FirebaseAuth.instance;
// int index = 0;

class _AskQueState extends State<AskQue> {
  // late UserAskQuePreferences userAsked;
  @override
  void initState() {
    GetFirstName.getFirstName();
    GetFirstName.name;
    super.initState();

    // userAsked = UserAskQuePreferences.getUser();
  }

  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref('User');

  var user = FirebaseAuth.instance.currentUser;

  String? ttl, sub, prob, howWeHelp, naam;
  String? dropdownValue;
  PickedFile? imageFile = null;

  List<String> _subjects = [
    'Sugar',
    'Diabtise',
    'Mental Health',
    'Stress',
    'Dipression',
    'Bood Pressure',
    'SkinPoblem',
    'Fever',
    'Cold',
    'Cancer',
    'Heartattack',
    'Vaccine',
    'Other'
  ]; // Option 2
  // String? _selectedLocation; // Option 2

  final TextEditingController _Textcontroller = TextEditingController();
  // String desc = "";
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => bottomNavigatorBar()),
            ),
          ),
        ),
        body: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: TextField(
                          // obscureText: true,
                          decoration: InputDecoration(
                            // focusColor: Colors.red,
                            border: OutlineInputBorder(),
                            labelText: 'Title',
                          ),
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 20.0,
                          ),
                          onChanged: (getTitle) {
                            ttl = getTitle;
                            // print('$ttl');
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Expanded(
                        child: DropdownSearch<String>(
                            dropdownSearchDecoration: InputDecoration(
                              // isCollapsed: true,
                              // isDense: true,

                              hintText: "Select Option",
                              labelText: "Your Problem realted to",
                              contentPadding: EdgeInsets.fromLTRB(10, 10, 0, 0),

                              border: OutlineInputBorder(),
                            ),
                            mode: Mode.DIALOG,
                            // maxHeight: 2000,
                            showSearchBox: true,
                            showSelectedItems: true,
                            // showClearButton: true,
                            items: _subjects,
                            // onFind: _subjects,
                            // popupItemDisabled: (String s) => s.startsWith("V"),

                            onChanged: (getsub) {
                              sub = getsub;
                            }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: TextFormField(
                        textAlign: TextAlign.left,
                        // controller: _Textcontroller,
                        minLines: 2,
                        maxLines: 8,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                            isDense: false,
                            labelText: "Say your Problem in (90 words)",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            )),
                        onChanged: (getDesc) {
                          prob = getDesc;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: TextFormField(
                        textAlign: TextAlign.left,
                        // controller: _Textcontroller,
                        minLines: 2,
                        maxLines: 8,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                            isDense: false,
                            labelText: "How we can help you...",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            )),
                        onChanged: (getHowWeHelp) {
                          howWeHelp = getHowWeHelp;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blueAccent[700],
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0),
                              topLeft: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0)),
                        ),
                        child: MaterialButton(
                          child: Text(
                            "Add problem",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () async {
                            final uid = user?.uid;
                            // UserAskQuePreferences.setAskUser(userAsked);
                            // addToCard(cardDetails);
                            UserCardAPI.createCard(UserAskCardModel(
                              title: '$ttl',
                              subject: '$sub',
                              problem: '$prob',
                              howWeHelp: '$howWeHelp',
                              // mId: '$uid',
                              uId: '${GetCurrentUserId.currentUserId}',
                              name: '${GetFirstName.name}',
                              createdTime: DateTime.now(),
                              like: 0,
                              watch: 0,
                              comments: 0,
                            ));

                            // // UserCardAPI.createCard(cardModel);
                            // if (index != 0) {
                            //   print('l');

                            //   // createData(uid);
                            //   // readData(uid);
                            // }
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => bottomNavigatorBar(),
                                ));
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

// floatingActionButton: FloatingActionButton(onPressed: (){},tooltip:'increment',child: Icon(Icons.add),),
      ),
    );
  }

  //clear text
  // void clearText() {
  //   // fieldText.clear();
  // }
  // void addToCard(UserAskCardModel cardModel) =>
  //     UserCardAPI.createCard(cardModel);
  // void createData(uid) {
  //   ref.child("$uid/$index").set({
  //     'title': '$ttl',
  //     'subject': '$sub',
  //     'problem': '$prob',
  //     'how we can help': '$howWeHelp'
  //   });
  // }
  // final cardDetails = UserAskCardModel(title: ttl, subject: sub, problem: prob howWeHelp: howWeHelp, id: uid);

  // void readData(uid) async {
  //   final title = await ref.child('$uid/1/title').get();
  //   final l = title.value;
  //   print(l);
  //   final subject = await ref.child('$uid/1/subject').get();
  // }

  // void updateData(
  //     uid, String title, String subject, String problem, String howWeHelp) {
  //   final postData = {
  //     'title': title,
  //     'subject': subject,
  //     'problem': problem,
  //     'howWeHelp': howWeHelp,
  //   };

  // Get a key for a new Post.
  // final newPostKey =
  //     FirebaseDatabase.instance.ref().child('posts').push().key;

  // Write the new post's data simultaneously in the posts list and the
  // user's post list.
  //   final Map<String, Map> updates = {};
  //   updates['/posts/$newPostKey'] = postData;
  //   updates['/user-posts/$uid/$newPostKey'] = postData;

  //   ref.child('$uid').update(updates);
  // }

  // writeDataToDatabase(
  //   String title,
  //   String subject,
  //   String problem,
  // ) async {
  //   await ref.set({
  //     "title": "$title",
  //     "subject": "$subject",
  //     "problem": "$problem"
  //   }).then((_) {
  //     // Data saved successfully!
  //     print("Data Saved Successflly");
  //   }).catchError((error) {
  //     // The write failed...
  //     print("Error occured.");
  //   });
  // }

  void _openGallery(BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );

    setState(() {
      imageFile = pickedFile!;
    });

    Navigator.pop(context);
  }

  void _openCamera(BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );
    setState(() {
      imageFile = pickedFile!;
    });
    Navigator.pop(context);
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Choose option",
              style: TextStyle(color: Colors.blue),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Divider(
                    height: 1,
                    color: Colors.blue,
                  ),
                  ListTile(
                    onTap: () {
                      _openGallery(context);
                    },
                    title: Text("Gallery"),
                    leading: Icon(
                      Icons.account_box,
                      color: Colors.blue,
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.blue,
                  ),
                  ListTile(
                    onTap: () {
                      _openCamera(context);
                    },
                    title: Text("Camera"),
                    leading: Icon(
                      Icons.camera,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
// commit some changes

      