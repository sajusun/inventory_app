import 'package:get/get.dart';

class ValController extends GetMaterialController{
  var mgsStatus="Default Message Here!".obs;
  final buttonFlag=false.obs;

  List<dynamic> dataList=[].obs;
  List<dynamic> allProductList=[].obs;

  List<dynamic> categoryNameList=[].obs;
  List<dynamic> itemModelNameList=[].obs;
  List<dynamic> itemsNameList=[].obs;


  var categoryDropdownValue="".obs;
  var itemModelDropdownValue="".obs;
  var itemsNameDropdownValue="".obs;

  var categoryDropdownHints="Select Category".obs;
  var itemModelDropdownHints="Select Model/Color".obs;
  var itemsNameDropdownHints="Select Items".obs;

  var  signupMgs = "".obs;
  var loginStatus = false;
}