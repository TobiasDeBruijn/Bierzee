import 'package:bierzee/views/splash_screen.dart';
import 'package:flutter/material.dart';

//const String SERVER = "https://bierzee.k8s.array21.dev";
const String SERVER = "http://10.10.2.1:8080";

void main() {
  runApp(const MaterialApp(
    title: 'Bierzee',
    home: SplashScreen(),
  ));
}