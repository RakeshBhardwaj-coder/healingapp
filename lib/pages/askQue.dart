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
      appBar: AppBar(title: Text('')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              (_Textcontroller.value.text.isEmpty)
                  ? Text("Please describe your problem(In 90 words)")
                  : Text('Sent Message:'),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: _Textcontroller,
                  minLines: 2,
                  maxLines: 10,
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
