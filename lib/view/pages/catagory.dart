import 'package:flutter/material.dart';
import 'package:inventoryapp/model/firestore/category_model.dart';
import 'package:get/get.dart';
import 'package:inventoryapp/presenters/controller/category_controller.dart';
import 'package:inventoryapp/presenters/controller/getX_controller.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  TextEditingController txtController = TextEditingController();
  TextEditingController txtEditController = TextEditingController();
  var abc = CategoryCtrl.getAllCategory().obs;

  final addTitle = false.obs;
  Widget textWidget() {
    if (addTitle.isTrue) {
      return TextFormField(
        controller: txtController,
        autofocus: true,
      );
    } else {
      return const Text("Category list");
    }
  }
  Widget iconWidget() {
    if (addTitle.isTrue) {
      return Icon(Icons.save);
    } else {
      return Icon(Icons.add);
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CategoryCtrl.getAllCat();
  }

  @override
  Widget build(BuildContext context) {
    CategoryCtrl.getAllCat();
    return Scaffold(
        appBar: AppBar(
          title: Obx(()=>textWidget()),
          actions: [
            Obx(() => IconButton(
                onPressed: () {
                  if(addTitle.isTrue && txtController.text.isNotEmpty){
                    CategoryCtrl.addCategory(txtController.text);
                    txtController.text="";
                  }else{
                    print("empty data");
                  }
                  addTitle.value = !addTitle.value;
                  CategoryCtrl.uiUpdate();
                },
                icon: iconWidget()))
          ],
        ),
        body: SizedBox(
          child: itemList(),
        )
    );
  }

  Widget  itemList(){
   return Obx(() {
     if(CategoryCtrl.controller.catData.isNotEmpty){
       return  ListView.builder(
           itemCount: CategoryCtrl.controller.catData.length,
           itemBuilder: (context,  index){
             return  ListTile(
               leading: IconButton(onPressed: (){
                 CategoryCtrl.controller.mgsStatus.value="Changing data by pressing Update.";
                 txtEditController.text=CategoryCtrl.controller.catData[index].name;
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
                       Obx(() => Text("${CategoryCtrl.controller.mgsStatus}"))
                     ],
                   ),
                   confirm:  OutlinedButton(onPressed: (){
                     CategoryCtrl.updateCategory(CategoryCtrl.controller.catData[index].id, txtEditController.text);
                     CategoryCtrl.uiUpdate();
                   }, child: const Text("Update")),
                 );  // end getX dialog box

               }, icon: Icon(Icons.edit_note)),
               title: Text(CategoryCtrl.controller.catData[index].name),
               trailing: IconButton(onPressed: (){
                 CategoryCtrl.controller.mgsStatus.value="Confirm To Delete Data!";
                 Get.defaultDialog(
                     title: "Alert!",
                     content: Obx(()=>Text(CategoryCtrl.controller.mgsStatus.value)),
                     confirm: ElevatedButton(onPressed: () async {
                       await CategoryCtrl.deleteCategory(CategoryCtrl.controller.catData[index].id);
                       CategoryCtrl.uiUpdate();
                     }, child: Text("Delete"))
                 );
               }, icon: Icon(Icons.delete)),
             );
           });
     }else{
     return  Center(
       child: CircularProgressIndicator(),
     );
     }
   });

  }

  //
}
