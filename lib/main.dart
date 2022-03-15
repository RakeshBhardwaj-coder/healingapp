import 'dart:ffi';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:healingapp/pages/askQue.dart';
import 'package:healingapp/routes.dart';
import 'package:healingapp/pages/login_page.dart';
import 'package:healingapp/pages/home_page.dart';
import 'package:healingapp/try.dart';
import 'package:healingapp/widgets/bottomNavigatorBar.dart';
import 'package:healingapp/try2.dart';
// import 'package:firebase_database/firebase_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("Something error to initialize the database.");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              themeMode: ThemeMode.light,
              debugShowCheckedModeBanner: false,
              initialRoute: MyRoutes.tryApp,
              routes: {
                "/": (context) => HomePage(),
                MyRoutes.homeRoute: (context) => const HomePage(),
                MyRoutes.loginRoute: (context) => LoginPage(),
                MyRoutes.askQueRoute: (context) => AskQue(),
                MyRoutes.navigatorRoute: (context) => bottomNavigatorBar(),
                MyRoutes.tryApp: (context) => CameraWidget(),
                // MyRoutes.homeRoute
              },
            );
          }
          return CircularProgressIndicator();
        });

    //make changes by Rakesh
  }
}
