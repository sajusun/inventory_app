

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventoryapp/presenters/controller/login_controller.dart';
import 'package:inventoryapp/view/pages/signup.dart';
@immutable
class Login extends StatelessWidget {
  Login({super.key});

LoginCtrl loginCtrl = LoginCtrl();
   //double appHeight = Get.height;
  @override
  Widget build(BuildContext context) {

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
          SizedBox(height: Get.height*.1,),
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
        const SizedBox(height: 40,),
        ElevatedButton(onPressed: () {
          loginCtrl.validateData();
        }, child: const Text("Login")
        ),
            SizedBox(height: Get.height*.1),
            Center(
              child: TextButton(onPressed: (){Get.to(()=> Signup());}, child: const Text("New User? Create Account")),
            )
          ],
        ),
      ),
    );
  }
}
