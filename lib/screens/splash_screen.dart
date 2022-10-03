import 'dart:async';

import 'package:email_password_login/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:email_password_login/core/config/navigation.dart';
import 'package:email_password_login/core/utils/constants.dart';
import 'package:email_password_login/core/utils/routes.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
            () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 26),
            color: AppColors.white,
            child: Center(
              child: Image.asset(ImageConstants.logo),
            ),
      )
    );
  }

}
