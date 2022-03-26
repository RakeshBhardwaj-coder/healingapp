import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:healingapp/model/userModel.dart';
import 'package:healingapp/utils/userPreferences.dart';
import 'package:healingapp/widgets/buttonWidget.dart';
import 'package:healingapp/widgets/profileWidget.dart';
import 'package:healingapp/widgets/textFieldWidget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class EditProfilePage extends StatefulWidget {
  EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late User user;

  @override
  void initState() {
    super.initState();

    user = UserPreferences.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        backgroundColor: Color.fromARGB(0, 0, 0, 0),
        shadowColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            ProfileWidget(
                imagePath: user.imagePath,
                isEdit: true,
                onClicked: () async {
                  final image =
                      await ImagePicker().getImage(source: ImageSource.gallery);
                  if (image == null) return;
                  final directory = await getApplicationDocumentsDirectory();
                  final name = basename(image.path);
                  final imageFile = File('${directory.path}/$name');
                  final newImage = await File(image.path).copy(imageFile.path);

                  setState(() {
                    user = user.copy(imagePath: newImage.path);
                  });
                }),
            const SizedBox(
              height: 24,
            ),
            TextFieldWidget(
              label: 'Full Name',
              text: user.name,
              onChanged: (name) => user = user.copy(name: name),
            ),
            const SizedBox(
              height: 24,
            ),
            TextFieldWidget(
              label: 'Email',
              text: user.email,
              onChanged: (email) => user = user.copy(email: email),
            ),
            const SizedBox(
              height: 24,
            ),
            TextFieldWidget(
              label: 'About',
              text: user.about,
              maxLines: 4,
              onChanged: (about) => user = user.copy(about: about),
            ),
            const SizedBox(
              height: 24,
            ),
            ButtonWidget(
                text: "Save",
                onClicked: () {
                  UserPreferences.setUser(user);
                  Navigator.of(context).pop();
                })
          ],
        ),
      ),
    );
  }
}
