import 'package:flutter/material.dart';
import 'package:inventoryapp/model/firestore/category_model.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  TextEditingController txtController = TextEditingController();
  bool addTitle = false;
  Widget textWidget() {
    if (addTitle) {
      return TextFormField(
        controller: txtController,
      );
    } else {
      return const Text("Category list");
    }
  }

  Widget iconWidget() {
    if (addTitle) {
      return Icon(Icons.save);
    } else {
      return Icon(Icons.add);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: textWidget(),
          actions: [
            IconButton(
                onPressed: () {
                  if(addTitle){
                    print("save me");
                    CategoryModel().addCategory({"name":txtController.text});
                  }
                  addTitle = !addTitle;

                  setState(() {});
                },
                icon: iconWidget())
          ],
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                child: Text("All category"),
              ),
              OutlinedButton(onPressed: (){CategoryModel().getAllCategory();}, child: Text("get data"))
            ],
          ),
        ));
  }
}
