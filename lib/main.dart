import 'package:flutter/material.dart';
import 'package:healingapp/routes.dart';
import 'package:healingapp/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.loginRoute,
      routes: {
        "/": (context) => LoginPage(),
        // MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage()

        // MyRoutes.homeRoute
      },
    );
  }
}
