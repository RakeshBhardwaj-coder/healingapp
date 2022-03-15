import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_core/firebase_core.dart';

class CameraWidget extends StatefulWidget {
  @override
  State createState() {
    // TODO: implement createState
    return CameraWidgetState();
  }
}

class CameraWidgetState extends State {
  File? _imageFile;

  PickedFile? imageFile = null;
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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Pick Image Camera"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Card(
                child: (imageFile == null)
                    ? Text("data")
                    : Image.file(File(imageFile!.path)),
              ),
              MaterialButton(
                textColor: Colors.white,
                color: Colors.pink,
                onPressed: () {
                  _showChoiceDialog(context);
                },
                child: Text("Select Image"),
              ),
              MaterialButton(
                textColor: Colors.white,
                color: Colors.pink,
                onPressed: () {
                  uploadImageToFirebase(context);
                },
                child: Text("upload to database"),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _openGallery(BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );

    setState(() {
      imageFile = pickedFile!;
    });

    Navigator.pop(context);
  }

  void _openCamera(BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );
    setState(() {
      imageFile = pickedFile;
    });
    Navigator.pop(context);
  }

// final picker = ImagePicker();

//   Future pickImage() async {
//     final pickedFile = await picker.getImage(source: ImageSource.camera);

//     setState(() {
//       _imageFile = File(pickedFile.path);
//     });
//   }

  Future<void> uploadImageToFirebase(BuildContext context) async {
    // String fileName = basename(imageFile);
    firebase_storage.Reference ref =
        firebase_storage.FirebaseStorage.instance.ref('test/');

    Directory appDocDir = await getApplicationDocumentsDirectory();
    String filePath = '${appDocDir.absolute}/file-to-upload.png';

    File file = File(filePath);

    InkWell(
      child: Text("Tap to Upload"),
      onTap: () async {
        // File image = await File("assets/img/pic.jpg").create();
        // it creates the file,
        // if it already existed then just return it
        // or run this if the file is created before the onTap
        // if(image.existsSync()) image = await image.create();
      },
    );

    // StorageUploadTask uploadTask = firebaseStorageRef.putFile(imageFile);
    // StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    // taskSnapshot.ref.getDownloadURL().then(
    //       (value) => print("Done: $value"),
    //     );
  }
}
