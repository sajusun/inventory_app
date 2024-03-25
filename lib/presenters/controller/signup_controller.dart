import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventoryapp/model/firestore/app_user.dart';
import 'getx_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupCtrl {
  AppUser appUser = AppUser();

  static var controller = Get.put(ValController());
  final TextEditingController authorName = TextEditingController();
  final TextEditingController companyName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final TextEditingController pass2 = TextEditingController();

  add() async {
    if (companyName.text.isEmpty ||
        authorName.text.isEmpty ||
        email.text.isEmpty ||
        pass.text.isEmpty) {
      controller.signupMgs.value="Fill All Input Field";
      controller.buttonFlag.value=false;
      if(kDebugMode){
        print("fill all input");
      }
    } else {
      if (email.text.isEmail && pass.text == pass2.text) {
        if(kDebugMode){
          print("all field are filled");
        }
        appUser.authRegister( ({
          "companyName": companyName.text,
          "authorName": authorName.text,
          "email": email.text,
          "password": pass.text,
        }));
      //   try {
      //     final credential =
      //         await FirebaseAuth.instance.createUserWithEmailAndPassword(
      //       email: email.text,
      //       password: pass.text,
      //     );
      //     makeProfile(credential.user!.uid);
      //   } on FirebaseAuthException catch (e) {
      //     if (e.code == 'weak-password') {
      //       if (kDebugMode) {
      //         print('The password provided is too weak.');
      //       }
      //     } else if (e.code == 'email-already-in-use') {
      //       if (kDebugMode) {
      //         print('The account already exists for that email.');
      //       }
      //     }
      //   } catch (e) {
      //     if (kDebugMode) {
      //       print(e);
      //     }
      //   }
      // //   end off try block
      } else if (!email.text.isEmail) {
        controller.signupMgs.value="input Valid Email !";
        controller.buttonFlag.value=false;
        if (kDebugMode) {
          print("invalid email");
        }
      } else if (pass.text != pass2.text) {
        controller.signupMgs.value="Password Not Match!";
        controller.buttonFlag.value=false;
        if (kDebugMode) {
          print("not match");
        }
      } else {
        controller.buttonFlag.value=false;
        if (kDebugMode) {
          print("program error");
        }
      }
    }
  }

  // makeProfile(String uid) async {
  //   var result=await appUser.signUp(
  //       ({
  //         "companyName": companyName.text,
  //         "authorName": authorName.text,
  //         "email": email.text,
  //         "password": pass.text,
  //         "uid": uid
  //       }));
  //   if(result){
  //     Get.snackbar("Registration", "Success");
  //   }else{
  //     Get.snackbar("Registration", "Failed");
  //
  //   }
  //   if (kDebugMode) {
  //     print(uid);
  //   }
  // }
}
