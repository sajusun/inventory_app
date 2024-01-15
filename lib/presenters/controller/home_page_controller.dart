

import 'package:get/get.dart';
import 'package:inventoryapp/model/firestore/product_model.dart';
import 'package:inventoryapp/presenters/controller/getx_controller.dart';

class HomePageCtrl{
  static var controller = Get.put(ValController());
  static Future<void> getAllItems() async {
   List<Products> data=[];
    data = await ProductsModel().getAllItems();
   controller.allProductList.assignAll(data);
  }

}