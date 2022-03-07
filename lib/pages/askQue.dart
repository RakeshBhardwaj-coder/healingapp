import 'package:flutter/material.dart';

class AskQue extends StatefulWidget {
  const AskQue({Key? key}) : super(key: key);

  @override
  _AskQueState createState() => _AskQueState();
}

class _AskQueState extends State<AskQue> {
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
            },
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              (_Textcontroller.value.text.isEmpty)
                  ? Text("Please describe your problem(In 90 words)")
                  : Text('Send Message in public'),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: _Textcontroller,
                  minLines: 2,
                  maxLines: 8,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      hintText: 'Enter A Message Here',
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
    );
  }
}
