import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:inventoryapp/model/firestore/pathLink.dart';

class UserProfile {
  late String uid;
  late String companyName;
  late String authorName;
  late String email;
  late String pass;
}

class AppUser {
  var db = FirebaseFirestore.instance;
  String collectionPath = PathLink.userProfile;

  // signup method
  signUp(dynamic data) async {
    var result = "";

    await db.collection(collectionPath).add(data).then((documentSnapshot) {
      result = "success";
    }, onError: (e) {
      result = "failed";
    });
    return result;
  }

  authRegister(data) async {
    String? response = "";
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: data['email'],
        password: data['pass'],
      );
      response = signUp(
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
        if (kDebugMode) {
          print('The password provided is too weak.');
        }
      } else if (e.code == 'email-already-in-use') {
        response = "The account already exists for that email";
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
}
