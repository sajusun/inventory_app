import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inventoryapp/model/firestore/pathLink.dart';

import 'app_user.dart';

// custom model
class Items {
  late String id;
  late String name;

  Items(this.id, this.name);
}

class ItemsModel {
  var db = FirebaseFirestore.instance;
  List<Items> modelList = [];
  // String collectionPath = "/inventory/products/items";
  String collectionPath = "${PathLink.userData}${AppUser.currentUser()}/items";


  // add model name method
  Future<bool> add(dynamic data) async {
    var result=false;
    await db.collection(collectionPath).add(data).then((documentSnapshot) {
      result= true;
    }, onError: (e) {
      result= false;
    });
    return result;
  }

  // delete item model method
  Future<bool> delete(String id) async {
    bool result = false;
    await db.collection(collectionPath).doc(id).delete().then(
          (doc) {
        result = true;
      },
      onError: (e) {
        result = false;
      },
    );
    return result;
  }

  // update item model method
  Future<bool> update(String docID, dynamic value) async {
    bool result = false;
    final docIdRef = db.collection(collectionPath).doc(docID);
    await docIdRef.update({"name": value}).then((value) {
      result = true;
    }, onError: (e) {
      result = false;
    });
    return result;
  }
  // update i number of tem method
  Future<bool> updateQuantity(String docID, int value) async {
    bool result = false;
    final docIdRef = db.collection(collectionPath).doc(docID);
    await docIdRef.update({"stockItems": value}).then((value) {
      result = true;
    }, onError: (e) {
      result = false;
    });
    return result;
  }

  // retrieve Model data from firebase store
  Future<List<Items>> getAllData() async {
    List<Items> docList = [];
    await db.collection(collectionPath).get().then((querySnapshot) {
      for (var docSnapshot in querySnapshot.docs) {
        docList.add(Items(docSnapshot.id, docSnapshot.data()['name']));
      }
    });
    return docList;
  }
}
