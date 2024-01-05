import 'package:get/get.dart';

class ValController extends GetMaterialController{
  var mgsStatus="Default Message Here!".obs;
  final buttonFlag=false.obs;

  List<dynamic> categoryList=[].obs;
  List<dynamic> categoryNameList=[].obs;
  List<dynamic> itemModelNameList=[].obs;


  var categoryDropdownValue="Select Category".obs;
  var itemModelDropdownValue="Select Model".obs;

}