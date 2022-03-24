import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:healingapp/services/authHelper.dart';
import 'package:healingapp/userServices/forgetPassword.dart';
import 'package:healingapp/userServices/SignUpPage.dart';
import 'package:healingapp/userServices/loginPage.dart';
import 'package:healingapp/widgets/bottomNavigatorBar.dart';

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
                // TextButton(
                //   onPressed: () {
                //     //forgot password screen
                //     Navigator.pushReplacement(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => ForgotPassword(),
                //       ),
                //     );
                //   },
                //   child: const Text(
                //     'Forgot Password',
                //   ),
                // ),
                MaterialButton(
                  color: Colors.lightBlue,
                  child: Text(
                    'SignUp',
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  onPressed: () async {
                    if (emailController.text.isEmpty ||
                        passwordController.text.isEmpty) {
                      const snackBar = SnackBar(
                        content: Text("Email and Password cannot be Empty",
                            textAlign: TextAlign.center),
                        backgroundColor: Colors.red,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);

                      print("Email and Password cannot be Empty");
                      return;
                    }
                    if (confirmPasswordController.text.isEmpty ||
                        confirmPasswordController.text !=
                            passwordController.text) {
                      const snackBar = SnackBar(
                        content: Text("Confirm password does not match",
                            textAlign: TextAlign.center),
                        backgroundColor: Colors.red,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      print("Confirm password does not match");
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
                        const snackBar = SnackBar(
                          content: Text(
                            "SignUp Successfully",
                            textAlign: TextAlign.center,
                          ),
                          backgroundColor: Colors.lightBlue,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        print("SignUp Successfully");
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                            e.toString(),
                            textAlign: TextAlign.center,
                          )));
                      print(e);
                    }

                    // _formKey.currentState?.reset();

                    // registration();
                    // clear();
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
}
