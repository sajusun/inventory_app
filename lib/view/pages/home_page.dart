import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventoryapp/model/firestore/product_model.dart';
import 'package:inventoryapp/presenters/controller/home_page_controller.dart';
import 'package:inventoryapp/presenters/controller/login_controller.dart';
import 'package:inventoryapp/view/pages/add_product.dart';
import 'package:inventoryapp/view/pages/catagory.dart';
import 'package:inventoryapp/view/pages/item_model.dart';
import 'package:inventoryapp/view/pages/items.dart';
import 'package:inventoryapp/view/widgets/text_style.dart';
import '../../presenters/controller/getx_controller.dart';
import 'app_settings.dart';

@immutable
class HomePage extends StatefulWidget {
  final String title;

  const HomePage({super.key, required this.title});

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
             DrawerHeader(child:
             SizedBox(
               height: 60,
               child: Column(
                 children: [
                   Image.network(
                     "https://w7.pngwing.com/pngs/487/46/png-transparent-logo-black-and-white-brand-letter-d-white-text-rectangle.png",
                     height: 60,
                   ),
                   const Text(
                     "Company Title",
                     style: TextStyle(
                         fontWeight: FontWeight.bold, fontSize: 20),
                   )
                 ],
               ),
             ),
             ),
                Container(
                  height: Get.height * .4,
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      ListTile(
                        leading: Icon(Icons.category),
                        title: Text("Product Category"),
                        onTap: (){Get.to(() => const Category());},
                      ),
                      ListTile(
                        leading: Icon(Icons.model_training),
                        title: Text("Product Model"),
                        onTap: (){Get.to(() => const ProductModel());},
                      ),
                      ListTile(
                        leading: Icon(Icons.edit_note),
                        title: Text("Add Items"),
                        onTap: (){Get.to(() => const Items());},
                      ),
                      ListTile(
                        leading: Icon(Icons.production_quantity_limits_outlined),
                        title: Text("Add Products"),
                        onTap: (){Get.to(() => const AddProduct());},
                      ),
                      // TextButton.icon(
                      //     onPressed: () {
                      //       Get.to(() => const Category());
                      //       //print("object");
                      //       //   print(HomePageCtrl.controller.tokenId.value);
                      //     },
                      //     icon: const Icon(Icons.arrow_right),
                      //     label: Text(
                      //       "Product Category",
                      //       style: textStyle0,
                      //     )),
                      // TextButton.icon(
                      //     onPressed: () {
                      //       Get.to(() => const ProductModel());
                      //     },
                      //     icon: const Icon(Icons.arrow_right),
                      //     label: Text(
                      //       "Product Model",
                      //       style: textStyle0,
                      //     )),
                      // TextButton.icon(
                      //     onPressed: () {
                      //       Get.to(() => const Items());
                      //     },
                      //     icon: const Icon(Icons.arrow_right),
                      //     label: Text(
                      //       "Add Items",
                      //       style: textStyle0,
                      //     )),
                      // TextButton.icon(
                      //     onPressed: () {
                      //       Get.to(() => const AddProduct());
                      //     },
                      //     icon: const Icon(Icons.arrow_right),
                      //     label: Text(
                      //       "Add Products",
                      //       style: textStyle0,
                      //     )),
                    ],
                  ),
                ),

                Container(
                  child: Column(
                   // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ListTile(
                        leading: Icon(Icons.home_filled),
                        title: Text("Home",style: textStyle0,),
                        onTap: (){Get.back();},
                      ),
                      ListTile(
                        leading: Icon(Icons.settings),
                        title: Text("Settings",style: textStyle0,),
                        onTap: (){Get.to(() => const AppSettings());},
                      ),
                      ListTile(
                        leading: Icon(Icons.logout),
                        title: Text("Logout",style: textStyle0,),
                        onTap: (){LoginCtrl().logOut();},
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: [
                      //     const Text("Logout",style: TextStyle(color: Colors.deepOrangeAccent,fontWeight: FontWeight.bold,fontSize: 18),),
                      //     IconButton(
                      //       alignment: Alignment.bottomRight,
                      //       onPressed: () {
                      //         LoginCtrl().logOut();
                      //       },
                      //       icon: const Icon(
                      //         Icons.logout,color: Colors.deepOrangeAccent,
                      //       ),
                      //       tooltip: "Logout",
                      //     ),
                      //
                      //   ],
                      // )
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),

        body: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: allProductList(),
          ),
        ));
  } //   build context

//   all product list function
  Widget allProductList() {
    return Obx(() {
      if (controller.allProductList.isNotEmpty) {
        return ListView.builder(
            itemCount: controller.allProductList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all()),
                  child: Column(
                    children: [
                      Text(" ${controller.allProductList[index].itemName}  - "
                          " ${controller.allProductList[index].modelName}"),
                      Text(
                          " Category : ${controller.allProductList[index].category}, "
                          " Available Items : ${controller.allProductList[index].quantity} "),
                    ],
                  ),
                ),
              );
            });
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }

  Widget futureView() {
    return FutureBuilder(
        future: ProductsModel().getAllItems(),
        builder: (context, AsyncSnapshot<List<Products>> data) {
          return ListView.builder(
              itemCount: data.data?.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all()),
                    child: Column(
                      children: [
                        Text(" ${data.data?[index].itemName}  - "
                            " ${data.data?[index].modelName}"),
                        Text(" Category : ${data.data?[index].category}, "
                            " Available Items : ${data.data?[index].quantity} "),
                      ],
                    ),
                  ),
                );
              });
        });
  }
}
