import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healingapp/pages/blogPage.dart';
import 'package:healingapp/pages/userprofiles/editProfilePage.dart';
import 'package:healingapp/pages/userprofiles/userProfile.dart';
import 'package:healingapp/utils/userPreferences.dart';
import 'package:healingapp/widgets/profileWidget.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:healingapp/pages/userprofiles/userProfile.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  final currentUser = FirebaseAuth.instance.currentUser;
  final userId = FirebaseAuth.instance.currentUser!.uid;
  // firebase_storage.Reference ref =
  // String userName = currentUser!.uid.toString();
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('User')
      .doc('$userid')
      .collection('Message')
      .snapshots();
  static get userid => FirebaseAuth.instance.currentUser?.uid;
  final user = UserPreferences.getUser();

  @override
  Widget build(BuildContext context) {
    // final user = UserPreferences.myUser;

    // const userImageUrl =
    //     "https://raw.githubusercontent.com/RakeshBhardwaj-coder/RakeshBhardwaj.github.io/master/rks_logo.jpeg";
    return Drawer(
      child: Container(
        color: Colors.blue,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,

          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ProfileWidget(
                  imagePath: user.imagePath,
                  onClicked: () async {
                    //   await Navigator.of(context).push(
                    //     MaterialPageRoute(builder: (context) => EditProfilePage()),
                    //   );
                    //   setState(() {});
                  }),
            ),
            const SizedBox(
              height: 24,
            ),

            buildName(user),
            const SizedBox(height: 48),
            buildAbout(user),
            // const DrawerHeader(
            //   padding: EdgeInsets.zero,
            //   child: UserAccountsDrawerHeader(
            //       margin: EdgeInsets.zero,
            //       accountName: Text("{data.docs[index]['name']}"),
            //       accountEmail: Text("Erak"),
            //       currentAccountPicture: CircleAvatar(
            //         backgroundColor: Colors.white,
            //         backgroundImage: NetworkImage(userImageUrl),
            //       )),
            // ),
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
                CupertinoIcons.plus_app,
                color: Colors.white,
              ),
              title: Text(
                "Health Blog",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () {
                // Update the state of the app.
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlogPage(),
                    ));

                // Navigator.pop(context);
              },
            ),

            SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: OutlinedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      overlayColor: MaterialStateProperty.all(
                          Colors.lightBlueAccent[700]),
                      shadowColor: MaterialStateProperty.all(
                          Colors.lightBlueAccent[700]),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0))),
                    ),
                    child: Text(
                      "SignOut",
                      style: TextStyle(
                          color: Colors.lightBlue, fontWeight: FontWeight.bold),
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

  Future<String> downloadURL(String imageName) async {
    String downloadURL = await firebase_storage.FirebaseStorage.instance
        .ref('profileImages/$userId' + '.jpg')
        .getDownloadURL();
    return downloadURL;
  }
}
