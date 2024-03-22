import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  late String uid;
  late String companyName;
  late String authorName;
  late String email;
  late String pass;
}

class UserProfile{

  var db =FirebaseFirestore.instance;
  String collectionPath = "/inventory/profileData/";

  // add category method
  Future<bool> add(String uid,dynamic data) async {
    var result = false;

    await db.collection("$collectionPath$uid").add(data).then((documentSnapshot) {
      result = true;
    }, onError: (e) {
      result = false;
    });
    return result;
  }
}