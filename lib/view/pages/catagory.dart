import 'package:flutter/material.dart';
import 'package:inventoryapp/model/firestore/category_model.dart';
import 'package:get/get.dart';
import 'package:inventoryapp/presenters/controller/category_controller.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  TextEditingController txtController = TextEditingController();
  TextEditingController txtEditController = TextEditingController();

  final addTitle = false.obs;
  Widget textWidget() {
    if (addTitle.isTrue) {
      return TextFormField(
        controller: txtController,
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
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Obx(()=>textWidget()),
          actions: [
            Obx(() => IconButton(
                onPressed: () {
                  if(addTitle.isTrue && txtController.text.isNotEmpty){
                    CategoryCtrl.addCategory(txtController.text);
                  }else{
                    print("empty data");
                  }
                  addTitle.value = !addTitle.value;

                  setState(() {});
                },
                icon: iconWidget()))
          ],
        ),
        body: SizedBox(
          child: FutureBuilder(future: CategoryModel().getAll(), builder: (ctx,snap){
            if (snap.data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            };
            return ListView.builder(
              itemCount: snap.data!.length,
                itemBuilder: (context,  index){
              return  ListTile(
                leading: IconButton(onPressed: (){
                  Get.defaultDialog(
                    title: "Edit",
                    content: TextFormField(
                      controller: txtEditController,
                    ),
                    confirm:  OutlinedButton(onPressed: (){
                      CategoryModel().update(snap.data![index].id, txtEditController.text);
                    }, child: Text("Update"))

                  );
                  setState(() {});
                }, icon: Icon(Icons.edit_note)),
                title: Text(snap.data![index].name),
                trailing: IconButton(onPressed: (){
                  var confirmation="Confirm To Delete Data!".obs;
                  Get.defaultDialog(
                    title: "Alert!",
                    content: Obx(()=>Text("${confirmation}")),
                    confirm: ElevatedButton(onPressed: () async {
                      confirmation.value = await CategoryCtrl.deleteCategory(snap.data![index].id);
                      Get.appUpdate();
                    }, child: Text("Delete"))
                  );
                }, icon: Icon(Icons.delete)),
              );
            });
        }),
        ));
  }
}
