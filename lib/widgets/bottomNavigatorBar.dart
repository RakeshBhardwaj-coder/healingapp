import 'package:flutter/material.dart';

class bottomNavigatorBar extends StatelessWidget {
  const bottomNavigatorBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.lightBlue,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(.60),
      selectedFontSize: 14,
      unselectedFontSize: 14,
      onTap: (value) {
        // Respond to item press.
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
    );
  }
}
