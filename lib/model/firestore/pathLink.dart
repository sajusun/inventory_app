import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../presenters/controller/getx_controller.dart';

class PathLink{
  static var controller = Get.put(ValController());
  static String userData="userData/";
  static String userProfile="userProfile/";


}