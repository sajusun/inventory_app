import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventoryapp/presenters/controller/category_controller.dart';
import 'package:inventoryapp/view/widgets/button_style.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  TextEditingController txtController = TextEditingController();
  TextEditingController txtEditController = TextEditingController();

  Widget textInputWidget() {
    if (CategoryCtrl.controller.buttonFlag.isTrue) {
      return TextFormField(
        controller: txtController,
        autofocus: true,
      );
    } else {
      return const Text("Category list");
    }
  }

  Widget iconWidget() {
    if (CategoryCtrl.controller.buttonFlag.isTrue) {
      return const Icon(Icons.save);
    } else {
      return const Icon(Icons.add);
    }
  }

  @override
  Widget build(BuildContext context) {
    CategoryCtrl.getAllCat();
    return Scaffold(
        appBar: AppBar(
          title: Obx(() => textInputWidget()),
          actions: [
            Obx(() => IconButton(
                onPressed: () {
                  if (CategoryCtrl.controller.buttonFlag.isTrue &&
                      txtController.text.isNotEmpty) {
                    CategoryCtrl.addCategory(txtController.text);
                    txtController.text = "";
                  } else if (CategoryCtrl.controller.buttonFlag.isTrue &&
                      txtController.text.isEmpty) {
                    Get.snackbar("Message", "Input Field is Empty");
                  }
                  CategoryCtrl.controller.buttonFlag.value =
                      !CategoryCtrl.controller.buttonFlag.value;
                  CategoryCtrl.uiUpdate();
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
      if (CategoryCtrl.controller.dataList.isNotEmpty) {
        return ListView.builder(
            itemCount: CategoryCtrl.controller.dataList.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: IconButton(
                    onPressed: () {
                      CategoryCtrl.controller.mgsStatus.value =
                          "Changing data by pressing Update.";
                      txtEditController.text =
                          CategoryCtrl.controller.dataList[index].name;
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
                                Text("${CategoryCtrl.controller.mgsStatus}"))
                          ],
                        ),
                        confirm: OutlinedButton(
                            onPressed: () {
                              CategoryCtrl.updateCategory(
                                  CategoryCtrl.controller.dataList[index].id,
                                  txtEditController.text);
                              CategoryCtrl.uiUpdate();
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
                title: Text(CategoryCtrl.controller.dataList[index].name),
                trailing: IconButton(
                    onPressed: () {
                      CategoryCtrl.controller.mgsStatus.value =
                          "Confirm To Delete Data!";
                      Get.defaultDialog(
                        title: "Alert!",
                        content: Obx(() =>
                            Text(CategoryCtrl.controller.mgsStatus.value)),
                        confirm: OutlinedButton(
                            onPressed: () async {
                              await CategoryCtrl.deleteCategory(
                                  CategoryCtrl.controller.dataList[index].id);
                              CategoryCtrl.uiUpdate();
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
