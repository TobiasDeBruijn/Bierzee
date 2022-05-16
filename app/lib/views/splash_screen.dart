import 'dart:async';

import 'package:bierzee/api/auth/session.dart';
import 'package:bierzee/api/common.dart';
import 'package:bierzee/entities/user.dart';
import 'package:bierzee/proto/payloads/auth.pb.dart';
import 'package:bierzee/views/home.dart';
import 'package:bierzee/views/login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:new_version/new_version.dart';

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
    String? sessionId = await User.getStoredSessionId();
    debugPrint("SessionID: ${sessionId}");

    if(sessionId == null) {
      return null;
    }

    Response<GetSessionResponse> response = await AuthSession.session(sessionId);
    if(!response.handleNotOk(context)) {
      debugPrint("Session response is not OK");
      return null;
    } else if (response.value == null) {
      debugPrint("Session response value is null");
      return null;
    } else {
      debugPrint("User is OK");
      User user = User(
        organizationId: response.value!.organization.id,
        sessionId: response.value!.session.id,
        id: response.value!.user.id,
        isAdmin: response.value!.isAdmin,
        name: response.value!.user.name,
        organizationCode: response.value!.organization.code,
      );

      user.setStoredSessionId();
      return user;
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