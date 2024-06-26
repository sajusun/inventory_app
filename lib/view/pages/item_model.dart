import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventoryapp/view/widgets/button_style.dart';
import '../../presenters/controller/item_model_controller.dart';

class ProductModel extends StatelessWidget {

  static TextEditingController txtController = TextEditingController();
  static TextEditingController txtEditController = TextEditingController();

  const ProductModel({super.key});

  Widget textInputWidget() {
    if (ModelCtrl.controller.buttonFlag.isTrue) {
      return TextFormField(
        controller: txtController,
        autofocus: true,
      );
    } else {
      return const Text("Product Model List");
    }
  }

  Widget iconWidget() {
    if (ModelCtrl.controller.buttonFlag.isTrue) {
      return const Icon(Icons.save);
    } else {
      return const Icon(Icons.add);
    }
  }

  @override
  Widget build(BuildContext context) {
    ModelCtrl.getAllCat();
    return Scaffold(
        appBar: AppBar(
          title: Obx(() => textInputWidget()),
          actions: [
            Obx(() => IconButton(
                onPressed: () {
                  if (ModelCtrl.controller.buttonFlag.isTrue &&
                      txtController.text.isNotEmpty) {
                    ModelCtrl.addModel(txtController.text);
                    txtController.text = "";
                  } else if (ModelCtrl.controller.buttonFlag.isTrue &&
                      txtController.text.isEmpty) {
                    Get.snackbar("Message", "Input Field is Empty");
                  }
                  ModelCtrl.controller.buttonFlag.value =
                  !ModelCtrl.controller.buttonFlag.value;
                  ModelCtrl.uiUpdate();
                },
                icon: iconWidget()))
          ],
        ),
        body: SizedBox(
          child: itemList(),
        ));
  }

  Widget itemList() {
    return Obx(() {
      if (ModelCtrl.controller.dataList.isNotEmpty) {
        return ListView.builder(
            itemCount: ModelCtrl.controller.dataList.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: IconButton(
                    onPressed: () {
                      ModelCtrl.controller.mgsStatus.value =
                      "Changing data by pressing Update.";
                      txtEditController.text =
                          ModelCtrl.controller.dataList[index].name;
                      Get.defaultDialog(
                        title: "Edit",
                        content: Column(
                          children: [
                            TextFormField(
                              controller: txtEditController,
                              autofocus: true,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Obx(() =>
                                Text("${ModelCtrl.controller.mgsStatus}"))
                          ],
                        ),
                        confirm: OutlinedButton(
                            onPressed: () {
                              ModelCtrl.updateModel(
                                  ModelCtrl.controller.dataList[index].id,
                                  txtEditController.text);
                              ModelCtrl.uiUpdate();
                            },
                            style: btnSm,
                            child: const Text("Update")),
                        cancel: OutlinedButton(
                            onPressed: () {
                              Get.back();
                            },
                            style: btnSm,
                            child: const Text("Cancel")),
                      ); // end getX dialog box
                    },
                    icon: Icon(Icons.edit_note)),
                title: Text(ModelCtrl.controller.dataList[index].name),
                trailing: IconButton(
                    onPressed: () {
                      ModelCtrl.controller.mgsStatus.value =
                      "Confirm To Delete Data!";
                      Get.defaultDialog(
                        title: "Alert!",
                        content: Obx(() =>
                            Text(ModelCtrl.controller.mgsStatus.value)),
                        confirm: OutlinedButton(
                            onPressed: () async {
                              await ModelCtrl.deleteModel(
                                  ModelCtrl.controller.dataList[index].id);
                              ModelCtrl.uiUpdate();
                            },
                            style: btnDanger,
                            child: const Text("Delete")),
                        cancel: OutlinedButton(
                            onPressed: () {
                              Get.back();
                            },
                            style: btnSm,
                            child: const Text("Cancel")),
                      );
                    },
                    icon: Icon(Icons.delete)),
              );
            });
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }

//
}
