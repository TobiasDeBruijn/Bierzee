import 'package:bierzee/views/splash_screen.dart';
import 'package:flutter/material.dart';

const String REGEXP_DECIMAL = "^[0-9]*([\\,\\.]{1}[0-9]{1,2}){0,1}\$";
const String ZANDZEE_ORG_ID = "279hNwgyTZRAvQl1JUT41GU7ZgOBo2s0i54WFmjsbqwl1eSWuPQwtguUeHlor1Mt";

void main() {
  runApp(const MaterialApp(
    title: 'Bierzee',
    home: SplashScreen(),
  ));
}