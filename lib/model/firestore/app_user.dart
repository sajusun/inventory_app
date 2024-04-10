import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:inventoryapp/model/firestore/pathLink.dart';
import 'package:inventoryapp/presenters/controller/signup_controller.dart';
import '../../presenters/controller/getx_controller.dart';

class UserProfile {
  late String uid;
  String companyName = "";
  String authorName = "";
  String email = "";
  late String pass;
}

class AppUser {
  var controller = Get.put(ValController());
  // SignupCtrl signupCtrl =SignupCtrl();
  var db = FirebaseFirestore.instance;
  String collectionPath = PathLink.userProfile;

  // signup method
  signUp(dynamic data) async {
    await db.collection(collectionPath).doc(data['uid']).set(data).then(
        (documentSnapshot) {
          controller.userAlert.value=" Signup Success";
      controller.buttonFlag.value = false;
    }, onError: (e) {
      controller.userAlert.value="Signup Failed!";
      controller.buttonFlag.value = false;
    });
  }

  authRegister(data) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: data['email'],
        password: data['password'],
      );
       signUp(({
        "companyName": data['companyName'],
        "authorName": data['authorName'],
        "email": data['email'],
        "password": data['password'],
        "uid": credential.user?.uid
      }));

      //  makeProfile(credential.user!.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        controller.userAlert.value="The password provided is too weak.'";
        controller.buttonFlag.value = false;
        if (kDebugMode) {
          print('The password provided is too weak.');
        }
      } else if (e.code == 'email-already-in-use') {

        controller.userAlert.value= "The account already exists for that email";
        controller.buttonFlag.value = false;
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
  }

  userLogin() {}

  static String currentUser() {
    return FirebaseAuth.instance.currentUser!.uid;
  }

  Future<dynamic> userProfile(String docID) async {
    dynamic data;
    await db.collection(collectionPath).doc(docID).get().then((query) {
      //   stockValue = query.data()!["stockItems"];
      if (query.data()!.isNotEmpty) {
        data = query.data();
      }
    });
    return data;
  }
}
