// a dart file containing widget shared among the ui's

// function for each container in the homepage
// used to create the 5 boxes
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
Widget bottomContainer(
    text,R,G,B,double height,double left,context
    ){
  return Positioned(
    left: left,
    bottom: 0,
    child: Container(
      width: MediaQuery.of(context).size.width/5,
      height:height,
      color: Color.fromRGBO(R, G, B, 1.0),
      alignment: Alignment.center,
      child: Text(
          text, style:GoogleFonts.lato(
        textStyle: TextStyle(color: Colors.white,
            fontWeight: FontWeight.bold, fontSize: 28),
      )
      ),
    ) ,
  );
}

// Elevated button shared among all the widget in the ui

elevatedButton(
    color, double height, double width, double fontSize, text, fontWeight,textColor,
    onPressed
    ){
  return ElevatedButton(
      onPressed: onPressed,

      style: ElevatedButton.styleFrom(
          primary: color,
          elevation: 4.0,
          shape: new RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(10.0),
  ),
          fixedSize: Size(width,height)),

      child: Text(
        text,
        style: TextStyle(
            color: textColor, fontSize: fontSize, fontWeight: fontWeight),
      ));
}

// list class for both list of shape and transfomation dropdown
class ListItem{
  int value;
  String name;
  ListItem(this.value, this.name);
}