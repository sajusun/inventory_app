import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventoryapp/presenters/controller/add_item_controller.dart';

class AddProduct extends StatelessWidget {
   const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    AddItemController.uiUpdate();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Item"),
      ),
      body: Column(
        children: [
          Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Item  :"),
                Container(
                  height: 40,
                  child: Obx(() =>
                      DropdownButton(
                          style: TextStyle(color: Colors.white,height: 0),
                          padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
                          alignment: Alignment.center,
                          dropdownColor: Colors.grey,
                          underline: SizedBox(),
                          hint: Text(
                              AddItemController.controller.itemsNameDropdownValue.value
                          ),
                          isDense: true,
                          isExpanded: false,
                          items: AddItemController.controller.itemsNameList.map((e) {
                            return DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            );
                          }).toList(),
                          onChanged: (dynamic data) {
                            AddItemController.controller.itemsNameDropdownValue.value =
                                data;
                          })
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          //
          Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Category :"),
                Container(
                  height: 40,
                  child: Obx(() =>
                  DropdownButton(
                      style: TextStyle(color: Colors.white,height: 0),
                      padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
                      alignment: Alignment.center,
                      dropdownColor: Colors.grey,
                    underline: SizedBox(),
                      hint: Text(
                          AddItemController.controller.categoryDropdownValue.value
                      ),
                      isDense: true,
                      isExpanded: false,
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
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          //
           Card(
             child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text("Item Model :"),

             Container(
               //color: Colors.grey,
               height: 40,
               child: Obx(() =>
                   DropdownButton(
                     underline: const SizedBox(),
                     style: TextStyle(color: Colors.red,height: 0),
                     hint: Text(
              AddItemController.controller.itemModelDropdownValue.value
                     ),
                    isDense: true,
                     isExpanded: false,
                     items: AddItemController.controller.itemModelNameList.map((items) {
                       return DropdownMenuItem(
              value: items,
              child: Center(
                child: Text(items,
                  style: const TextStyle(color: Colors.white,),),
              ),
                       );
                     }).toList(),
                     onChanged: (dynamic data) {
                       AddItemController.controller.itemModelDropdownValue.value =
                data;
                     },
                     padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
                     alignment: Alignment.center,
                     dropdownColor: Colors.grey,
                   )
               ),
             )
               ],
             ),
           ),
TextFormField(
  controller: AddItemController.itemNumber,
),
          ElevatedButton(onPressed: (){
            AddItemController.addItem();
          }, child: const Text("Submit"))
        ],
      )
    );
  }
}
