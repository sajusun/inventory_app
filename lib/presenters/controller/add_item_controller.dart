
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:inventoryapp/model/firestore/category_model.dart';
import 'package:inventoryapp/model/firestore/items_model.dart';
import 'package:inventoryapp/model/firestore/product_model.dart';
import 'package:inventoryapp/presenters/controller/getx_controller.dart';
import '../../model/firestore/item_model_model.dart';

class AddItemController {
  static var controller = Get.put(ValController());
  static TextEditingController quantity = TextEditingController();

  static addItem() async {
    var itemName = controller.itemsNameDropdownValue.value;
    var itemModel = controller.itemModelDropdownValue.value;
    var category = controller.categoryDropdownValue.value;


    if(itemName.isNotEmpty && itemModel.isNotEmpty && category.isNotEmpty && quantity.text.isNotEmpty) {
      var data = {
        "itemName": itemName,
        "itemModel": itemModel,
        "category": category,
        "quantity": int.parse(quantity.text)
      };
      var result = await ProductsModel().add(data);
      if (result) {
        Get.snackbar("Message", "Product Added");
        setDefault();
      } else {
        Get.snackbar("Message", "Failed !!");
      }
    }else{
      Get.snackbar("Message", "Input All Field");
    }

    // Get.snackbar("title", """${controller.itemsNameDropdownValue}
    // ${controller.categoryDropdownValue}
    // ${controller.itemModelDropdownValue}
    // ${quantity.text}
    // """);
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

  static setDefault(){
    controller.categoryDropdownHints.value="Select Category";
    controller.itemModelDropdownHints.value="Select Model/Color";
    controller.itemsNameDropdownHints.value="Select Items";
    controller.itemModelDropdownValue.value="";
    controller.itemsNameDropdownValue.value="";
    controller.categoryDropdownValue.value="";
    quantity.text="";
  }
  static uiUpdate() {
setDefault();
    categoryNameList();
    itemModelNameList();
    itemsNameList();
  }
}
