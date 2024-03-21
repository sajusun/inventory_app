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
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: SizedBox(
                    width: 200,
                    height: 150,
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
            ElevatedButton(onPressed: () {
              signupCtrl.add();
            }, child: const Text("Signup")
            ),
            SizedBox(height: Get.height*.15),
            Center(
              child: TextButton(onPressed: (){Get.to(()=> Login());}, child: const Text("Have an account? Login here")),
            )
          ],

        ),
      ),
    );
  }
}
