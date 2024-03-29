import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inventoryapp/model/firestore/app_user.dart';
import 'package:inventoryapp/model/firestore/pathLink.dart';

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
  // String collectionPath = "/inventory/products/productsList";
  String collectionPath = "${PathLink.userData}${AppUser.currentUser()}/productsList";

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
  // Future<bool> delete(String id) async {
  //   bool result = false;
  //   await db.collection(collectionPath).doc(id).delete().then(
  //         (doc) {
  //       result = true;
  //     },
  //     onError: (e) {
  //       result = false;
  //     },
  //   );
  //   return result;
  // }

 // update product  method
  Future<bool> update(String docID, dynamic value) async {
    bool result = false;
    final docIdRef = db.collection(collectionPath).doc(docID);
    await docIdRef.update({"quantity": value}).then((value) {
      result = true;
    }, onError: (e) {
      result = false;
    });
    return result;
  }

  // retrieve Product data from firebase store
  Future<List<Products>> getAllItems()  async {
    print("doc ${collectionPath}");
    List<Products> docList = [];
    await db.collection(collectionPath).get().then((querySnapshot) {
      for (var docSnapshot in querySnapshot.docs) {
        docList.add(Products(docSnapshot.id, docSnapshot.data()['itemName'],docSnapshot.data()['itemModel'],docSnapshot.data()["category"],docSnapshot.data()["quantity"]));
      }
    });
    return docList;
  }


  // retrieve Product data from firebase store
  Future<List<Products>> getAllItem() async {
    List<Products> docList = [];
     db.collection(collectionPath).snapshots().listen((event) {
        for (var docSnapshot in event.docs) {
          docList.add(Products(docSnapshot.id, docSnapshot.data()['itemName'],docSnapshot.data()['itemModel'],docSnapshot.data()["category"],docSnapshot.data()["quantity"]));

        }
    });
    return docList;
  }




//   finding items in db
  Future <Map<String, dynamic>> checkItems(String category,String itemName,String itemModel) async {
    Map<String, dynamic> data={};
    await db.collection(collectionPath).where("category",isEqualTo: category)
        .where("itemName",isEqualTo: itemName)
        .where("itemModel",isEqualTo: itemModel)
        .get().then((querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        data = {
          "status": true,
          "docID": querySnapshot.docs[0].id,
          "quantity": querySnapshot.docs[0].data()["quantity"]
        };
      } else {
        data = {"status": false};
      }
    });
     return data;
  }

}
