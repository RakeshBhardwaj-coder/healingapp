import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healingapp/pages/userprofiles/editProfilePage.dart';
import 'package:healingapp/pages/userprofiles/userProfile.dart';
import 'package:healingapp/utils/userPreferences.dart';
import 'package:healingapp/widgets/profileWidget.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final currentUser = FirebaseAuth.instance.currentUser;
  // String userName = currentUser!.uid.toString();

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    const userImageUrl =
        "https://raw.githubusercontent.com/RakeshBhardwaj-coder/RakeshBhardwaj.github.io/master/rks_logo.jpeg";
    return Drawer(
      child: Container(
        color: Colors.blue,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            ProfileWidget(imagePath: user.imagePath, onClicked: () {}),
            const DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  accountName: Text("lnd"),
                  accountEmail: Text("Erak"),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(userImageUrl),
                  )),
            ),
            Divider(
              color: Colors.white,
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                "Your Profile",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () {
                // Update the state of the app.
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(),
                    ));

                // Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text(
                "SignOut",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () async {
                // Update the state of the app.
                // ...
              },
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent[700],
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0)),
                  ),
                  child: MaterialButton(
                    child: Text(
                      "SignOut",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
