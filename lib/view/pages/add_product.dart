import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventoryapp/presenters/controller/add_item_controller.dart';
import 'package:inventoryapp/view/widgets/button_style.dart';
import 'package:inventoryapp/view/widgets/text_style.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    AddItemController.uiUpdate();
    return Scaffold(
        appBar: AppBar(
          title:  Text("Add Products",style: textSm,),centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Text("Item  :",style: textSm,),
                      SizedBox(
                        height: 40,
                        child: Obx(() => DropdownButton(
                            style: textSm,
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 10),
                            alignment: Alignment.center,
                            dropdownColor: Colors.cyan,
                            underline: const SizedBox(),
                            hint: Text(AddItemController
                                .controller.itemsNameDropdownHints.value),
                            isDense: true,
                            isExpanded: false,
                            items: AddItemController.controller.itemsNameList
                                .map((e) {
                              return DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              );
                            }).toList(),
                            onChanged: (dynamic data) {
                              AddItemController
                                  .controller.itemsNameDropdownHints.value = data;
                              AddItemController
                                  .controller.itemsNameDropdownValue.value = data;
                            })),
                      ),
                    ],
                  ),
                ),
                 SizedBox(
                  height: Get.height*0.02,
                ),
                //
                Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Text("Category :",style: textSm,),
                      SizedBox(
                        height: 40,
                        child: Obx(() => DropdownButton(
                            style: textSm,
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 10),
                            alignment: Alignment.center,
                            dropdownColor: Colors.cyan,
                            underline: const SizedBox(),
                            hint: Text(AddItemController
                                .controller.categoryDropdownHints.value),
                            isDense: true,
                            isExpanded: false,
                            items: AddItemController.controller.categoryNameList
                                .map((e) {
                              return DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              );
                            }).toList(),
                            onChanged: (dynamic data) {
                              AddItemController
                                  .controller.categoryDropdownHints.value = data;
                              AddItemController
                                  .controller.categoryDropdownValue.value = data;
                            })),
                      ),
                    ],
                  ),
                ),
                 SizedBox(
                  height: Get.height*0.02,
                ),
                //
                Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Text("Item Model :",style: textSm,),
                      SizedBox(
                        //color: Colors.grey,
                        height: 40,
                        child: Obx(() => DropdownButton(
                              underline: const SizedBox(),
                              style:
                                  textSm,
                              hint: Text(AddItemController
                                  .controller.itemModelDropdownHints.value),
                              isDense: true,
                              isExpanded: false,
                              items: AddItemController
                                  .controller.itemModelNameList
                                  .map((items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Center(
                                    child: Text(
                                      items,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (dynamic data) {
                                AddItemController.controller
                                    .itemModelDropdownHints.value = data;
                                AddItemController.controller
                                    .itemModelDropdownValue.value = data;
                              },
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 10),
                              alignment: Alignment.center,
                              dropdownColor: Colors.cyan,
                            )),
                      )
                    ],
                  ),
                ),
                 SizedBox(
                  height: Get.height*0.02,
                ),
                TextFormField(
                  style: textSm,
                  controller: AddItemController.quantity,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Quantity',
                  ),
                ),
                 SizedBox(
                  height: Get.height*0.1,
                ),
                ElevatedButton(
                    onPressed: () {
                      AddItemController.addItem();
                    },
                    style: btnMd,
                    child: Text(
                      "Submit",
                      style: textSm,
                    )
                )
              ],
            ),
          ),
        ));
  }
}
