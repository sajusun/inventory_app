import 'package:get/get.dart';
import 'package:inventoryapp/model/firestore/category_model.dart';

class ValController extends GetMaterialController{
  var mgsStatus="Default Message Here!".obs;
  var updateStatus="Confirm To update!".obs;
  final buttonFlag=false.obs;

  List<dynamic> categoryList=[].obs;

}