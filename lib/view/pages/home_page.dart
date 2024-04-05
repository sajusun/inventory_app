import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventoryapp/model/firestore/product_model.dart';
import 'package:inventoryapp/presenters/controller/home_page_controller.dart';
import 'package:inventoryapp/presenters/controller/login_controller.dart';
import 'package:inventoryapp/presenters/controller/user_profile.dart';
import 'package:inventoryapp/view/pages/add_product.dart';
import 'package:inventoryapp/view/pages/catagory.dart';
import 'package:inventoryapp/view/pages/item_model.dart';
import 'package:inventoryapp/view/pages/items.dart';
import 'package:inventoryapp/view/widgets/text_style.dart';
import '../../presenters/controller/getx_controller.dart';
import 'app_settings.dart';


@immutable
class HomePage extends StatelessWidget{
  final  controller = Get.put(ValController());
  final UserProfileCtrl upc=UserProfileCtrl();

   HomePage() {
    upc.getProfile();
  }
  @override
  Widget build(BuildContext context) {

    HomePageCtrl.getAllItems();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          centerTitle: true,
        ),
        drawer: Drawer(
          clipBehavior: Clip.hardEdge,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.grey
                  ),
                    accountName: Obx(() {
                      return
                      Text(
                        upc.controller.authorName.value,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white
                        ),
                      );
                    }),
                    accountEmail: Obx(() {
                      return
                        Text(
                          upc.controller.email.value,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white
                          ),
                        );
                    }),
                  currentAccountPicture:
                        Image.network(
                          upc.controller.profileImage.value,
                          height: 60,
                        ),onDetailsPressed: (){},
                ),
             // DrawerHeader(
             //   decoration: BoxDecoration(
             //     color: Colors.grey
             //   ),
             //   child: SizedBox(
             //   height: 100,
             //   child: Column(
             //     children: [
             //       Image.network(
             //         "https://w7.pngwing.com/pngs/487/46/png-transparent-logo-black-and-white-brand-letter-d-white-text-rectangle.png",
             //         height: 60,
             //       ),
             //        Text(
             //            upc.controller.up.companyName,
             //            style: const TextStyle(
             //                fontWeight: FontWeight.bold, fontSize: 20),
             //          ),
             //
             //     ],
             //   ),
             // ),
             // ),
                Container(
                  height: Get.height * .4,
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      ListTile(
                        leading: const Icon(Icons.category),
                        title: const Text("Product Category"),
                        onTap: (){Get.to(() => const Category());},
                      ),
                      ListTile(
                        leading: const Icon(Icons.model_training),
                        title: const Text("Product Model"),
                        onTap: (){Get.to(() => const ProductModel());},
                      ),
                      ListTile(
                        leading: const Icon(Icons.edit_note),
                        title: const Text("Add Items"),
                        onTap: (){Get.to(() => const Items());},
                      ),
                      ListTile(
                        leading: const Icon(Icons.production_quantity_limits_outlined),
                        title: const Text("Add Products"),
                        onTap: (){Get.to(() => const AddProduct());},
                      ),

                    ],
                  ),
                ),

                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                     crossAxisAlignment: CrossAxisAlignment.end,
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

                      ],
                    ),
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
