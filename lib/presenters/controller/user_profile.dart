import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:inventoryapp/model/firestore/app_user.dart';
import 'package:inventoryapp/presenters/controller/getx_controller.dart';

class UserProfileCtrl {
  AppUser appUser = AppUser();
  ValController controller = ValController();

  getProfile() async {
    //if(controller.up.authorName.isEmpty) {
      await appUser
          .userProfile(FirebaseAuth.instance.currentUser!.uid)
          .then((value) {
        controller.companyName.value = value['companyName'];
        controller.email.value = value['email'];
        controller.authorName.value=value['authorName'];
      });
   // }
  }
}
