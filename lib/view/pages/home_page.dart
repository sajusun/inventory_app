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
               SizedBox(
                height: 100,
                child: Column(
                  children: [
                   Image.network("https://w7.pngwing.com/pngs/487/46/png-transparent-logo-black-and-white-brand-letter-d-white-text-rectangle.png",height: 60,),
                    Text("Company Title",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
                  ],
                ),
              ),
Container(
  padding: EdgeInsets.only(left: 30),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TextButton.icon(onPressed: () {
        Get.to(()=>const Category());
      }, icon: Icon(Icons.arrow_right),
      label: const Text("Product Category")),

      TextButton.icon(onPressed: () {
        Get.to(()=> const ProductModel());
      }, icon: Icon(Icons.arrow_right),
      label: const Text("Product Model")),

      TextButton.icon(onPressed: () {
        Get.to(()=> const Items());
      }, icon: Icon(Icons.arrow_right),
      label: const Text("Add Items")),
      TextButton.icon(onPressed: () {
        Get.to(()=>const AddProduct());
      }, icon: Icon(Icons.arrow_right),
          label: const Text("Add Products")),
    ],
  ),
)
            ],
          ),
        ),
      ),
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(10),
         child: allProductList(),
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
