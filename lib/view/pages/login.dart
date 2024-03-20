import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Login({super.key});

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("userLogin"), centerTitle: true,),
      body: Container(
        child: Column(
          children: [
          TextFormField(controller: email,
            style: const TextStyle(height: 1),
            decoration: const InputDecoration(border: UnderlineInputBorder(),labelText: "Password"),
          ),
        TextFormField(controller: pass,
          style: const TextStyle(height: 1),
          decoration: const InputDecoration(border: UnderlineInputBorder(),labelText: "Password"),
        ),
        SizedBox(height: 20,),
        ElevatedButton(onPressed: () {}, child: const Text("Login")
        ),
          ],
        ),
      ),
    );
  }
}
