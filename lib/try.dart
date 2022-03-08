import 'package:flutter/material.dart';

class Tryapp extends StatefulWidget {
  const Tryapp({Key? key}) : super(key: key);

  @override
  _TryState createState() => _TryState();
}

class _TryState extends State<Tryapp> {
  String name = "";
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Container(
            child: TextField(
              decoration: InputDecoration(
                hintText: "hii enter",
              ),
              onChanged: (value) {
                name = value;
              
              setState(() {
                
              });},
              
            ),
          ),
          Container(
            child: Text('Hii $name'),
          )
        ],
      ),
    );
  }
}
