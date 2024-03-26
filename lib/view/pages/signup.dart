import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:inventoryapp/presenters/controller/signup_controller.dart';
import 'package:inventoryapp/view/pages/login.dart';

@immutable
class Signup extends StatelessWidget {
SignupCtrl signupCtrl = SignupCtrl();

  Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Registration"), centerTitle: true,),
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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(controller: signupCtrl.companyName,
                style: const TextStyle(height: 1),
                decoration: const InputDecoration(border: UnderlineInputBorder(),labelText: "Company/Organization"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(controller: signupCtrl.authorName,
                style: const TextStyle(height: 1),
                decoration: const InputDecoration(border: UnderlineInputBorder(),labelText: "Author Name"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(controller: signupCtrl.email,
                style: const TextStyle(height: 1),
                decoration: const InputDecoration(border: UnderlineInputBorder(),labelText: "Email"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(controller: signupCtrl.pass,
                obscureText: true,
                style: const TextStyle(height: 1),
                decoration: const InputDecoration(border: UnderlineInputBorder(),labelText: "Password"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(controller: signupCtrl.pass2,
                obscureText: true,
                style: const TextStyle(height: 1),
                decoration: const InputDecoration(border: UnderlineInputBorder(),labelText: "Password"),
              ),
            ),
            const SizedBox(height: 20,),
            button(),
            // ElevatedButton(onPressed: () {
            //   signupCtrl.add();
            // }, child: const Text("Signup")
            // ),
            SizedBox(height: Get.height*.1),
            Center(
              child: TextButton(onPressed: (){Get.off(()=> Login());}, child: const Text("Have an account? Login here")),
            )
          ],

        ),
      ),
    );
  }

  Widget button(){

    return Obx(() {
      if(SignupCtrl.controller.buttonFlag.value){
      return  Center(
          child: CircularProgressIndicator(),
        );
      }else{
        return ElevatedButton(onPressed: () {
          SignupCtrl.controller.buttonFlag.value=true;
          signupCtrl.add();
        }, child: const Text("Signup")
        );
      }
    });
  }
}
