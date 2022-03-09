import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:healingapp/pages/askQue.dart';
import 'package:healingapp/routes.dart';
import 'package:healingapp/pages/login_page.dart';
import 'package:healingapp/pages/home_page.dart';
import 'package:healingapp/try.dart';

void main() /*async */ {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.tryapp,
      routes: {
        "/": (context) => HomePage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.askQueRoute: (context) => AskQue(),
        MyRoutes.tryapp: (context) => CameraWidget(),

        // MyRoutes.homeRoute
      },
    );
  }
}
