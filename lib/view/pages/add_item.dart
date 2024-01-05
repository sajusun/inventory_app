import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventoryapp/presenters/controller/add_item_controller.dart';
import 'package:inventoryapp/presenters/controller/category_controller.dart';

class AddItem extends StatelessWidget {
  const AddItem({super.key});

  @override
  Widget build(BuildContext context) {
    AddItemController.uiUpdate();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Item"),
      ),
      body: Column(
        children: [
          Obx(() =>
          DropdownButton(
              hint: Text(
                  AddItemController.controller.categoryDropdownValue.value
              ),
              isDense: true,
              isExpanded: true,
              items: AddItemController.controller.categoryNameList.map((e) {
                return DropdownMenuItem(
                  value: e,
                  child: Text(e),
                );
              }).toList(),
              onChanged: (dynamic data) {
                AddItemController.controller.categoryDropdownValue.value =
                    data;
              })
          ),
          // select model obs
          Obx(() =>
              DropdownButton(
                  hint: Text(
                      AddItemController.controller.itemModelDropdownValue.value
                  ),
                  isDense: true,
                  isExpanded: true,
                  items: AddItemController.controller.itemModelNameList.map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    );
                  }).toList(),
                  onChanged: (dynamic data) {
                    AddItemController.controller.itemModelDropdownValue.value =
                        data;
                  })
          )
        ],
      ),
    );
  }
}
