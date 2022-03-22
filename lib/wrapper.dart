import 'package:flutter/material.dart';
import 'package:healingapp/pages/home_page.dart';
import 'package:healingapp/pages/login_page.dart';
import 'package:healingapp/services/auth_service.dart';
import 'package:healingapp/widgets/bottomNavigatorBar.dart';
import 'package:provider/provider.dart';

import 'model/userModel.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthServices>(context);
    // return StreamBuilder<NewUser?>(
    //   stream: authService.auth,
    //   builder: (_, AsyncSnapshot<User?> snapshot) {
    //     if (snapshot.connectionState == ConnectionState.active) {
    //       final User? user = snapshot.data;
    //       return user == null ? LoginPage() : bottomNavigatorBar();
    //     } else {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
    //     }
    //   },
    // );
  }
}
