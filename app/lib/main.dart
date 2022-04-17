import 'package:bierzee/views/splash_screen.dart';
import 'package:flutter/material.dart';

const String REGEXP_DECIMAL = "^[0-9]*([\\,\\.]{1}[0-9]{2}){0,1}\$";

const String ZANDZEE_ORG_ID = "4TDGS9EkWrbSXsCbz4amdkn8fqzM8VUt";

void main() {
  runApp(const MaterialApp(
    title: 'Bierzee',
    home: SplashScreen(),
  ));
}