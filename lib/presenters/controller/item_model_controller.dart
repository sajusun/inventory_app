import 'package:get/get.dart';
import 'package:inventoryapp/model/firestore/item_model_model.dart';
import 'package:inventoryapp/presenters/controller/getX_controller.dart';


class ModelCtrl {
  static var controller = Get.put(ValController());
  static var productModel = ProductModel();

  static addModel(String name) async {
    var result = await productModel.add({"name":name});
    if(result){
      Get.snackbar("Message", "Added Successful");
    }else{
      Get.snackbar("Message", "Failed!");
    }
  }

  static deleteModel(String documentID) async{
    bool result =await productModel.delete(documentID);
    if (result) {
      controller.mgsStatus.value="Delete Success";
      //  return "Delete Success";
    } else {
      controller.mgsStatus.value="Delete Success";
      // return "Failed to Delete!";
    }
  }

  static updateModel(String docID, dynamic value) async {
    bool data=await productModel.update(docID, value);
    if(data){
      controller.mgsStatus.value="Update Success.";
    }else{
      controller.mgsStatus.value="Update Failed!";
    }
  }

  static Future<List<ItemModel>> getAllCategory() async {
    List<ItemModel> data;
    data =  await productModel.getAllData();
    return data;
  }

  static  getAllCat() async {
    List<ItemModel> data;
    data =  await productModel.getAllData();
    controller.categoryList.assignAll(data);
  }
  static void uiUpdate(){
    getAllCat();
    Get.appUpdate();
  }
}
