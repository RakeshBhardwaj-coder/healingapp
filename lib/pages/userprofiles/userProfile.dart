import 'package:flutter/material.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healingapp/model/userModel.dart';
import 'package:healingapp/pages/userprofiles/editProfilePage.dart';
import 'package:healingapp/utils/userPreferences.dart';
import 'package:healingapp/widgets/bottomNavigatorBar.dart';
import 'package:healingapp/widgets/buttonWidget.dart';
import 'package:healingapp/widgets/profileWidget.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = UserPreferences.getUser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => bottomNavigatorBar()),
          ),
        ),
        backgroundColor: Color.fromARGB(0, 0, 0, 0),
        shadowColor: Colors.black,
        elevation: 0,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
              imagePath: user.imagePath,
              onClicked: () async {
                await Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => EditProfilePage()),
                );
                setState(() {});
              }),
          const SizedBox(
            height: 24,
          ),
          buildNameBlackColor(user),
          const SizedBox(height: 48),
          buildAboutBlackColor(user),
        ],
      ),
    );
  }
}

Widget buildName(UserDetails user) => Column(
      children: [
        Text(
          user.name,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          user.email,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white70),
        ),
      ],
    );

Widget buildNameBlackColor(UserDetails user) => Column(
      children: [
        Text(
          user.name,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color.fromARGB(255, 0, 0, 0)),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          user.email,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Color.fromARGB(179, 0, 0, 0)),
        ),
      ],
    );
Widget buildAbout(UserDetails user) => Container(
      padding: EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white70),
          ),
          const SizedBox(height: 16),
          Text(
            user.about,
            style: GoogleFonts.lato(fontSize: 18, color: Colors.white),
          ),
        ],
      ),
    );
Widget buildAboutBlackColor(UserDetails user) => Container(
      padding: EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(179, 0, 0, 0)),
          ),
          const SizedBox(height: 16),
          Text(
            user.about,
            style: GoogleFonts.lato(
                fontSize: 18, color: Color.fromARGB(255, 0, 0, 0)),
          ),
        ],
      ),
    );