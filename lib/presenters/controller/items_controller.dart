import 'package:get/get.dart';
import 'package:inventoryapp/model/firestore/items_model.dart';
import 'package:inventoryapp/presenters/controller/getx_controller.dart';

class ItemsCtrl {
  static var controller = Get.put(ValController());
  static var itemsModel = ItemsModel();

  static addItems(String name) async {
    int items=0;
    var result = await itemsModel.add({"name": name,"items":items});
    if (result) {
      Get.snackbar("Message", "Added Successful");
    } else {
      Get.snackbar("Message", "Failed!");
    }
  }

  static deleteItems(String documentID) async {
    bool result = await itemsModel.delete(documentID);
    if (result) {
      controller.mgsStatus.value = "Delete Success";
      //  return "Delete Success";
    } else {
      controller.mgsStatus.value = "Delete Success";
      // return "Failed to Delete!";
    }
  }

  static updateItems(String docID, dynamic value) async {
    bool data = await itemsModel.update(docID, value);
    if (data) {
      controller.mgsStatus.value = "Update Success.";
    } else {
      controller.mgsStatus.value = "Update Failed!";
    }
  }

  static updateItemsQuantity(String docID, int value) async {
    bool data = await itemsModel.updateQuantity(docID, value);
    if (data) {
      controller.mgsStatus.value = "Update Success.";
    } else {
      controller.mgsStatus.value = "Update Failed!";
    }
  }

  static itemsNameList() async {
    List<String> data = [];
    await itemsModel.getAllData().then((value) {
      for (var object in value) {
        data.add(object.name);
      }
    });
    controller.categoryNameList.assignAll(data);
  }

  static getAllItems() async {
    List<Items> data;
    data = await itemsModel.getAllData();
    controller.dataList.assignAll(data);
  }

  static void uiUpdate() {
    getAllItems();
    Get.appUpdate();
  }
}
