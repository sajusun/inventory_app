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
 // List<CatModel>? data=CategoryModel().getAllCategory() as List<CatModel>?;
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
                  if(addTitle && txtController.text.isNotEmpty){
                    print("save me");
                    CategoryModel().addCategory({"name":txtController.text});
                  }else{
                    print("empty data");
                  }
                  addTitle = !addTitle;

                  setState(() {});
                },
                icon: iconWidget())
          ],
        ),
        body: SizedBox(
          child: FutureBuilder(future: CategoryModel().getAllCategory(), builder: (ctx,snap){
            return Container(
              child: ListView.builder(
                itemCount: snap.data!.length,
                  itemBuilder: (context,  index){
                return  ListTile(title: Text(snap.data![index].name),
                  trailing: IconButton(onPressed: (){
                    CategoryModel().delete(snap.data![index].id);
                    setState(() {

                    });
                  }, icon: Icon(Icons.delete)),);
              }),
            );
        }),
        ));
  }
}
