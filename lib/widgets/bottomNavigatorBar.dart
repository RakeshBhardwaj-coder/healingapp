import 'package:flutter/material.dart';
import 'package:healingapp/pages/askQue.dart';
import 'package:healingapp/pages/helpUs.dart';
import 'package:healingapp/pages/home_page.dart';
import 'package:healingapp/pages/login_page.dart';
import 'package:healingapp/pages/news_Page.dart';
import 'package:healingapp/pages/signup.dart';
import 'package:healingapp/pages/yourQue.dart';
import 'package:healingapp/try.dart';
// import 'package:healingapp/pages/yourQue.dart';

class bottomNavigatorBar extends StatefulWidget {
  const bottomNavigatorBar({Key? key}) : super(key: key);

  @override
  State<bottomNavigatorBar> createState() => _bottomNavigatorBarState();
}

class _bottomNavigatorBarState extends State<bottomNavigatorBar> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    LoginPage(),
    SignUpPage(),
    AskQue(),
    HelpUs()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.lightBlue,
        unselectedItemColor: Colors.white.withOpacity(.60),
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 255, 255, 255),
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
            label: "Categories",

            icon: Icon(Icons.category),
          ),
          BottomNavigationBarItem(
            // title: Text('Places'),
            label: "News",

            icon: Icon(Icons.newspaper),
          ),
          BottomNavigationBarItem(
            // title: Text('News'),
            label: "Suggestion",

            icon: Icon(Icons.settings_suggest),
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}
