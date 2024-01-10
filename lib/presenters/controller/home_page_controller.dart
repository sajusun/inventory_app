

import 'package:get/get.dart';
import 'package:inventoryapp/model/firestore/product_model.dart';
import 'package:inventoryapp/presenters/controller/getx_controller.dart';

class HomePageCtrl{
  var controller = Get.put(ValController());
  static Future<void> getAllItems() async {
   await ProductsModel().getAllItems().then((value) {
     for(var items in value){
       print("""
       ${items.id}
       ${items.itemName}
       ${items.modelName}
       ${items.category}
       ${items.quantity}
       
       
       """);
     }
   });
  }

}