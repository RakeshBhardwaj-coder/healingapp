import 'dart:ffi';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:healingapp/pages/askQue.dart';
import 'package:healingapp/pages/loginPage.dart';
import 'package:healingapp/pages/signup.dart';
import 'package:healingapp/pages/signup2.dart';
import 'package:healingapp/routes.dart';
import 'package:healingapp/pages/login_page.dart';
import 'package:healingapp/pages/home_page.dart';
import 'package:healingapp/services/auth_service.dart';
import 'package:healingapp/try.dart';
import 'package:healingapp/widgets/bottomNavigatorBar.dart';
import 'package:healingapp/try2.dart';
import 'package:provider/provider.dart';
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
            return MultiProvider(
              providers: [
                Provider(
                  create: (_) => AuthServices(),
                ),
              ],
              child: MaterialApp(
                themeMode: ThemeMode.light,
                debugShowCheckedModeBanner: false,
                initialRoute: MyRoutes.loginRoute,
                routes: {
                  "/": (context) => SignUpWidget(),
                  MyRoutes.homeRoute: (context) => SignUpWidget(),
                  MyRoutes.loginRoute: (context) => LoginPage2(),
                  MyRoutes.askQueRoute: (context) => AskQue(),
                  MyRoutes.navigatorRoute: (context) => bottomNavigatorBar(),
                  MyRoutes.tryApp: (context) => CameraWidget(),
                  // MyRoutes.homeRoute
                },
              ),
            );
          }
          return CircularProgressIndicator();
        });

    //make changes by Rakesh
  }
}
