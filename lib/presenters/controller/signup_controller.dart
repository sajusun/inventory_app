import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'getx_controller.dart';

class SignupCtrl{

  static var controller = Get.put(ValController());
  final TextEditingController authorName = TextEditingController();
  final TextEditingController companyName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final TextEditingController pass2 = TextEditingController();

  add(){
   if(companyName.text.isEmpty || authorName.text.isEmpty || email.text.isEmpty || pass.text.isEmpty){
     print("fill all input");
   }else{
     if(email.text.isEmail && pass.text == pass2.text){
       print("all success");
     }else if(!email.text.isEmail) {
       print("invalid email");
     }else if(pass.text!=pass2.text){
       print("not match");
     }else{
       print("program error");
     }
   }
  }


}