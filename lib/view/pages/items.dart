import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventoryapp/presenters/controller/items_controller.dart';


class Items extends StatelessWidget{
  const Items({super.key});
  static TextEditingController txtController = TextEditingController();
  static TextEditingController txtEditController = TextEditingController();

  Widget textInputWidget() {
    if (ItemsCtrl.controller.buttonFlag.isTrue) {
      return TextFormField(
        controller: txtController,
        autofocus: true,
      );
    } else {
      return const Text("Items list");
    }
  }

  Widget iconWidget() {
    if (ItemsCtrl.controller.buttonFlag.isTrue) {
      return const Icon(Icons.save);
    } else {
      return const Icon(Icons.add);
    }
  }

  @override
  Widget build(BuildContext context) {
    ItemsCtrl.getAllItems();
    return Scaffold(
        appBar: AppBar(
          title: Obx(() => textInputWidget()),
          actions: [
            Obx(() => IconButton(
                onPressed: () {
                  if (ItemsCtrl.controller.buttonFlag.isTrue &&
                      txtController.text.isNotEmpty) {
                    ItemsCtrl.addItems(txtController.text);
                    txtController.text = "";
                  } else if (ItemsCtrl.controller.buttonFlag.isTrue &&
                      txtController.text.isEmpty) {
                    Get.snackbar("Message", "Input Field is Empty");
                  }
                  ItemsCtrl.controller.buttonFlag.value =
                  !ItemsCtrl.controller.buttonFlag.value;
                  ItemsCtrl.uiUpdate();
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
      if (ItemsCtrl.controller.dataList.isNotEmpty) {
        return ListView.builder(
            itemCount: ItemsCtrl.controller.dataList.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: IconButton(
                    onPressed: () {
                      ItemsCtrl.controller.mgsStatus.value =
                      "Changing data by pressing Update.";
                      txtEditController.text =
                          ItemsCtrl.controller.dataList[index].name;
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
                                Text("${ItemsCtrl.controller.mgsStatus}"))
                          ],
                        ),
                        confirm: OutlinedButton(
                            onPressed: () {
                              ItemsCtrl.updateItems(
                                  ItemsCtrl.controller.dataList[index].id,
                                  txtEditController.text);
                              ItemsCtrl.uiUpdate();
                            },
                            child: const Text("Update")),
                        cancel: OutlinedButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: const Text("Cancel")),
                      ); // end getX dialog box
                    },
                    icon: Icon(Icons.edit_note)),
                title: Text(ItemsCtrl.controller.dataList[index].name),
                trailing: IconButton(
                    onPressed: () {
                      ItemsCtrl.controller.mgsStatus.value =
                      "Confirm To Delete Data!";
                      Get.defaultDialog(
                        title: "Alert!",
                        content: Obx(() =>
                            Text(ItemsCtrl.controller.mgsStatus.value)),
                        confirm: OutlinedButton(
                            onPressed: () async {
                              await ItemsCtrl.deleteItems(
                                  ItemsCtrl.controller.dataList[index].id);
                              ItemsCtrl.uiUpdate();
                            },
                            child: const Text("Delete")),
                        cancel: OutlinedButton(
                            onPressed: () {
                              Get.back();
                            },
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
