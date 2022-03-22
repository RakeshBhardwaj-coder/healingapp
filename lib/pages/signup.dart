
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healingapp/pages/login_page.dart';
import 'package:healingapp/widgets/bottomNavigatorBar.dart';

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController confirmPasswordController = TextEditingController();

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    // super.dispose();
  }

  clear() {
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  registration() async {
    if (passwordController.text == confirmPasswordController.text &&
        passwordController.text.length >= 6) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
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

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                    key: _formKey,
                    // obscureText: true,
                    controller: emailController,
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
                      print(getEmail);
                    }),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 20),
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
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
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
                MaterialButton(
                  color: Colors.lightBlue,
                  child: Text(
                    'SignUp',
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  onPressed: () {
                    _formKey.currentState?.reset();
                    print(emailController);
                    registration();
                    clear();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

signIn() async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: existEmail!, password: existPassword!);
    print("Hoge lwda sign in");
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
}
