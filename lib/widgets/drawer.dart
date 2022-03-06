import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const userImageUrl = "https://raw.githubusercontent.com/RakeshBhardwaj-coder/RakeshBhardwaj.github.io/master/rks_logo.jpeg";
    return Drawer(
      child: Container(
        color: Colors.blue,
        child: ListView(
          padding: EdgeInsets.zero,
          children:  const [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                

                margin: EdgeInsets.zero,
                  accountName: Text('Rakesh Bhardwaj'),
                  accountEmail: Text("Rb610883@gmail.com"),
                  currentAccountPicture:CircleAvatar( 
                  backgroundImage:
                      NetworkImage(userImageUrl),
                ) ),


            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text("Home",
              style: TextStyle(
                color: Colors.white,
              ),
              )
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text("Profile",
              style: TextStyle(
                color: Colors.white,
              ),
              )
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text("Mail",
              style: TextStyle(
                color: Colors.white,
              ),
              )
            ),
          ],
        ),
        
      ),
    );
  }
}