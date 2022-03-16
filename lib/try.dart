import 'dart:ffi';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:path/path.dart';

class CameraWidget extends StatefulWidget {
  @override
  State createState() {
    // TODO: implement createState
    return CameraWidgetState();
  }
}

class CameraWidgetState extends State {
  File? _imageFile;
  File? afile;

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
    return Material(
      child: Scaffold(
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
                  onPressed: () async {
                    // _showChoiceDialog(context);
                    uploadImageToFirebase();
                    //     FilePickerResult result = await FilePicker.platform.pickFiles(
                    //   // allowMultiple: true,
                    //   // type: FileType.custom,
                    //   // allowedExtensions: ['jpg', 'png', 'jpeg'],
                    // );
                  },
                  child: Text("uPload"),
                ),
                ElevatedButton(
                    onPressed: () async {
                      final reslt = await FilePicker.platform.pickFiles();
                      if (reslt == null) return;

                      final file = reslt.files.first;
                      final afilePath = file.path!;
                      setState(() {
                        afile = File(afilePath);
                      });

                      print('$afilePath');
                    },
                    child: Text("aaa"))
              ],
            ),
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

  Future uploadImageToFirebase() async {
    if (afile == null) return;
    try {
      final filaName = basename(afile!.path);
      final destination = ('test/$filaName');
      final ref = firebase_storage.FirebaseStorage.instance.ref(destination);
       StorageUploadTask uploadTask = ref.putFile(File(filaName));   
      ref.putFile(File(filaName));
    
    } on firebase_storage.FirebaseException catch (e) {
      return null;
    }
    // ref.putFile(filaName!);
  }
}
