import 'dart:io';
import 'package:bierzee/entities/beer.dart';
import 'package:bierzee/entities/payment.dart';
import 'package:bierzee/main.dart';
import 'package:bierzee/util/http.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bierzee/proto/items.pb.dart' as proto;
import 'package:shared_preferences/shared_preferences.dart';

class User {

  final String id;
  final String name;
  final String sessionId;

  final bool isAdmin;

  static http.Client _CLIENT = http.Client();

  const User._({required this.id, required this.name, required this.sessionId, required this.isAdmin});

  void _setPreferences() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("sessionId", sessionId);
  }

  void _clearPreferences() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove("sessionId");
  }

  static Future<Response<User?>> doLogin(String id, String password) async {
    debugPrint('Logging in');
    try {
      proto.LoginRequest loginRequest = proto.LoginRequest(
          employeeId: id, password: password);
      http.Response response = await _CLIENT.post(
          Uri.parse("$SERVER/api/v1/auth/login"),
          headers: getProtobufHeaders(),
          body: loginRequest.writeToBuffer()
      );

      switch (response.statusCode) {
        case 200:
          proto.LoginResponse loginResponse = proto.LoginResponse.fromBuffer(
              response.bodyBytes);
          User user = User._(id: id, name: loginResponse.name, sessionId: loginResponse.sessionId, isAdmin: loginResponse.isAdmin);
          user._setPreferences();
          return Response.ok(user);
        case 401:
          return Response.ok(null);
        case 429:
          return Response.rateLimit();
        default:
          debugPrint('Got status ' + response.statusCode.toString() + ' :' + response.body);
          return Response.fail();
      }
    } on SocketException catch(e) {
      debugPrint('SocketException ' + e.toString());
      return Response.fail();
    }
  }

  static Future<Response<User?>> getBySession(String sessionId) async {
    try {
      http.Response response = await _CLIENT.get(Uri.parse("$SERVER/api/v1/auth/session"),
        headers: {
          'Authorization': sessionId,
          'Accept': 'application/protobuf'
        }
      );

      switch(response.statusCode) {
        case 200:
          proto.GetSessionResponse getSessionResponse = proto.GetSessionResponse.fromBuffer(response.bodyBytes);
          User user = User._(id: getSessionResponse.id, name: getSessionResponse.name, sessionId: sessionId, isAdmin: getSessionResponse.isAdmin);
          return Response.ok(user);
        case 401:
          return Response.ok(null);
        case 429:
          return Response.rateLimit();
        default:
          debugPrint('Got status ' + response.statusCode.toString() + ' :' + response.body);
          return Response.fail();
      }
    } on SocketException catch(e) {
      debugPrint('SocketException ' + e.toString());
      return Response.fail();
    }
  }

  Future<Response<void>> doLogout() async {
    debugPrint('Logging out');
    try {
      http.Response response = await _CLIENT.post(Uri.parse("$SERVER/api/v1/auth/logout"), headers: getHeaders(sessionId));
      switch(response.statusCode) {
        case 200:
          _clearPreferences();
          return Response.ok(null);
        case 429:
          return Response.rateLimit();
        default:
          debugPrint('Got status ' + response.statusCode.toString() + ' :' + response.body);
          return Response.fail();
      }
    } on SocketException catch(e) {
      debugPrint('SocketException ' + e.toString());
      return Response.fail();
    }
  }

  Future<Response<List<Beer>>> getBeers() async {
    debugPrint('Fetching beers');
    try {
      http.Response response = await _CLIENT.get(
          Uri.parse("$SERVER/api/v1/beer/drunk"),
          headers: getHeaders(sessionId)
      );

      switch (response.statusCode) {
        case 200:
          proto.DrunkResponse drunkResponse = proto.DrunkResponse.fromBuffer(
              response.bodyBytes);
          return Response.ok(drunkResponse.beers.map((e) => Beer(e.drunkAt.toInt()))
              .toList());
        default:
          debugPrint('Got status ' + response.statusCode.toString() + ' :' + response.body);
          return Response.fail();
      }
    } on SocketException catch(e) {
      debugPrint('SocketException ' + e.toString());
      return Response.fail();
    }
  }

  Future<Response<BeerPrice>> getBeerPrice() async {
    debugPrint('Fetching beer price');
    try {
      http.Response response = await _CLIENT.get(
          Uri.parse("$SERVER/api/v1/beer/price"),
          headers: getHeaders(sessionId)
      );

      switch (response.statusCode) {
        case 200:
          proto.GetBeerPriceResponse getBeerPriceResponse = proto
              .GetBeerPriceResponse.fromBuffer(response.bodyBytes);
          return Response.ok(BeerPrice(price: getBeerPriceResponse.price, lastUpdated: getBeerPriceResponse.lastUpdated.toInt(), lastChangedBy: getBeerPriceResponse.lastChangedByName));
        case 429:
          return Response.rateLimit();
        default:
          debugPrint('Got status ' + response.statusCode.toString() + ' :' + response.body);
          return Response.fail();
      }
    } on SocketException catch(e) {
      debugPrint('SocketException ' + e.toString());
      return Response.fail();
    }
  }

  Future<Response<void>> consumeBeers(int amountConsumed) async {
    debugPrint('Consuming beers');
    try {
      proto.DrinkRequest drinkRequest = proto.DrinkRequest(
          beersDrunk: amountConsumed);
      http.Response response = await _CLIENT.post(
          Uri.parse("$SERVER/api/v1/beer/drink"),
          headers: getHeaders(sessionId),
          body: drinkRequest.writeToBuffer()
      );

      switch (response.statusCode) {
        case 200:
          return Response.ok(null);
        case 429:
          return Response.rateLimit();
        default:
          debugPrint('Got status ' + response.statusCode.toString() + ' :' + response.body);
          return Response.fail();
      }
    } on SocketException catch(e) {
      debugPrint('SocketException ' + e.toString());
      return Response.fail();
    }
  }

  Future<Response<List<Payment>>> getPayments() async {
    debugPrint('Fetching payments');
    try {
      http.Response response = await _CLIENT.get(
          Uri.parse("$SERVER/api/v1/payment/broke"),
          headers: getHeaders(sessionId)
      );

      switch (response.statusCode) {
        case 200:
          proto.BrokeResponse brokeResponse = proto.BrokeResponse.fromBuffer(
              response.bodyBytes);
          return Response.ok(brokeResponse.payments.map((e) =>
              Payment(amountPaid: e.amountPaid, paidAt: e.paidAt.toInt()))
              .toList());
        case 429:
          return Response.rateLimit();
        default:
          debugPrint('Got status ' + response.statusCode.toString() + ' :' + response.body);
          return Response.fail();
      }
    } on SocketException catch(e) {
      debugPrint('SocketException ' + e.toString());
      return Response.fail();
    }
  }

  Future<Response<PaymentBalance>> getPaymentBalance() async {
    debugPrint('Fetching payment balance');
    try {
      http.Response response = await _CLIENT.get(
          Uri.parse("$SERVER/api/v1/payment/balance"),
          headers: getHeaders(sessionId)
      );

      switch (response.statusCode) {
        case 200:
          proto.BalanceResponse balanceResponse = proto.BalanceResponse
              .fromBuffer(response.bodyBytes);
          return Response.ok(PaymentBalance(amountPaid: balanceResponse.amountPaid,
              beersDrunk: balanceResponse.beersDrunk.toInt(),
              balance: balanceResponse.balance,
              beersLeft: balanceResponse.beersLeft.toInt(),
          ));
        case 429:
          return Response.rateLimit();
        default:
          debugPrint('Got status ' + response.statusCode.toString() + ' :' + response.body);
          return Response.fail();
      }
    } on SocketException catch(e) {
      debugPrint('SocketException ' + e.toString());
      return Response.fail();
    }
  }

  Future<Response<void>> makePayment(double amountPaid) async {
    debugPrint('Making payment');
    try {
      proto.PayRequest payRequest = proto.PayRequest(amount: amountPaid);
      http.Response response = await _CLIENT.post(
          Uri.parse("$SERVER/api/v1/payment/pay"),
          headers: getHeaders(sessionId),
          body: payRequest.writeToBuffer()
      );

      switch (response.statusCode) {
        case 200:
          return Response.ok(null);
        case 429:
          return Response.rateLimit();
        default:
          debugPrint('Got status ' + response.statusCode.toString() + ' :' + response.body);
          return Response.fail();
      }
    } on SocketException catch(e) {
      debugPrint('SocketException ' + e.toString());
      return Response.fail();
    }
  }
}

class OwningUser {

  final String name;
  final String id;
  final bool isAdmin;
  final double balance;

  static http.Client _CLIENT = http.Client();

  const OwningUser._({required this.name, required this.id, required this.isAdmin, required this.balance});

  static Future<Response<List<OwningUser>>> getUsers(User admin) async {
    debugPrint('Fetching owning users');

    try {
      http.Response response = await _CLIENT.get(Uri.parse("$SERVER/api/v1/system/users"),
        headers: getHeaders(admin.sessionId)
      );

      switch(response.statusCode) {
        case 200:
          proto.OwesResponse owesResponse = proto.OwesResponse.fromBuffer(response.bodyBytes);
          List<OwningUser> owningUsers = owesResponse.owningUsers.map((e) => OwningUser._(id: e.employeeId, name: e.name, isAdmin: e.isAdmin, balance: e.amountOwed)).toList();
          return Response.ok(owningUsers);
        case 429:
          return Response.rateLimit();
        default:
          debugPrint('Got status ' + response.statusCode.toString() + ' :' + response.body);
          return Response.fail();
      }
    } on SocketException catch(e) {
      debugPrint('SocketException ' + e.toString());
      return Response.fail();
    }
   }

}