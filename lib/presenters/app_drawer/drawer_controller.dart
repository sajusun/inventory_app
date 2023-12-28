import 'package:flutter/material.dart';

class AppDrawerController{
 static gotoPage(BuildContext context,  dynamic pageClass){
    Navigator.push(
      context, MaterialPageRoute(builder: (context)=>   pageClass())
    );
  }
}