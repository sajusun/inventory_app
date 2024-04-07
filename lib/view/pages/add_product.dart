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
        title: const Text("Add Items in System"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Column(
          children: [
            Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Item  :"),
                  SizedBox(
                    height: 40,
                    child: Obx(() =>
                        DropdownButton(
                            style: const TextStyle(color: Colors.white,height: 0),
                            padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
                            alignment: Alignment.center,
                            dropdownColor: Colors.grey,
                            underline: const SizedBox(),
                            hint: Text(
                                AddItemController.controller.itemsNameDropdownHints.value
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
                              AddItemController.controller.itemsNameDropdownHints.value =
                                  data;
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
                  const Text("Category :"),
                  SizedBox(
                    height: 40,
                    child: Obx(() =>
                    DropdownButton(
                        style: const TextStyle(color: Colors.white,height: 0),
                        padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
                        alignment: Alignment.center,
                        dropdownColor: Colors.grey,
                      underline: const SizedBox(),
                        hint: Text(
                            AddItemController.controller.categoryDropdownHints.value
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
                          AddItemController.controller.categoryDropdownHints.value =
                              data;
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
                   const Text("Item Model :"),

               SizedBox(
                 //color: Colors.grey,
                 height: 40,
                 child: Obx(() =>
                     DropdownButton(
                       underline:  const SizedBox(),
                       style: const TextStyle(color: Colors.red,height: .8),
                       hint: Text(
                AddItemController.controller.itemModelDropdownHints.value
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
                         AddItemController.controller.itemModelDropdownHints.value =
                          data;
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
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          style: const TextStyle(height: 1),
          controller: AddItemController.quantity,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
      labelText: 'Quantity',
    ),
        ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(onPressed: (){
              AddItemController.addItem();
            },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyan,
                    foregroundColor: Colors.white,
                    fixedSize: const Size(100, 40),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
                ),child: const Text("Submit"))
          ],
        ),
      )
    );
  }
}
