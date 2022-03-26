import 'dart:ffi';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:healingapp/pages/askQue.dart';
// import 'package:healingapp/pages/loginPage.dart';
// import 'package:healingapp/pages/signup.dart';
// import 'package:healingapp/pages/signup2.dart';
import 'package:healingapp/routes.dart';
import 'package:healingapp/pages/HomePage.dart';
import 'package:healingapp/try.dart';
import 'package:healingapp/userServices/SignUpPage.dart';
import 'package:healingapp/userServices/loginPage.dart';
import 'package:healingapp/userServices/verifyEmailPage.dart';
import 'package:healingapp/utils/userPreferences.dart';
import 'package:healingapp/widgets/bottomNavigatorBar.dart';
import 'package:healingapp/try2.dart';
import 'package:provider/provider.dart';
// import 'package:firebase_database/firebase_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.init();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return VerifyEmailPage();
            } else {
              return SignUpPage();
            }
          }),
        ),
      ),
    );
    // return FutureBuilder(
    //     future: _initialization,
    //     builder: (context, snapshot) {
    //       if (snapshot.hasError) {
    //         print("Something error to initialize the database.");
    //       }
    //       if (snapshot.connectionState == ConnectionState.done) {
    //         return MultiProvider(
    //           providers: [
    //             Provider(
    //               create: (_) => AuthServices(),
    //             ),
    //           ],
    //           child: MaterialApp(
    //             themeMode: ThemeMode.light,
    //             debugShowCheckedModeBanner: false,
    //             initialRoute: MyRoutes.loginRoute,
    //             routes: {
    //               "/": (context) => HomePage(),
    //               MyRoutes.homeRoute: (context) => HomePage(),
    //               MyRoutes.loginRoute: (context) => LoginPage2(),
    //               MyRoutes.askQueRoute: (context) => AskQue(),
    //               MyRoutes.navigatorRoute: (context) => bottomNavigatorBar(),
    //               MyRoutes.tryApp: (context) => CameraWidget(),
    //               // MyRoutes.homeRoute
    //             },
    //           ),
    //         );
    //       }
    //       return CircularProgressIndicator();
    //     });

    //make changes by Rakesh
  }
}
