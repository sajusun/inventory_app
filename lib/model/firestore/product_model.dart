import 'package:cloud_firestore/cloud_firestore.dart';

// custom model
class Products {
  late String? id;
  late String? itemName;
  late String? modelName;
  late String? category;
  late int? quantity;

  Products(this.id, this.itemName,this.modelName,this.category,this.quantity);
}

class ProductsModel {
  var db = FirebaseFirestore.instance;
  String collectionPath = "/inventory/products/productsList";
  // add product  method
  Future<bool> add(dynamic data) async {
    var result=false;
    await db.collection(collectionPath).add(data).then((documentSnapshot) {
      result= true;
    }, onError: (e) {
      result= false;
    });
    return result;
  }

  // delete product model method
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

  // update product  method
  // Future<bool> update(String docID, dynamic value) async {
  //   bool result = false;
  //   final docIdRef = db.collection(collectionPath).doc(docID);
  //   await docIdRef.update({"name": value}).then((value) {
  //     result = true;
  //   }, onError: (e) {
  //     result = false;
  //   });
  //   return result;
  // }

  // retrieve Product data from firebase store
  Future<List<Products>> getAllItems() async {
    List<Products> docList = [];
    await db.collection(collectionPath).where("category", isEqualTo: "All").get().then((querySnapshot) {
      for (var docSnapshot in querySnapshot.docs) {
        docList.add(Products(docSnapshot.id, docSnapshot.data()['itemName'],docSnapshot.data()['itemModel'],docSnapshot.data()["category"],docSnapshot.data()["quantity"]));
      }
    });
    return docList;
  }
}
