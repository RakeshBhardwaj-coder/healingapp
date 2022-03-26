import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healingapp/pages/HomePage.dart';
import 'package:healingapp/widgets/bottomNavigatorBar.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({Key? key}) : super(key: key);
  @override
  _VerifyEmailPageState createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;

  void initState() {
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified) {
      emailVerification();
      timer = Timer.periodic(Duration(seconds: 3), (_) {
        checkEmailVerified();
      });
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    dispose();
    super.dispose();
  }

  Future checkEmailVerified() async {
    // await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isEmailVerified) {
      timer?.cancel();
    }
  }

  Future emailVerification() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      await user!.sendEmailVerification();

      setState(
        () => canResendEmail = false,
      );
      await Future.delayed(Duration(seconds: 5));
      setState(
        () => canResendEmail = true,
      );
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? bottomNavigatorBar()
      : Scaffold(
          appBar: AppBar(title: Text("Verify Email")),
          body: Padding(
            padding: EdgeInsets.all(16),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "A Verification email has been sent to  your mail.",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 24,
              ),
              ElevatedButton.icon(
                onPressed: canResendEmail ? emailVerification : null,
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                ),
                icon: Icon(
                  Icons.email,
                  size: 32,
                ),
                label: Text(
                  "Resend Email",
                  style: TextStyle(fontSize: 24),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              TextButton(
                onPressed: (() => FirebaseAuth.instance.signOut()),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                ),
                child: Text(
                  "Cancel",
                  style: TextStyle(fontSize: 24),
                ),
              )
            ]),
          ),
        );
}
