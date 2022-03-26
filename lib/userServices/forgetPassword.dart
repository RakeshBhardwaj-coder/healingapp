import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healingapp/userServices/loginPage.dart';

class ForgotPassword extends StatelessWidget {
  static String id = 'forgot-password';
  String? email;
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.lightBlueAccent,
      body: Form(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Forget Password',
                style: TextStyle(fontSize: 20, color: Colors.lightBlue),
              ),
              // TextFormField(
              //   style: TextStyle(color: Colors.white),
              //   decoration: InputDecoration(
              //     labelText: 'Your Email',
              //     icon: Icon(
              //       Icons.mail,
              //       color: Colors.white,
              //     ),
              //     errorStyle: TextStyle(color: Colors.white),
              //     labelStyle: TextStyle(color: Colors.white),
              //     hintStyle: TextStyle(color: Colors.white),
              //     focusedBorder: UnderlineInputBorder(
              //       borderSide: BorderSide(color: Colors.white),
              //     ),
              //     enabledBorder: UnderlineInputBorder(
              //       borderSide: BorderSide(color: Colors.white),
              //     ),
              //     errorBorder: UnderlineInputBorder(
              //       borderSide: BorderSide(color: Colors.white),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 24,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Your Email',
                  ),
                ),
              ),
              // SizedBox(height: 20),

              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    child: const Text('Forget Password'),
                    onPressed: () async {
                      email = emailController.text;
                      resetPassword();
                    },
                  )),

              TextButton(
                onPressed: () {
                  //forgot password screen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
                child: const Text(
                  'Go to Login Page',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email!);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      }
    }
  }
}
