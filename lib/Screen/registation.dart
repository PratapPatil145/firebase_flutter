import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_2/Screen/login.dart';
import 'package:flutter_firebase_2/sevices/auth_service.dart';

class Registation extends StatefulWidget {
  const Registation({super.key});

  @override
  State<Registation> createState() => _RegistationState();
}

class _RegistationState extends State<Registation> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswardControlller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'TutorialKart',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 20),
                  )),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: ' Confirm Password',
                  ),
                ),
              ),
              // TextButton(
              //   onPressed: () {
              //     //forgot password screen
              //   },
              //   child: const Text('Forgot Password',),
              // ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(010, 0, 10, 0),
                  child: ElevatedButton(
                    child: const Text(
                      'Sign In',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () async {
                      if (emailController.text == "" ||
                          passwordController.text == "") {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("All field are Required !"),
                          backgroundColor: Colors.red,
                        ));
                      } else {
                        User? result = await AuthService().register(
                            emailController.text, passwordController.text);
                        if (result != null) {
                          print("success");
                          print(result.email);
                        }
                      }
                      // print(nameController.text);
                      // print(passwordController.text);
                    },
                  )),
              Row(
                children: <Widget>[
                  const Text('Already have an Account?'),
                  TextButton(
                    child: const Text(
                      'Log In',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      //signup screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyStatefulWidget())
                      );
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ],
          )),
    );
  }
}
