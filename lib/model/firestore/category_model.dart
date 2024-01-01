import 'package:cloud_firestore/cloud_firestore.dart';

// custom model
class CatModel{
  late String id;
  late String name;
  CatModel(this.id, this.name);
}


class CategoryModel {
  var db = FirebaseFirestore.instance;
  late List<CatModel>? catList;
String collectionPath = "/inventory/category/categoryList";

  // add category method
  void addCategory(dynamic data){
    db.collection(collectionPath).add(data).then((documentSnapshot) =>
    print("Added Data with ID: ${documentSnapshot.id}"));
  }
  // delete item method
  bool delete(String id){
    db.collection(collectionPath).doc(id).delete().then(
          (doc){ return true;},
      onError: (e) {return false;},
    );
    return false;
  }
  // update item method
  void update(String docID, dynamic value){
    final docIdRef = db.collection(collectionPath).doc(docID);
    docIdRef.update({"name": value}).then(
            (value) => print("DocumentSnapshot successfully updated!"),
        onError: (e) => print("Error updating document $e"));
  }

  // retrieve category data from firebase store
  Future<List<CatModel>> getAllCategory() async{
    List<CatModel> cList=[];
    await db.collection(collectionPath).get().then(
          (querySnapshot) {
        print("Successfully completed");
        for (var docSnapshot in querySnapshot.docs) {
          print('${docSnapshot.id} => ${docSnapshot.data()}');
          cList.add(CatModel(docSnapshot.id, docSnapshot.data()['name']));
        }
      },
      onError: (e) => print("Error completing: $e"),
    );
    return cList;
  }
}
