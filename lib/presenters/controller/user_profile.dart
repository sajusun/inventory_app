import 'package:firebase_auth/firebase_auth.dart';
import 'package:inventoryapp/model/firestore/app_user.dart';

class UserProfileCtrl{
  AppUser appUser =AppUser();

  getProfile(){
    appUser.userProfile(FirebaseAuth.instance.currentUser!.uid);
  }
}