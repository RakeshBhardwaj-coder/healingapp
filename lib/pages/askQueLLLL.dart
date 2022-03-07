import 'package:flutter/material.dart';

class AskQuellllllll extends StatefulWidget {
  const AskQuellllllll({Key? key}) : super(key: key);

  @override
  State<AskQuellllllll> createState() => _AskQuellllllllState();
}

class _AskQuellllllllState extends State<AskQuellllllll> {
  @override
  Widget build(BuildContext context) {
    String probDesc = "aaa";
    return Material(
      child: Scaffold(
        appBar: AppBar(title: Text('$probDesc')),
        body: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                height: 60,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Icon(
                          Icons.link,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Describe your problem...",
                          hintStyle: TextStyle(color: Colors.black54),
                          // border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          probDesc = value;
                          // pwidgetobDesc);
                          setState(() {});
                        },
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    FloatingActionButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                        size: 18,
                      ),
                      backgroundColor: Colors.blue,
                      elevation: 0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
