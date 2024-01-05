import 'package:cloud_firestore/cloud_firestore.dart';

// custom model
class ItemModel {
  late String id;
  late String name;

  ItemModel(this.id, this.name);
}

class ProductModel {
  var db = FirebaseFirestore.instance;
  List<ItemModel> modelList = [];
  String collectionPath = "/inventory/products/itemModelList";

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

  // retrieve Model data from firebase store
  Future<List<ItemModel>> getAll() async {
    List<ItemModel> list = [];
    await db.collection(collectionPath).get().then(
          (querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          list.add(ItemModel(docSnapshot.id, docSnapshot.data()['name']));
        }
      },
      onError: (e) => print("Error completing: $e"),
    );
    return list;
  }

  // retrieve Model data from firebase store
  Future<List<ItemModel>> getAllData() async {
    List<ItemModel> docList = [];
    await db.collection(collectionPath).get().then((querySnapshot) {
      for (var docSnapshot in querySnapshot.docs) {
        docList.add(ItemModel(docSnapshot.id, docSnapshot.data()['name']));
      }
    });
    return docList;
  }
}
