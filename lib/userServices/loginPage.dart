import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:healingapp/services/authHelper.dart';
import 'package:healingapp/userServices/forgetPassword.dart';
import 'package:healingapp/pages/login_page.dart';
import 'package:healingapp/userServices/signupPage.dart';
import 'package:healingapp/widgets/bottomNavigatorBar.dart';

class LoginPage2 extends StatefulWidget {
  LoginPage2({Key? key}) : super(key: key);

  @override
  _LoginPage2State createState() => _LoginPage2State();
}

class _LoginPage2State extends State<LoginPage2> {
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
                      'Sign in',
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

                        // _formKey.currentState?.reset();

                        print(emailController);
                        // if (formkey.currentState!.validate()) {
                        //   setState(() {
                        //     existingEmail = emailController.text;
                        //     existingPassword = passwordController.text;
                        //   });
                        // userLogin();
                        // }
                      },
                    )),
                Row(
                  children: <Widget>[
                    const Text('Does not have account?'),
                    TextButton(
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        //signup screen
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpPage()));
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                Divider(),
                MaterialButton(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://pbs.twimg.com/profile_images/1455185376876826625/s1AjSxph_400x400.jpg'),
                                    fit: BoxFit.cover),
                                shape: BoxShape.circle),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text("Sign In with Google")
                        ]),
                    onPressed: () {})
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
