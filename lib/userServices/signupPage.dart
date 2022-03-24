import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healingapp/model/userModel.dart';
import 'package:healingapp/pages/login_page.dart';
import 'package:healingapp/services/authHelper.dart';
import 'package:healingapp/widgets/bottomNavigatorBar.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

String? userName, userEmail, userTitle;

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  String? selectedValue;
  List<String> items = ['User', 'Doctor'];

  // @override
  // void dispose() {
  //   // Clean up the controller when the widget is removed from the widget tree.
  //   // This also removes the _printLatestValue listener.
  //   emailController.dispose();
  //   passwordController.dispose();
  //   confirmPasswordController.dispose();
  //   // super.dispose();
  // }

  clear() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  registration() async {
    if (passwordController.text == confirmPasswordController.text &&
        passwordController.text.length >= 6) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            // name: nameController.text,
            email: emailController.text,
            password: passwordController.text);
      } catch (e) {
        print(e);
      }
    } else if (passwordController.text.length < 6) {
      print("Password length should be more than 6 letter.");
    } else {
      print("Password and confirm not matching.");
    }
  }

  signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Center(
          child: Padding(
            // padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            padding: const EdgeInsets.all(20.0),

            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // TextField(
                  //     controller: nameController,
                  //     decoration: InputDecoration(
                  //       border: OutlineInputBorder(),
                  //       labelText: 'Full Name',
                  //     ),
                  //     style: TextStyle(
                  //       fontFamily: 'Arial',
                  //       fontSize: 20.0,
                  //     ),
                  //     onChanged: (getName) {
                  //       // print('$ttl');
                  //       getName = nameController.text;
                  //       userName = nameController.text;
                  //       // print(getEmail);
                  //     }),
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
                          print(getEmail);
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
                        onChanged: (getTitle) {
                          // print('$ttl');
                        }),
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
                        onChanged: (getTitle) {
                          // print('$ttl');
                        }),
                  ),
                  // DropdownButtonHideUnderline(
                  // DropdownButtonFormField(
                  //   decoration: InputDecoration(
                  //       focusColor: Colors.red,
                  //       border: OutlineInputBorder(
                  //         borderRadius: const BorderRadius.all(
                  //           const Radius.circular(10.0),
                  //         ),
                  //       ),
                  //       filled: true,
                  //       hintStyle: TextStyle(color: Colors.grey[800]),
                  //       hintText: "Title",
                  //       fillColor: Color.fromARGB(255, 255, 255, 255)),
                  //   // value: selectedValue,
                  //   onChanged: (value) {
                  //     setState(() {
                  //       selectedValue = value.toString();
                  //       userTitle = selectedValue;
                  //       print(selectedValue);
                  //     });
                  //   },
                  //   items: items
                  //       .map((title) => DropdownMenuItem(
                  //           value: title, child: Text("$title")))
                  //       .toList(),
                  // ),
                  // ),
                  MaterialButton(
                    color: Colors.lightBlue,
                    child: Text(
                      'SignUp',
                      style:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
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

                      print(emailController);
                      // registration();
                      // clear();
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
