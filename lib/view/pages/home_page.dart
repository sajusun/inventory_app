import 'package:flutter/material.dart';
import 'package:inventoryapp/presenters/app_drawer/drawer_controller.dart';
import 'package:inventoryapp/view/pages/catagory.dart';

class HomePage extends StatefulWidget {
  String title;

  HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      drawer: Drawer(
        clipBehavior: Clip.hardEdge,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              Container(
                height: 100,
                child: Center(child: Text("Drawer Header"),),
              ),
              OutlinedButton(onPressed: () {
                AppDrawerController.gotoPage(context, Category);
                }, child: Text("Product Catagory")),
              SizedBox(
                height: 20,
              ),
              OutlinedButton(onPressed: () {}, child: Text("Product Model")),
              SizedBox(
                height: 20,
              ),
              OutlinedButton(onPressed: () {}, child: Text("Add Product"))
            ],
          ),
        ),
      ),
      body: Center(
          child: Column(
        children: [

        ],
      )),
    );
  }
}
