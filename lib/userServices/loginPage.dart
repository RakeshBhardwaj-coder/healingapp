import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:healingapp/services/authHelper.dart';
import 'package:healingapp/userServices/forgetPassword.dart';
import 'package:healingapp/widgets/bottomNavigatorBar.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String existingEmail = '', existingPassword = '';

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Form(
        key: formkey,
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'HealingApp',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    // controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    controller: passwordController,
                    validator: MultiValidator([
                      RequiredValidator(errorText: "* Required"),
                      MinLengthValidator(6,
                          errorText: "Password should be atleast 6 characters"),
                      MaxLengthValidator(15,
                          errorText:
                              "Password should not be greater than 15 characters")
                    ]),
                    obscureText: true,
                    // controller: passwordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    //forgot password screen
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ForgotPassword(),
                      ),
                    );
                  },
                  child: const Text(
                    'Forgot Password',
                  ),
                ),
                Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      child: const Text('Login'),
                      onPressed: () async {
                        // print(nameController.text);
                        // print(passwordController.text);

                        if (emailController.text.isEmpty ||
                            passwordController.text.isEmpty) {
                          print("Email and Password cannot be Empty");
                          return;
                        }

                        try {
                          final user = await AuthHelper.signInWithEmail(
                              email: emailController.text,
                              password: passwordController.text);
                          // if (user != null) {
                          print("Login Successfully");
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => bottomNavigatorBar(),
                              ));

                          // }
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: Colors.orangeAccent,
                                content: Text(
                                  "No user found for that email.",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                )));
                            print('No user found for that email.');
                          } else if (e.code == 'wrong-password') {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: Colors.orangeAccent,
                                content: Text(
                                  "Wrong Password provided by User",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                )));
                            print('Wrong password provided for that user.');
                          }
                        }
                      },
                    )),
              ],
            )),
      ),
    );
  }

  // userLogin() async {
  //   try {
  //     UserCredential userCredential = await FirebaseAuth.instance
  //         .signInWithEmailAndPassword(
  //             email: existingEmail, password: existingPassword);
  //     Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => bottomNavigatorBar(),
  //         ));
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //           backgroundColor: Colors.orangeAccent,
  //           content: Text(
  //             "No user found for that email.",
  //             style: TextStyle(fontSize: 18, color: Colors.black),
  //           )));
  //       print('No user found for that email.');
  //     } else if (e.code == 'wrong-password') {
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //           backgroundColor: Colors.orangeAccent,
  //           content: Text(
  //             "Wrong Password provided by User",
  //             style: TextStyle(fontSize: 18, color: Colors.black),
  //           )));
  //       print('Wrong password provided for that user.');
  //     }
  //   }
  // }
}
