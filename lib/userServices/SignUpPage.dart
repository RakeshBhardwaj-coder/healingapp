import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:healingapp/services/authHelper.dart';
import 'package:healingapp/userServices/forgetPassword.dart';
import 'package:healingapp/userServices/SignUpPage.dart';
import 'package:healingapp/userServices/loginPage.dart';
import 'package:healingapp/widgets/bottomNavigatorBar.dart';
import 'package:healingapp/utils/scaffoldMsg.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

String? userName, userEmail, userTitle;

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  clear() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Form(
        key: _formKey,
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Health Helper',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 20),
                    )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: TextField(
                      // key: _formKey,
                      // obscureText: true,
                      controller: emailController,
                      // obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 20.0,
                      ),
                      onChanged: (getEmail) {
                        // print('$ttl');
                        getEmail = emailController.text;
                        userEmail = emailController.text;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: TextField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 20.0,
                      ),
                      onChanged: (getTitle) {}),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: TextField(
                      obscureText: true,
                      controller: confirmPasswordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Confirm Password',
                      ),
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 20.0,
                      ),
                      onChanged: (getTitle) {}),
                ),
                MaterialButton(
                  color: Colors.lightBlue,
                  child: Text(
                    'SignUp',
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  onPressed: () async {
                    if (emailController.text.isEmpty ||
                        passwordController.text.isEmpty) {
                      ScaffoldMsg.ErrorMsg(
                          context, "Email and Password cannot be Empty");

                      print("Email and Password cannot be Empty");
                      return;
                    } else if (confirmPasswordController.text.isEmpty ||
                        confirmPasswordController.text !=
                            passwordController.text) {
                      print('Confirm password does not match');
                      ScaffoldMsg.ErrorMsg(
                          context, "Confirm password does not match");
                      return;
                    }
                    try {
                      User? user = FirebaseAuth.instance.currentUser;

                      final userAdded = await AuthHelper.signupWithEmail(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim());

                      if (userAdded != null) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                        ScaffoldMsg.SuccessMsg(context, "SignUp Successfully");
                        print('SignUp Successfully');
                      }
                    } catch (e) {
                      // ScaffoldMsg.ErrorMsg(context, e);
                      print(e);
                    }
                  },
                ),
                Row(
                  children: <Widget>[
                    const Text('already have account?'),
                    TextButton(
                      child: const Text(
                        'Log in',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        //signup screen
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                Divider(),
              ],
            )),
      ),
    );
  }
}
