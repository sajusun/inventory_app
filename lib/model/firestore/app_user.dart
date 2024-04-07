import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:inventoryapp/model/firestore/pathLink.dart';

import '../../presenters/controller/getx_controller.dart';

class UserProfile {
  late String uid;
   String companyName="";
   String authorName="";
   String email="";
  late String pass;
}

class AppUser {
  static var controller = Get.put(ValController());
  var db = FirebaseFirestore.instance;
  String collectionPath = PathLink.userProfile;

  // signup method
  signUp(dynamic data) async {
    var result = "";
//print(collectionPath);

    await db.collection(collectionPath).doc(data['uid']).set(data).then((documentSnapshot) {
      result = "success";
      controller.buttonFlag.value=false;
    }, onError: (e) {
      result = "failed";
      controller.buttonFlag.value=false;
    });
    return result;
  }

  authRegister(data) async {
    String? response = "";
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: data['email'],
        password: data['password'],
      );
      response=  signUp(
            ({
              "companyName": data['companyName'],
              "authorName": data['authorName'],
              "email": data['email'],
              "password": data['password'],
              "uid":credential.user?.uid
            }));


      //  makeProfile(credential.user!.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        response = "The password provided is too weak.'";
        controller.buttonFlag.value=false;
        if (kDebugMode) {
          print('The password provided is too weak.');
        }
      } else if (e.code == 'email-already-in-use') {
        response = "The account already exists for that email";
        controller.buttonFlag.value=false;

        if (kDebugMode) {
          print('The account already exists for that email.');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    //   end off try block
    return response;
  }

  userLogin(){

  }
static String currentUser(){
    return FirebaseAuth.instance.currentUser!.uid;
  }

  Future<dynamic> userProfile(String docID) async {
    UserProfile userProfile =UserProfile();
    dynamic data;
    await db.collection(collectionPath).doc(docID).get().then((query) {
   //   stockValue = query.data()!["stockItems"];
      if(query.data()!.isNotEmpty) {
        // userProfile.uid = query.data()?['uid'];
        // userProfile.authorName = query.data()?['authorName'];
        // userProfile.companyName = query.data()?['companyName'];
        // userProfile.email = query.data()?['email'];
        // userProfile.pass = query.data()?['password'];
        data=query.data();
      }
      // print("userprofile");
      // print(collectionPath);
      // print(query.data()?['uid']);
  });
    //controller.userProfile=userProfile;
    return data;
        }

}
