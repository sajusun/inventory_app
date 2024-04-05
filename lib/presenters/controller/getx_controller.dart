
import 'package:get/get.dart';

class ValController extends GetMaterialController{
  var uid="".obs;

  var mgsStatus="Default Message Here!".obs;
  final buttonFlag=false.obs;
  var tokenId="".obs;

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

// signIn signup var
  var  signupMgs = "".obs;
  var loginStatus = false;
  var loginAlert="".obs;

 // user profile var
 var authorName="".obs;
  var email="".obs;
  var companyName="".obs;
  var profileImage= "https://w7.pngwing.com/pngs/487/46/png-transparent-logo-black-and-white-brand-letter-d-white-text-rectangle.png".obs;


}