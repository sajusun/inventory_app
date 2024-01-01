import 'package:cloud_firestore/cloud_firestore.dart';

class CatModel{
  late String id;
  late String name;

  CatModel(this.id, this.name);
}


class CategoryModel {
  var db = FirebaseFirestore.instance;
  late List<CatModel>? catList;

  void addCategory(dynamic data){
    // Add a new document with a generated id.
    // final data = {"name": "Tokyo",};
    // db.collection("inventory").doc("category").collection("categoryList").add(data).then((documentSnapshot) =>
    //     print("Added Data with ID: ${documentSnapshot.id}"));

    db.collection("/inventory/category/categoryList").add(data).then((documentSnapshot) =>
    print("Added Data with ID: ${documentSnapshot.id}"));
  }
  void delete(String id){
    db.collection("/inventory/category/categoryList").doc(id).delete().then(
          (doc) => print("Document deleted"),
      onError: (e) => print("Error updating document $e"),
    );
  }

  // retrieve category data from firebase store
  Future<List<CatModel>> getAllCategory() async{
    List<CatModel> cList=[];
    await db.collection("/inventory/category/categoryList").get().then(
          (querySnapshot) {
        print("Successfully completed");
        for (var docSnapshot in querySnapshot.docs) {
          print('${docSnapshot.id} => ${docSnapshot.data() as Map<String, dynamic>}');
          // catList.add({"id":docSnapshot.id,"name":docSnapshot.data()});
          cList.add(CatModel(docSnapshot.id, docSnapshot.data().toString()));
        }
      },
      onError: (e) => print("Error completing: $e"),
    );
    return cList;
  }
}
