import 'package:firebase_auth/firebase_auth.dart';
import 'package:inventoryapp/model/firestore/app_user.dart';
import 'package:inventoryapp/presenters/controller/getx_controller.dart';

class UserProfileCtrl{
  AppUser appUser =AppUser();

  ValController controller = ValController();

     getProfile()     async {
       Map<String, dynamic> data={};
        await appUser.userProfile(FirebaseAuth.instance.currentUser!.uid).then((value)  {
        print("object");
        print(value);
controller.userProfile.value={'auth':value['authorName']};
controller.auth.value=value['authorName'];
print("pp data");
data['auth']=value['authorName'];

      });
      print(controller.userProfile['auth']);
      print(data['auth']);
return "controller.userProfile['auth']";
  }


}