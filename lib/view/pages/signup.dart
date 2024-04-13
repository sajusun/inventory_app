import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventoryapp/presenters/controller/signup_controller.dart';
import 'package:inventoryapp/view/pages/login.dart';
import 'package:inventoryapp/view/widgets/button_style.dart';
import 'package:inventoryapp/view/widgets/text_style.dart';

import '../../presenters/controller/getx_controller.dart';

@immutable
class Signup extends StatelessWidget {
final SignupCtrl signupCtrl = SignupCtrl();
final controller = Get.put(ValController());

  Signup({super.key});

  @override
  Widget build(BuildContext context) {
    controller.userAlert.value="";

    return Scaffold(
     appBar: AppBar(
       title:  Text("Create Account",style: textSm,), centerTitle: true,
     ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(top: Get.height*.005),
              child: Center(
                child: SizedBox(
                    width: Get.height*0.16,
                    height: Get.height*0.14,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('lib/images/signup.png')),
              ),
            ),
            SizedBox(
              height: Get.height*0.02,
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
                decoration: const InputDecoration(border: UnderlineInputBorder(),labelText: "Confirm Password"),
              ),
            ),
             SizedBox(height: Get.height*0.03,),
            Obx(() {
              return Center(child: Text(controller.userAlert.value));
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
      if(controller.buttonFlag.value){
      return  const Center(
          child: CircularProgressIndicator(),
        );
      }else{
        return ElevatedButton(onPressed: () {
          controller.buttonFlag.value=true;
          signupCtrl.add();
        },
          style: btnMd,
            child:   Text("Signup",
              style: textSm,
            ),
        );
      }
    });
  }
}
