import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:inventoryapp/view/pages/home_page.dart';
import 'package:inventoryapp/view/pages/login.dart';
import 'getx_controller.dart';

class LoginCtrl{

   var controller = Get.put(ValController());
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();


  validateData() async {
    if(email.text.isEmail && pass.text.isNotEmpty){
      try {
        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email.text,
            password: pass.text
        );
        print(credential.user?.uid);
        controller.tokenId.value=credential.user!.uid;
        loginStatus();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
        controller.buttonFlag.value=false;
      }
    }else{
      controller.buttonFlag.value=false;
      print("input all valid data");
    }
  }

  loginStatus(){
    if (FirebaseAuth.instance.currentUser != null) {
      print(FirebaseAuth.instance.currentUser?.uid);
      controller.buttonFlag.value=false;
      Get.to(()=> const HomePage(title: "Home"));
    }else{
      controller.buttonFlag.value=false;
      Get.to(()=>Login());
    }

  }
  logOut() async {
    await FirebaseAuth.instance.signOut();
    loginStatus();
  }

}