import 'package:flutter/material.dart';
import 'package:healingapp/pages/askQue.dart';
import 'package:healingapp/pages/home_page.dart';
import 'package:healingapp/pages/login_page.dart';
import 'package:healingapp/pages/yourQue.dart';
// import 'package:healingapp/pages/yourQue.dart';

class bottomNavigatorBar extends StatefulWidget {
  const bottomNavigatorBar({Key? key}) : super(key: key);

  @override
  State<bottomNavigatorBar> createState() => _bottomNavigatorBarState();
}

class _bottomNavigatorBarState extends State<bottomNavigatorBar> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    AskQue(),
    LoginPage(),
    // yourQue()
    yourQue()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.lightBlue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            //  Text('Favorites'),
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            // title: Text('Music'),
            label: "Home",

            icon: Icon(Icons.music_note),
          ),
          BottomNavigationBarItem(
            // title: Text('Places'),
            label: "Home",

            icon: Icon(Icons.location_on),
          ),
          BottomNavigationBarItem(
            // title: Text('News'),
            label: "Home",

            icon: Icon(Icons.library_books),
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}
