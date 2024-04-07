import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:inventoryapp/presenters/controller/login_controller.dart';
import 'package:inventoryapp/presenters/controller/signup_controller.dart';
import 'package:inventoryapp/view/pages/login.dart';

@immutable
class Signup extends StatelessWidget {
final SignupCtrl signupCtrl = SignupCtrl();

  Signup({super.key});


  @override
  Widget build(BuildContext context) {
    signupCtrl.controller.userAlert.value="";

    return Scaffold(
      appBar: AppBar(title: const Text("Registration"), centerTitle: true,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(top: Get.height*.02),
              child: Center(
                child: SizedBox(
                    width: Get.height*0.16,
                    height: Get.height*0.14,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('lib/images/applogo.jpeg')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextFormField(controller: signupCtrl.companyName,
                style: const TextStyle(height: 1),
                decoration: const InputDecoration(border: UnderlineInputBorder(),labelText: "Company/Organization"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextFormField(controller: signupCtrl.authorName,
                style: const TextStyle(height: 1),
                decoration: const InputDecoration(border: UnderlineInputBorder(),labelText: "Author Name"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextFormField(controller: signupCtrl.email,
                style: const TextStyle(height: 1),
                decoration: const InputDecoration(border: UnderlineInputBorder(),labelText: "Email"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextFormField(controller: signupCtrl.pass,
                obscureText: true,
                style: const TextStyle(height: 1),
                decoration: const InputDecoration(border: UnderlineInputBorder(),labelText: "Password"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextFormField(controller: signupCtrl.pass2,
                obscureText: true,
                style: const TextStyle(height: 1),
                decoration: const InputDecoration(border: UnderlineInputBorder(),labelText: "Password"),
              ),
            ),
             SizedBox(height: Get.height*0.03,),
            Obx(() {
              return Center(child: Text(signupCtrl.controller.userAlert.value));
            }),
            SizedBox(height: Get.height*0.01,),
            button(),

            SizedBox(height: Get.height*.05),
            Center(
              child: TextButton(onPressed: (){Get.offAll(()=> Login());}, child: const Text("Have an account? Login here")),
            )
          ],

        ),
      ),
    );
  }

  Widget button(){

    return Obx(() {
      if(signupCtrl.controller.loginStatus.value){
      return  const Center(
          child: CircularProgressIndicator(),
        );
      }else{
        return ElevatedButton(onPressed: () {
          signupCtrl.controller.buttonFlag.value=true;
          signupCtrl.add();
        },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.cyan,
            foregroundColor: Colors.white,
            fixedSize: Size(260, 45),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
          ),
            child:  const Text("Signup",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
        );
      }
    });
  }
}
