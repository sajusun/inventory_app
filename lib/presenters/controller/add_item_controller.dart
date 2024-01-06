import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:inventoryapp/model/firestore/category_model.dart';
import 'package:inventoryapp/model/firestore/items_model.dart';
import 'package:inventoryapp/presenters/controller/getX_controller.dart';
import '../../model/firestore/item_model_model.dart';

class AddItemController{
  static var controller=Get.put(ValController());
  static TextEditingController itemNumber =TextEditingController();


  static addItem(){
    Get.snackbar("title", """${controller.itemsNameDropdownValue}
    ${controller.categoryDropdownValue}
    ${controller.itemModelDropdownValue}
    ${itemNumber.text}
    """);
  }
  static categoryNameList() async {
    List<String> data = [];
    await CategoryModel().getAllData().then((value) {
      for (var object in value) {
        data.add(object.name);
      }
    });
    controller.categoryNameList.assignAll(data);
  }

  static itemModelNameList() async {
    List<String> data = [];
    await ProductModel().getAllData().then((value) {
      for (var object in value) {
        data.add(object.name);
      }
    });
    controller.itemModelNameList.assignAll(data);
  }
  static itemsNameList() async {
    List<String> data = [];
    await ItemsModel().getAllData().then((value) {
      for (var object in value) {
        data.add(object.name);
      }
    });
    controller.itemsNameList.assignAll(data);
  }

  static uiUpdate(){
    categoryNameList();
    itemModelNameList();
    itemsNameList();
  }
}