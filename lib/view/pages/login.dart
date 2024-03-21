import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventoryapp/view/pages/signup.dart';

class Login extends StatelessWidget {
  Login({super.key});

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("userLogin"), centerTitle: true,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
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
            child: TextFormField(controller: email,
              style: const TextStyle(height: 1),
              decoration: const InputDecoration(border: UnderlineInputBorder(),labelText: "Email"),
            ),
          ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextFormField(controller: pass,
            obscureText: true,
            style: const TextStyle(height: 1),
            decoration: const InputDecoration(border: UnderlineInputBorder(),labelText: "Password"),
          ),
        ),
        const SizedBox(height: 20,),
        ElevatedButton(onPressed: () {}, child: const Text("Login")
        ),
            const SizedBox(height: 40,),
            Center(
              child: TextButton(onPressed: (){Get.to(()=> Signup());}, child: const Text("New User? Create Account")),
            )
          ],
        ),
      ),
    );
  }
}
