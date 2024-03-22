import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'getx_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupCtrl{

  static var controller = Get.put(ValController());
  final TextEditingController authorName = TextEditingController();
  final TextEditingController companyName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final TextEditingController pass2 = TextEditingController();

  add() async {
   if(companyName.text.isEmpty || authorName.text.isEmpty || email.text.isEmpty || pass.text.isEmpty){
     print("fill all input");
   }else{
     if(email.text.isEmail && pass.text == pass2.text){
       print("all success");
       try {
         final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
           email: email.text,
           password: pass.text,
         );
 makeProfile(credential.user!.uid);

       } on FirebaseAuthException catch (e) {
         if (e.code == 'weak-password') {
           if (kDebugMode) {
             print('The password provided is too weak.');
           }
         } else if (e.code == 'email-already-in-use') {
           if (kDebugMode) {
             print('The account already exists for that email.');
           }
         }
       } catch (e) {
         if (kDebugMode) {
           print(e);
         }
       }
     }else if(!email.text.isEmail) {
       if (kDebugMode) {
         print("invalid email");
       }
     }else if(pass.text!=pass2.text){
       if (kDebugMode) {
         print("not match");
       }
     }else{
       if (kDebugMode) {
         print("program error");
       }
     }
   }
  }

  makeProfile(String uid){
    if (kDebugMode) {
      print(uid);
    }
  }


}