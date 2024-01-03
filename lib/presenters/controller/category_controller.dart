

import 'package:get/get.dart';
import 'package:inventoryapp/presenters/controller/getX_controller.dart';

import '../../model/firestore/category_model.dart';

class CategoryCtrl {
  static var controller = Get.put(ValController());
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

  static updateCategory(String docID, dynamic value) async {
    bool data=await categoryModel.update(docID, value);
    if(data){
      controller.updateStatus.value="Update Success.";
    }else{
      controller.updateStatus.value="Update Failed!";
    }
  }

  static List<CatModel> getAllCategory() {
    List<CatModel> data=[];
 categoryModel.getAllData().then((value) {
  data.addAll(value);
});
 return data;
  }
}
