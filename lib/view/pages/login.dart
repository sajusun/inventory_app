import 'package:flutter/material.dart';

class Login extends StatelessWidget {
   Login({super.key});

  TextEditingController email =TextEditingController();
   TextEditingController pass =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("userLogin"),centerTitle: true,),
      body: Container(
        child: Column(
          children: [
            TextFormField(controller: email,),
            TextFormField(controller: pass,),
          ],
        ),
      ),
    );
  }
}
