import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:healingapp/pages/yourQue.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:healingapp/widgets/bottomNavigatorBar.dart';
import 'package:image_picker/image_picker.dart';

class AskQue extends StatefulWidget {
  const AskQue({Key? key}) : super(key: key);

  @override
  _AskQueState createState() => _AskQueState();
}

class _AskQueState extends State<AskQue> {
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref("User/123");
  String? ttl, sub, desc;
  String? dropdownValue;
  PickedFile? imageFile = null;

  List<String> _subjects = [
    'Sugar',
    'Diabtise',
    'Bood Pressure',
    'SkinPoblem',
    'Fever',
    'Cold',
    'Cancer',
    'Heartattack',
    'Vaccine'
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
          actions: <Widget>[
            IconButton(
              //send Button to database
              
              icon: Icon(
                Icons.send,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => yourQue()),
                );

                // do something
                writeDataToDatabase('$ttl', '$sub', '$desc');

                //
              },
            )
          ],
        ),
        body: Center(
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

                      onChanged: print,
                    ),
                  ),
                ),
                // GridView.count(
                //     crossAxisCount: 2,
                //     // Generate 100 widgets that display their index in the List.
                //     children: List.generate(
                //       100,
                //       (index) {
                //         return Center(
                //           child: Text(
                //             'Item $index',
                //             style: Theme.of(context).textTheme.headline5,
                //           ),
                //         );
                //       },
                //     )),
                // Container(
                //   child: SearchableDropdown.single(
                //     //  items: _subjects,
                //     value: _subjects,
                //     hint: "Select one",
                //     searchHint: "Select one",
                //     onChanged: print,
                //     // (value) {
                //     //   setState(() {
                //     //     dropdownValue = value;
                //     //   });
                //     // },
                //     isExpanded: true,
                //   ),
                // ),
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
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        )),
                    onChanged: (getDesc) {
                      desc = getDesc;
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
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        )),
                    onChanged: (getDesc) {
                      desc = getDesc;
                    },
                  ),
                ),

                // Container(
                //     //   alignment: Alignment.topLeft,
                //     //   child: IconButton(
                //     //     onPressed: () => _showChoiceDialog(context),
                //     //     icon: Icon(
                //     //       Icons.add_a_photo,
                //     //       size: 70,
                //     //     ),
                //     //   ),
                //     // image:  Image.network(
                //     //   'https://icons-for-free.com/iconfiles/png/512/gallery+image+landscape+mobile+museum+open+line+icon-1320183049020185924.png',
                //     //   height: 150,
                //     // ),

                //     ),
              ],
            ),
          ),
        ),

// floatingActionButton: FloatingActionButton(onPressed: (){},tooltip:'increment',child: Icon(Icons.add),),
      ),
    );
  }

  //clear text
  void clearText() {
    // fieldText.clear();
  }

  writeDataToDatabase(
    String title,
    String subject,
    String problem,
  ) async {
    await ref.set({
      "title": "$title",
      "subject": "$subject",
      "problem": "$problem"
    }).then((_) {
      // Data saved successfully!
      print("Data Saved Successflly");
    }).catchError((error) {
      // The write failed...
      print("Error occured.");
    });
  }

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

      