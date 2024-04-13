

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventoryapp/presenters/controller/login_controller.dart';
import 'package:inventoryapp/view/pages/signup.dart';
import 'package:inventoryapp/view/widgets/button_style.dart';
import 'package:inventoryapp/view/widgets/text_style.dart';
@immutable
class Login extends StatelessWidget {
  Login({super.key});

final LoginCtrl loginCtrl = LoginCtrl();
   //double appHeight = Get.height;
  @override
  Widget build(BuildContext context) {
loginCtrl.controller.userAlert.value="";
    return Scaffold(
     // appBar: AppBar(title:  Text("Login",style: textMd,), centerTitle: true,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(top: Get.height*.1),
              child: Center(
                child: SizedBox(
                    width: 160,
                    height: 100,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('lib/images/USER.png')),
              ),
            ),
          Text("Sign In",style: textXlRed,),

          SizedBox(height: Get.height*.06,),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(controller: loginCtrl.email,
              style: const TextStyle(height: 1),
              decoration: const InputDecoration(border: UnderlineInputBorder(),labelText: "Email"),
            ),
          ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextFormField(controller: loginCtrl.pass,
            obscureText: true,
            style: const TextStyle(height: 1),
            decoration: const InputDecoration(border: UnderlineInputBorder(),labelText: "Password"),
          ),
        ),
         SizedBox(height: Get.height*.05,),
            Obx(() {
              return Center(child: Text(loginCtrl.controller.userAlert.value));
            }),
            SizedBox(height: Get.height*.05,),
            button(),
            SizedBox(height: Get.height*.1),
            Center(
              child: TextButton(onPressed: (){Get.to(()=> Signup());loginCtrl.controller.userAlert.value="";}, child: const Text("New User? Create Account")),
            )
          ],
        ),
      ),
    );
  }

  Widget button(){
    return Obx(()  {
      if(loginCtrl.controller.buttonFlag.value){
        return const Center(child: CircularProgressIndicator());
      }else{
        return  ElevatedButton(onPressed: () {
          loginCtrl.controller.buttonFlag.value=true;
    loginCtrl.validateData();
    },
            style: btnMd,
            child:  Text("Login",
              style: textSm,
            )

    );
    }
    });
  }
}
