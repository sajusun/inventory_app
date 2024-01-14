import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventoryapp/model/firestore/product_model.dart';
import 'package:inventoryapp/presenters/controller/home_page_controller.dart';
import 'package:inventoryapp/view/pages/add_product.dart';
import 'package:inventoryapp/view/pages/catagory.dart';
import 'package:inventoryapp/view/pages/item_model.dart';
import 'package:inventoryapp/view/pages/items.dart';
import '../../presenters/controller/getx_controller.dart';

class HomePage extends StatefulWidget {
  String title;

  HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    var controller = Get.put(ValController());
  @override
  Widget build(BuildContext context) {
    HomePageCtrl.getAllItems();
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
               Get.to(()=> const ProductModel());
              }, child: const Text("Product Model")),
              const SizedBox(
                height: 20,
              ),
              OutlinedButton(onPressed: () {
                Get.to(()=>const AddProduct());
              }, child: const Text("Add Products")),
              const SizedBox(
                height: 20,
              ),
              OutlinedButton(onPressed: () {
                Get.to(()=> const Items());
              }, child: const Text("Add Items")),
            ],
          ),
        ),
      ),
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(10),
         child: futureView(),
        //   child: ElevatedButton(onPressed: () async {
        //     var data = await ProductsModel().findItems();
        //     if(data["status"]){
        //       print(data["status"]);
        //       print(data["docID"]);
        //       print(data["quantity"]);
        //     }else{
        //       print(data["status"]);
        //     }
        //   }, child: Text("check")),
        ),
      )
    );
  }   //   build context

//   all product list function
Widget allProductList(){
   return Obx(() {
     if (controller.allProductList.isNotEmpty) {
       return ListView.builder(
           itemCount: controller.allProductList.length,
           itemBuilder: (context, index){
         return Padding(
           padding: const EdgeInsets.only(top: 8.0),
           child: Container(
             decoration: BoxDecoration(
               color: Colors.cyan,
               borderRadius: BorderRadius.circular(8),
               border: Border.all()
             ),
             child: Column(
               children: [
                 Text(" ${controller.allProductList[index].itemName}  - " " ${controller.allProductList[index].modelName}"),
                 Text( " Category : ${controller.allProductList[index].category}, " " Available Items : ${controller.allProductList[index].quantity} "),
               ],
             ),
           ),
         );

       });
     } else {
       return  const Center(child: CircularProgressIndicator());
     }
   });

}

Widget futureView(){
  return  FutureBuilder(future:ProductsModel().getAllItems(),
        builder: (context, AsyncSnapshot<List<Products>> data){
      return ListView.builder(
          itemCount: data.data?.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all()
                ),
                child: Column(
                  children: [
                    Text(" ${data.data?[index].itemName}  - " " ${data.data?[index].modelName}"),
                    Text( " Category : ${data.data?[index].category}, " " Available Items : ${data.data?[index].quantity} "),
                  ],
                ),
              ),
            );
      });
        });
}


}
