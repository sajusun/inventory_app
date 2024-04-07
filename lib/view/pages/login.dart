

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventoryapp/presenters/controller/login_controller.dart';
import 'package:inventoryapp/view/pages/signup.dart';
@immutable
class Login extends StatelessWidget {
  Login({super.key});

final LoginCtrl loginCtrl = LoginCtrl();
   //double appHeight = Get.height;
  @override
  Widget build(BuildContext context) {
loginCtrl.controller.userAlert.value="";
    return Scaffold(
      appBar: AppBar(title: const Text("userLogin"), centerTitle: true,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(top: Get.height*.05),
              child: Center(
                child: SizedBox(
                    width: 160,
                    height: 100,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('lib/images/applogo.jpeg')),
              ),
            ),

          SizedBox(height: Get.height*.08,),
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
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan,
                foregroundColor: Colors.white,
                fixedSize: const Size(200, 40),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
            ),
            child: const Text("Login",style: TextStyle(
              fontWeight: FontWeight.bold,fontSize: 18
            ),)
    );
    }
    });
  }
}
