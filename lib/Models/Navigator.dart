import 'package:flutter/material.dart';
import 'package:transformationapp/views/pages/landingPage.dart';

class NavigatorClass{
  navigateTo(context,page){
    return Navigator.push(context, MaterialPageRoute(builder: (context)=>page
    ));
  }

}