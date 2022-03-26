// ignore_for_file: unused_import, prefer_const_constructors
 
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:healingapp/widgets/drawer.dart';
import 'package:healingapp/widgets/appButtonWidget.dart'; 
 
 
class CategoriesPage extends StatefulWidget {
  const CategoriesPage({ Key? key }) : super(key: key);
 
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}
 
class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Healing App"),
      ),
      body: SingleChildScrollView(
        child: Column(
          
          children: [
            Padding(
            padding: EdgeInsets.only(top: 16,left: 16,right: 16),
            child: TextField(
              decoration: InputDecoration(
            hintText: "Search related you problem...",
            hintStyle: TextStyle(color: Colors.grey.shade600),
            prefixIcon: Icon(Icons.search,color: Colors.grey.shade600, size: 20,),
            filled: true,
            fillColor: Colors.grey.shade100,
            contentPadding: EdgeInsets.all(8),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                    color: Colors.grey.shade300
                )
            ),
              ),
            ),
            ),
            SizedBox(height: 20.0,),
              Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.spaceAround,
                spacing: 1,
                children:[
                TextButton(
                  onPressed: () {  },
                  child: AppButtonsWidget(
                    textColor: Colors.white,
                    backgroundColor: Colors.lightBlueAccent,
                    borderColor: Colors.black,
                    text: "Brain",
                    widthsize: 90,
                    heightsize: 85,
                    fontsize: 20,
                   ),
                ),
                  TextButton(
                   onPressed: () {  },
                   child: AppButtonsWidget(
                    textColor: Colors.white,
                    backgroundColor: Colors.lightBlueAccent,
                    borderColor: Colors.black,
                    text: "Bone",
                    widthsize: 90,
                    heightsize: 85,
                    fontsize:20
                 
                   ),
                 ),TextButton(
                   onPressed: () {  },
                   child: AppButtonsWidget(
                    textColor: Colors.white,
                    backgroundColor: Colors.lightBlueAccent,
                    borderColor: Colors.black,
                    text: "Scin",
                    widthsize: 90,
                    heightsize: 85,
                    fontsize: 20
                   ),
                 ),TextButton(
                   onPressed: () {  },
                   child: AppButtonsWidget(
                    textColor: Colors.white,
                    backgroundColor: Colors.lightBlueAccent,
                    borderColor: Colors.black,
                    text: "Chest",
                    widthsize: 90,
                    heightsize: 85,
                    fontsize: 20,
                   ),
                 ),
                 TextButton(onPressed: () {  },
                 child: AppButtonsWidget(
                  textColor: Colors.white,
                  backgroundColor: Colors.lightBlueAccent,
                  borderColor: Colors.black,
                  text: "Kidney",
                  widthsize: 90,
                  heightsize: 85,
                  fontsize: 20,
                 ),),
                 TextButton(
                   onPressed: () {  },
                   child: AppButtonsWidget(
                    textColor: Colors.white,
                    backgroundColor: Colors.lightBlueAccent,
                    borderColor: Colors.black,
                    text: "Hand",
                    widthsize: 90,
                    heightsize: 85,
                    fontsize: 20,
                   ),
                 ),TextButton(
                   onPressed: () {  },
                   child: AppButtonsWidget(
                    textColor: Colors.white,
                    backgroundColor: Colors.lightBlueAccent,
                    borderColor: Colors.black,
                    text: "Leg",
                    widthsize: 90,
                    heightsize: 85,
                    fontsize: 20,
                   ),
                 ),TextButton(
                   onPressed: () {  },
                   child: AppButtonsWidget(
                    textColor: Colors.white,
                    backgroundColor: Colors.lightBlueAccent,
                    borderColor: Colors.black,
                    text: "Eye",
                    widthsize: 90,
                    heightsize: 85,
                    fontsize: 20,
                   ),
                 ),
                 TextButton(
                   onPressed: () {  },
                   child: AppButtonsWidget(
                    textColor: Colors.white,
                    backgroundColor: Colors.lightBlueAccent,
                    borderColor: Colors.black,
                    text: "Leaver",
                    widthsize: 90,
                    heightsize: 85,
                    fontsize: 20,
                   ),
                 ),TextButton(
                   onPressed: () {  },
                   child: AppButtonsWidget(
                    textColor: Colors.white,
                    backgroundColor: Colors.lightBlueAccent,
                    borderColor: Colors.black,
                    text: "Mouth",
                    widthsize: 90,
                    heightsize: 85,
                    fontsize: 20,
                   ),
                 ),TextButton(
                   onPressed: () {  },
                   child: AppButtonsWidget(
                    textColor: Colors.white,
                    backgroundColor: Colors.lightBlueAccent,
                    borderColor: Colors.black,
                    text: "Hair",
                    widthsize: 90,
                    heightsize: 85,
                    fontsize: 20,
                   ),
                 ),TextButton(
                   onPressed: () {  },
                   child: AppButtonsWidget(
                    textColor: Colors.white,
                    backgroundColor: Colors.lightBlueAccent,
                    borderColor: Colors.black,
                    text: "Blood",
                    widthsize: 90,
                    heightsize: 85,
                    fontsize: 20,
                   ),
                 ),TextButton(
                   onPressed: () {  },
                   child: AppButtonsWidget(
                    textColor: Colors.white,
                    backgroundColor: Colors.lightBlueAccent,
                    borderColor: Colors.black,
                    text: "Ear",
                    widthsize: 90,
                    heightsize: 85,
                    fontsize: 20,
                   ),
                 ),TextButton(
                   onPressed: () {  },
                   child: AppButtonsWidget(
                    textColor: Colors.white,
                    backgroundColor: Colors.lightBlueAccent,
                    borderColor: Colors.black,
                    text: "Stomach",
                    widthsize: 90,
                    heightsize: 85,
                    fontsize: 20,
                   ),
                 ),TextButton(
                   onPressed: () {  },
                   child: AppButtonsWidget(
                    textColor: Colors.white,
                    backgroundColor: Colors.lightBlueAccent,
                    borderColor: Colors.black,
                    text: "Breath",
                    widthsize: 90,
                    heightsize: 85,
                    fontsize: 20,
                   ),
                 ),TextButton(
                   onPressed: () {  },
                   child: AppButtonsWidget(
                    textColor: Colors.white,
                    backgroundColor: Colors.lightBlueAccent,
                    borderColor: Colors.black,
                    text: "Heart",
                    widthsize: 90,
                    heightsize: 85,
                    fontsize: 20,
                   ),
                 ),TextButton(
                   onPressed: () {  },
                   child: AppButtonsWidget(
                    textColor: Colors.white,
                    backgroundColor: Colors.lightBlueAccent,
                    borderColor: Colors.black,
                    text: "Teeth",
                    widthsize: 90,
                    heightsize: 85,
                    fontsize: 20,
                   ),
                 ),
                 TextButton(
                   onPressed: () {  },
                   child: AppButtonsWidget(
                    textColor: Colors.white,
                    backgroundColor: Colors.lightBlueAccent,
                    borderColor: Colors.black,
                    text: "Knee",
                    widthsize: 90,
                    heightsize: 85,
                    fontsize: 20,
                   ),
                 ),TextButton(
                   onPressed: () {  },
                   child: AppButtonsWidget(
                    textColor: Colors.white,
                    backgroundColor: Colors.lightBlueAccent,
                    borderColor: Colors.black,
                    text: "Elbow",
                    widthsize: 90,
                    heightsize: 85,
                    fontsize: 20,
                   ),
                 ),TextButton(
                   onPressed: () {  },
                   child: AppButtonsWidget(
                    textColor: Colors.white,
                    backgroundColor: Colors.lightBlueAccent,
                    borderColor: Colors.black,
                    text: "Neck",
                    widthsize: 90,
                    heightsize: 85,
                    fontsize: 20,
                   ),
                 ),TextButton(
                   onPressed: () {  },
                   child: AppButtonsWidget(
                    textColor: Colors.white,
                    backgroundColor: Colors.lightBlueAccent,
                    borderColor: Colors.black,
                    text: "Shoulder",
                    widthsize: 90,
                    heightsize: 85,
                    fontsize: 20,
                   ),
                 ),
                ]
              ),
            
                ]
        ),
      ),
  
      drawer: const MyDrawer(),
      
    );
  }
}





