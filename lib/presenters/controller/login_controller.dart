import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:inventoryapp/model/firestore/app_user.dart';
import 'package:inventoryapp/presenters/controller/user_profile.dart';
import 'package:inventoryapp/view/pages/home_page.dart';
import 'package:inventoryapp/view/pages/login.dart';
import 'getx_controller.dart';

class LoginCtrl {
  // UserProfile userProfile=UserProfile();

  var controller = ValController();
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();

  validateData() async {
    if (email.text.isEmail && pass.text.isNotEmpty) {
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email.text, password: pass.text);
        //  print(credential.user?.uid);
        controller.userAlert.value ="";
        controller.tokenId.value = credential.user!.uid;
        loginStatus();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          if (kDebugMode) {
            print('No user found for that email.');
          }
        } else if (e.code == 'wrong-password') {
          if (kDebugMode) {
            print('Wrong password provided for that user.');
          }
        }
        controller.buttonFlag.value = false;
        controller.userAlert.value = "User Not Found!";
      }
    } else {
      controller.buttonFlag.value = false;
      controller.userAlert.value = "Input all Valid Data!";
      if (kDebugMode) {
        print("input all valid data");
      }
    }
  }

  loginStatus() {
    if (FirebaseAuth.instance.currentUser != null) {
      //print(FirebaseAuth.instance.currentUser?.uid);
      controller.tokenId.value = FirebaseAuth.instance.currentUser!.uid;
      // print(" my log id ${FirebaseAuth.instance.currentUser!.uid}");
      controller.buttonFlag.value = false;
      Get.to(() => HomePage());
    } else {
      controller.buttonFlag.value = false;
      Get.to(() => Login());
    }
  }

  logOut() async {
    await FirebaseAuth.instance.signOut();
    loginStatus();
  }
}
