import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:healingapp/pages/yourQue.dart';

class AskQue extends StatefulWidget {
  const AskQue({Key? key}) : super(key: key);

  @override
  _AskQueState createState() => _AskQueState();
}

class _AskQueState extends State<AskQue> {
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref("User/123");
  String? ttl, sub, desc;

  List<String> _subjects = [
    'Sugar',
    'Diabtise',
    'bood pressure',
    'SkinPoblem',
    'Fever',
    'Cold',
    'Vaccine',
    'Cancer',
    'Heartattack'
  ]; // Option 2
  String? _selectedLocation; // Option 2

  final TextEditingController _Textcontroller = TextEditingController();
  // String desc = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                MaterialPageRoute(builder: (context) =>  yourQue()),
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
                      border: OutlineInputBorder(),
                      labelText: 'Title',
                    ),
                  style: TextStyle(fontFamily: 'Arial',fontSize: 20.0,),
                    onChanged: (getTitle) {
                      ttl = getTitle;
                      // print('$ttl');
                    }),
              ),
             Expanded(child: DropdownButton(
                isExpanded: true,
                hint: Text('Subject'), // Not necessary for Option 1
                value: _selectedLocation,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedLocation = newValue;
                    sub = newValue;
                  });
                },
                items: _subjects.map((location) {
                  return DropdownMenuItem(
                    child: new Text(location,style: TextStyle(fontFamily: 'Arial',fontSize: 20.0,),),
                    value: location,
                  );
                }).toList(),
              ),),
              (_Textcontroller.value.text.length <= 90 &&
                      _Textcontroller.value.text.isEmpty)
                  ? Text("Please describe your problem(In 90 words)")
                  : Text('Long Message please short it...'),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: _Textcontroller,
                  minLines: 2,
                  maxLines: 8,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      labelText: "Ask your Qustion in (90 word)",
                      hintText: 'Ask Your Question',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      )),
                  onChanged: (getDesc) {
                    desc = getDesc;
                  },
                ),
              ),
            ],
          ),
        ),
      ),

// floatingActionButton: FloatingActionButton(onPressed: (){},tooltip:'increment',child: Icon(Icons.add),),
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
}
// commit some changes
