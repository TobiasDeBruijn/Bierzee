import 'dart:async';

import 'package:bierzee/entities/user.dart';
import 'package:bierzee/util/http.dart';
import 'package:bierzee/views/home.dart';
import 'package:bierzee/views/login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:new_version/new_version.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    if(kReleaseMode) {
      NewVersion newVersion = NewVersion(iOSAppStoreCountry: "NL");
      newVersion.showAlertIfNecessary(context: context);
    }

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
    String? sessionId = sharedPreferences.getString("sessionId");

    if(sessionId == null) {
      return null;
    }

    Response<User?> user = await User.getBySession(sessionId);
    if(!user.handleNotOk(context)) {
      return null;
    } else if (user.value == null) {
      return null;
    } else {
      return user.value!;
    }
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