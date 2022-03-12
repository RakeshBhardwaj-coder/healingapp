import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class AskQue extends StatefulWidget {
  const AskQue({Key? key}) : super(key: key);

  @override
  _AskQueState createState() => _AskQueState();
}

class _AskQueState extends State<AskQue> {
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref("User/123");

  List<String> _locations = [
    'Sugar',
    'Diabtise',
    'bood pressure',
    'D',
    'e',
    'f',
    'g',
    'h',
    'i'
  ]; // Option 2
  String? _selectedLocation; // Option 2

  final TextEditingController _Textcontroller = TextEditingController();
  String desc = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.send,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
              writeDataToDatabase("sugar", "sugar", "bahutbadi problem");
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
  obscureText: true,
  decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'Title',
  ),
),
               ),
              Container(
                child: DropdownButton(
                  
                  hint: Text(
                      'Subject'), // Not necessary for Option 1
                  value: _selectedLocation,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedLocation = newValue as String?;
                    });
                  },
                  items: _locations.map((location) {
                    return DropdownMenuItem(
                      child: new Text(location),
                      value: location,
                    );
                  }).toList(),
                ),
              ),
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
                      hintText: 'Ask Your Question',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),

// floatingActionButton: FloatingActionButton(onPressed: (){},tooltip:'increment',child: Icon(Icons.add),),
    );
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
