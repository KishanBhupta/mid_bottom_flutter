import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mid2exam/homeScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController(text: "kishan@gmail.com");
  TextEditingController passwordController = TextEditingController(text: "kishan123");

  final _fromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _fromKey,
            child: Column(
              children: [
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: "Enter Email" , icon: Icon(Icons.email_rounded)),
      
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(labelText: "Enter Password" , icon: Icon(Icons.password_rounded)),
                ),
      
                SizedBox(height: 10,),
                ElevatedButton(
                    onPressed: (){
                      (emailController.text.toString() == "kishan@gmail.com" && passwordController.text.toString() == "kishan123" )? Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen())) :  print("Credential not match ");
                    },
                    child: Text("Submit" ,style: TextStyle(fontWeight: FontWeight.w600 ))
                )
      
              ],
            ),
          ),
        ),
      ),
    );
  }
}
