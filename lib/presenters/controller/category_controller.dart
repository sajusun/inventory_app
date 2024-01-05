import 'package:get/get.dart';
import 'package:inventoryapp/presenters/controller/getX_controller.dart';
import '../../model/firestore/category_model.dart';

class CategoryCtrl {
  static var controller = Get.put(ValController());
  static var categoryModel = CategoryModel();

  static addCategory(String name) async {
    var result = await categoryModel.add({"name": name});
    if (result) {
      Get.snackbar("Message", "Added Successful");
    } else {
      Get.snackbar("Message", "Failed!");
    }
  }

  static deleteCategory(String documentID) async {
    bool result = await categoryModel.delete(documentID);
    if (result) {
      controller.mgsStatus.value = "Delete Success";
      //  return "Delete Success";
    } else {
      controller.mgsStatus.value = "Delete Success";
      // return "Failed to Delete!";
    }
  }

  static updateCategory(String docID, dynamic value) async {
    bool data = await categoryModel.update(docID, value);
    if (data) {
      controller.mgsStatus.value = "Update Success.";
    } else {
      controller.mgsStatus.value = "Update Failed!";
    }
  }

  static categoryNameList() async {
    List<String> data = [];
    await categoryModel.getAllData().then((value) {
      for (var object in value) {
        data.add(object.name);
      }
    });
    controller.categoryNameList.assignAll(data);
  }

  static getAllCat() async {
    List<CatModel> data;
    data = await categoryModel.getAllData();
    controller.categoryList.assignAll(data);
  }

  static void uiUpdate() {
    getAllCat();
    Get.appUpdate();
  }
}
