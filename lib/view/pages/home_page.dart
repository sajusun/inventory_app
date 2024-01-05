import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventoryapp/presenters/app_drawer/drawer_controller.dart';
import 'package:inventoryapp/view/pages/add_item.dart';
import 'package:inventoryapp/view/pages/catagory.dart';
import 'package:inventoryapp/view/pages/product_model.dart';

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
              const SizedBox(
                height: 100,
                child: Center(child: Text("Drawer Header"),),
              ),
              OutlinedButton(onPressed: () {
               Get.to(()=>const Category());
                }, child: const Text("Product Category")),
              const SizedBox(
                height: 20,
              ),
              OutlinedButton(onPressed: () {
               Get.to(()=> ProductModel());
              }, child: const Text("Product Model")),
              const SizedBox(
                height: 20,
              ),
              OutlinedButton(onPressed: () {
                Get.to(()=>AddItem());
              }, child: const Text("Add Product"))
            ],
          ),
        ),
      ),
      body: const Center(
          child: Column(
        children: [Text(
"""
This is Home Page""")
        ],
      )),
    );
  }
}
