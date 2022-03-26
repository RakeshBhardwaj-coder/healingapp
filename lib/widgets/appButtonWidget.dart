// ignore_for_file: file_names, must_be_immutable
 
import 'package:flutter/cupertino.dart';
 
class AppButtonsWidget extends StatelessWidget {
  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;
  final String text;
  double widthsize;
  double heightsize;
  double fontsize;
  bool? isIcon;
  IconData? icon;
 
  AppButtonsWidget({ Key? key, 
  required this.textColor, 
  required this.backgroundColor, 
  required this.borderColor, 
  required this.text, 
  required this.widthsize,
  required this.heightsize,
  required this.fontsize,
  this.isIcon=false,
  this.icon }) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthsize,
      height: heightsize,
      child: Center(
        child:isIcon==false?Text(
          text,style: TextStyle(color: textColor,fontSize: fontsize)
          ):Icon(icon ,color: textColor,)
          ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: borderColor,
          width: 1.0,
        )
      )
    );
  }
}

