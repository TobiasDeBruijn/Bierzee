import 'dart:async';

import 'package:bierzee/entities/user.dart';
import 'package:bierzee/views/home.dart';
import 'package:bierzee/views/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/sportfondsen-logo-150.png'),
            fit: BoxFit.fitWidth
          )
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 22),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: CircularProgressIndicator(),
          ),
        ),
      )
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    Timer(const Duration(seconds: 2), () async {
      User? user = await checkAndGetUser();
      if(user == null) {
        navigateToLogin();
        return;
      }

      navigateToHome(user);
    });
  }

  Future<User?> checkAndGetUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userId = sharedPreferences.getString("userId");
    String? userName = sharedPreferences.getString("userName");

    if(userId == null || userName == null) {
      return null;
    }

    User? user = await User.doLogin(userId, userName);
    return user;
  }

  void navigateToHome(User user) {
    debugPrint('Going home');
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) => HomeView(user: user)));
  }

  void navigateToLogin() {
    debugPrint('To login');
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) => LoginView()));
  }
}