import 'package:get/get.dart';

class ValController extends GetMaterialController{
  var mgsStatus="Default Message Here!".obs;
  final buttonFlag=false.obs;

  List<dynamic> dataList=[].obs;

  List<dynamic> categoryNameList=[].obs;
  List<dynamic> itemModelNameList=[].obs;
  List<dynamic> itemsNameList=[].obs;


  var categoryDropdownValue="Select Category".obs;
  var itemModelDropdownValue="Select Model".obs;
  var itemsNameDropdownValue="Select Items".obs;

}