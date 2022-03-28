import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:healingapp/model/userModel.dart';
import 'package:healingapp/utils/userPreferences.dart';
import 'package:healingapp/widgets/buttonWidget.dart';
import 'package:healingapp/widgets/profileWidget.dart';
import 'package:healingapp/widgets/textFieldWidget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:healingapp/services/authHelper.dart';

class EditProfilePage extends StatefulWidget {
  EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late UserDetails user;
  // FirebaseDatabase _database = FirebaseDatabase.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  // DatabaseReference ref = FirebaseDatabase.instance.ref('User');
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('User');
  final uAuth = FirebaseAuth.instance.currentUser;
  final userId = FirebaseAuth.instance.currentUser!.uid;

  @override
  void initState() {
    super.initState();

    user = UserPreferences.getUser();
  }

  String? uName, uEmail, uAbout;
  File? _image;
  File? _profileImage;
  PickedFile? pickedFile;
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
                  // final image =
                  //     await ImagePicker().getImage(source: ImageSource.gallery);
                  // if (image == null) return;
                  // final directory = await getApplicationDocumentsDirectory();
                  // final name = basename(image.path);
                  // final imageFile = File('${directory.path}/$name');
                  // final newImage = await File(image.path).copy(imageFile.path);
                  _showChoiceDialog(context);
                  // setState(() {
                  //   user = user.copyWith(imagePath: newImage.path);
                  // });
                }),
            const SizedBox(
              height: 24,
            ),
            TextFieldWidget(
                label: 'Full Name',
                text: user.name,
                onChanged: (name) {
                  user = user.copyWith(name: name);
                  uName = name;
                }),
            const SizedBox(
              height: 24,
            ),
            TextFieldWidget(
              label: 'Email',
              text: user.email,
              onChanged: (email) {
                uEmail = email;
                user = user.copyWith(email: email);
              },
            ),
            const SizedBox(
              height: 24,
            ),
            TextFieldWidget(
              label: 'About',
              text: user.about,
              maxLines: 4,
              onChanged: (about) {
                uAbout = about;
                user = user.copyWith(about: about);
              },
            ),
            const SizedBox(
              height: 24,
            ),
            ButtonWidget(
                text: "Save",
                onClicked: () async {
                  UserPreferences.setUser(user);
                  final uid = uAuth?.uid;

                  // UserModelAPI.createModel(UserDetails(
                  //     imagePath: 'imagePath',
                  //     name: '$uName',
                  //     email: '$uEmail',
                  //     about: '$uAbout',
                  //     userId: '$uid'));
                  await DatabaseService(uid: uid)
                      .updateUserData("$uName", "$uEmail", '$uAbout');
                  uploadPic(context);

                  Navigator.of(context).pop();
                })
          ],
        ),
      ),
    );
  }

  Future getImage() async {
    final imagef = await ImagePicker().getImage(source: ImageSource.gallery);

    //   setState(() {
    //     // _image = File(imagef!.path);
    //     // print('Image Path $_image');
    //   });
  }

  void _openGallery(BuildContext context) async {
    pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    if (pickedFile == null) return;
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(pickedFile!.path);
    final imageFile = File('${directory.path}/$name');
    final newImage = await File(pickedFile!.path).copy(imageFile.path);

    setState(() {
      user = user.copyWith(imagePath: newImage.path);
      // _image = imageFile;
      _profileImage = newImage;
      // uploadPic(context);
    });

    Navigator.pop(context);
  }

  void _openCamera(BuildContext context) async {
    pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );
    if (pickedFile == null) return;
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(pickedFile!.path);
    final imageFile = File('${directory.path}/$name');
    final newImage = await File(pickedFile!.path).copy(imageFile.path);

    setState(() {
      user = user.copyWith(imagePath: newImage.path);
      // _image = File(pickedFile!.path);
      _profileImage = newImage;
    });
    Navigator.pop(context);
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Choose option",
              style: TextStyle(color: Colors.blue),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Divider(
                    height: 1,
                    color: Colors.blue,
                  ),
                  ListTile(
                    onTap: () {
                      _openGallery(context);
                    },
                    title: Text("Gallery"),
                    leading: Icon(
                      Icons.account_box,
                      color: Colors.blue,
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.blue,
                  ),
                  ListTile(
                    onTap: () {
                      _openCamera(context);
                    },
                    title: Text("Camera"),
                    leading: Icon(
                      Icons.camera,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future uploadPic(BuildContext context) async {
    String fileName = basename(pickedFile!.path);
    if (fileName == null) return;

    // firebase_storage.TaskSnapshot snapshot = await firebase_storage.UploadTask;
//levra2
    try {
      firebase_storage.Reference ref = FirebaseStorage.instance
          .ref()
          .child('profileImages/$userId' + '.jpg');
      ref.putFile(_profileImage!);

      // final destination = ('$fileName');
      // // final ref = firebase_storage.FirebaseStorage.instance.ref(destination);
      setState(() {
        print("profile Updated.");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.lightBlue[400],
            content: Text(
              "profile Updated.",
              style: TextStyle(
                  fontSize: 18, color: Color.fromARGB(255, 255, 255, 255)),
            )));
      });
      //  StorageUploadTask uploadTask = ref.putFile(File(filaName));
      // ref.putFile(File(fileName));
    } on firebase_storage.FirebaseException catch (e) {
      return null;
    }
    // ref.putFile(File(fileName));
  }
}

class DatabaseService {
  String? uid;
  DatabaseService({this.uid});
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('User');
  Future updateUserData(String name, String email, String about) async {
    return await collectionReference
        .doc(uid)
        .set({'name': name, 'email': email, 'about': about});
  }
}
