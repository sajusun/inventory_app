import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel{
  var db = FirebaseFirestore.instance;

  void addCategory(dynamic data){
    // Add a new document with a generated id.
    // final data = {"name": "Tokyo",};
    // db.collection("inventory").doc("category").collection("categoryList").add(data).then((documentSnapshot) =>
    //     print("Added Data with ID: ${documentSnapshot.id}"));

    db.collection("/inventory/category/categoryList").add(data).then((documentSnapshot) =>
    print("Added Data with ID: ${documentSnapshot.id}"));
  }

  // retrieve category data from firebase store
  getAllCategory(){
    db.collection("/inventory/category/categoryList").get().then(
          (querySnapshot) {
        print("Successfully completed");
        for (var docSnapshot in querySnapshot.docs) {
          print('${docSnapshot.id} => ${docSnapshot.data()}');
        }
      },
      onError: (e) => print("Error completing: $e"),
    );
  }
}
