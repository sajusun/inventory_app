import 'package:cloud_firestore/cloud_firestore.dart';

// custom model
class CatModel {
  late String id;
  late String name;

  CatModel(this.id, this.name);
}

class CategoryModel {
  var db = FirebaseFirestore.instance;
  List<CatModel> catList = [];
  String collectionPath = "/inventory/category/categoryList";

  // add category method
  Future<bool> add(dynamic data) async {
    await db.collection(collectionPath).add(data).then((documentSnapshot) {
      return true;
    }, onError: (e) {
      return false;
    });
    return false;
  }

  // delete item method
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

  // update item method
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

  // retrieve category data from firebase store
  Future<List<CatModel>> getAll() async {
    List<CatModel> cList = [];
    await db.collection(collectionPath).get().then(
      (querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          cList.add(CatModel(docSnapshot.id, docSnapshot.data()['name']));
        }
      },
      onError: (e) => print("Error completing: $e"),
    );
    return cList;
  }

  // retrieve category data from firebase store
  Future<List<CatModel>> getAllData() async {
    List<CatModel> docList = [];
    await db.collection(collectionPath).get().then((querySnapshot) {
      for (var docSnapshot in querySnapshot.docs) {
        docList.add(CatModel(docSnapshot.id, docSnapshot.data()['name']));
      }
    });
    return docList;
  }
}
