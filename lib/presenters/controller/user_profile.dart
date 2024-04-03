import 'package:firebase_auth/firebase_auth.dart';
import 'package:inventoryapp/model/firestore/app_user.dart';
import 'package:inventoryapp/presenters/controller/getx_controller.dart';

class UserProfileCtrl{
  AppUser appUser =AppUser();

  ValController controller = ValController();
    getProfile()  {
    UserProfile userProfile;
      appUser.userProfile(FirebaseAuth.instance.currentUser!.uid).then((value)  {
userProfile=value;
        return userProfile;
      });


  }
}