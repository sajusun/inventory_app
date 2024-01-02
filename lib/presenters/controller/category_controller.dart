import '../../model/firestore/category_model.dart';

class CategoryCtrl extends CategoryModel{
  static var categoryModel = CategoryModel();

  static addCategory(String name) async {
   var result = await categoryModel.add({"name":name});
   if(result){

   }else{

   }

 }


  static deleteCategory(String documentID) async{
    bool result =await categoryModel.delete(documentID);
    if (result) {
      return "Delete Success";
    } else {
      return "Failed to Delete!";
    }
  }

  static updateCategory() {}

  static getAllCategory() {}
}
