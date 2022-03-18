import 'dart:io';
import 'package:bierzee/entities/beer.dart';
import 'package:bierzee/entities/payment.dart';
import 'package:bierzee/util/http.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bierzee/proto/items.pb.dart' as proto;
import 'package:shared_preferences/shared_preferences.dart';

class User {

  final String id;
  final String name;
  final String sessionId;

  static http.Client _CLIENT = http.Client();
  static const String _SERVER = "http://10.10.2.1:8080";

  const User._({required this.id, required this.name, required this.sessionId});

  void _setPreferences() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("userId", id);
    sharedPreferences.setString("userName", name);
  }

  static Future<User?> doLogin(String id, String name) async {
    debugPrint('Logging in');
    try {
      proto.LoginRequest loginRequest = proto.LoginRequest(
          employeeId: id, name: name);
      http.Response response = await _CLIENT.post(
          Uri.parse("$_SERVER/api/v1/login"),
          headers: getProtobufHeaders(),
          body: loginRequest.writeToBuffer()
      );

      switch (response.statusCode) {
        case 200:
          proto.LoginResponse loginResponse = proto.LoginResponse.fromBuffer(
              response.bodyBytes);
          User user = User._(id: id, name: name, sessionId: loginResponse.sessionId);
          user._setPreferences();
          return user;
        default:
          debugPrint('Got status ' + response.statusCode.toString() + ' :' + response.body);
          return null;
      }

    } on SocketException catch(e) {
      debugPrint('SocketException ' + e.toString());
      return null;
    }
  }

  Future<List<Beer>?> getBeers() async {
    debugPrint('Fetching beers');
    try {
      http.Response response = await _CLIENT.get(
          Uri.parse("$_SERVER/api/v1/beer/drunk"),
          headers: getHeaders(sessionId)
      );

      switch (response.statusCode) {
        case 200:
          proto.DrunkResponse drunkResponse = proto.DrunkResponse.fromBuffer(
              response.bodyBytes);
          return drunkResponse.beers.map((e) => Beer(e.drunkAt.toInt()))
              .toList();
        default:
          return null;
      }
    } on SocketException catch(e) {
      debugPrint('SocketException ' + e.toString());
      return null;
    }
  }

  Future<int?> getBeerPrice() async {
    debugPrint('Fetching beer price');
    try {
      http.Response response = await _CLIENT.get(
          Uri.parse("$_SERVER/api/v1/beer/price"),
          headers: getHeaders(sessionId)
      );

      switch (response.statusCode) {
        case 200:
          proto.GetBeerPriceResponse getBeerPriceResponse = proto
              .GetBeerPriceResponse.fromBuffer(response.bodyBytes);
          return getBeerPriceResponse.price.toInt();
        default:
          return null;
      }
    } on SocketException catch(e) {
      debugPrint('SocketException ' + e.toString());
      return null;
    }
  }

  Future<bool> consumeBeers(int amountConsumed) async {
    debugPrint('Consuming beers');
    try {
      proto.DrinkRequest drinkRequest = proto.DrinkRequest(
          beersDrunk: amountConsumed);
      http.Response response = await _CLIENT.post(
          Uri.parse("$_SERVER/api/v1/beer/drink"),
          headers: getHeaders(sessionId),
          body: drinkRequest.writeToBuffer()
      );

      switch (response.statusCode) {
        case 200:
          return true;
        default:
          return false;
      }
    } on SocketException catch(e) {
      debugPrint('SocketException ' + e.toString());
      return false;
    }
  }

  Future<List<Payment>?> getPayments() async {
    debugPrint('Fetching payments');
    try {
      http.Response response = await _CLIENT.get(
          Uri.parse("$_SERVER/api/v1/payment/broke"),
          headers: getHeaders(sessionId)
      );

      switch (response.statusCode) {
        case 200:
          proto.BrokeResponse brokeResponse = proto.BrokeResponse.fromBuffer(
              response.bodyBytes);
          return brokeResponse.payments.map((e) =>
              Payment(amountPaid: e.amountPaid, paidAt: e.paidAt.toInt()))
              .toList();
        default:
          return null;
      }
    } on SocketException catch(e) {
      debugPrint('SocketException ' + e.toString());
      return null;
    }
  }

  Future<PaymentBalance?> getPaymentBalance() async {
    debugPrint('Fetching payment balance');
    try {
      http.Response response = await _CLIENT.get(
          Uri.parse("$_SERVER/api/v1/payment/balance"),
          headers: getHeaders(sessionId)
      );

      switch (response.statusCode) {
        case 200:
          proto.BalanceResponse balanceResponse = proto.BalanceResponse
              .fromBuffer(response.bodyBytes);
          return PaymentBalance(amountPaid: balanceResponse.amountPaid,
              beersDrunk: balanceResponse.beersDrunk.toInt(),
              balance: balanceResponse.balance,
              beersLeft: balanceResponse.beersLeft.toInt(),
          );
        default:
          return null;
      }
    } on SocketException catch(e) {
      debugPrint('SocketException ' + e.toString());
      return null;
    }
  }

  Future<bool> makePayment(double amountPaid) async {
    debugPrint('Making payment');
    try {
      proto.PayRequest payRequest = proto.PayRequest(amount: amountPaid);
      http.Response response = await _CLIENT.post(
          Uri.parse("$_SERVER/api/v1/payment/pay"),
          headers: getHeaders(sessionId),
          body: payRequest.writeToBuffer()
      );

      switch (response.statusCode) {
        case 200:
          return true;
        default:
          return false;
      }
    } on SocketException catch(e) {
      debugPrint('SocketException ' + e.toString());
      return false;
    }
  }
}