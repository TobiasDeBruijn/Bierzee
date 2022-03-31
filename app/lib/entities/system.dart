
import 'dart:io';

import 'package:bierzee/entities/payment.dart';
import 'package:bierzee/entities/user.dart';
import 'package:bierzee/main.dart';
import 'package:bierzee/util/http.dart';
import 'package:http/http.dart' as http;
import 'package:bierzee/proto/items.pb.dart' as proto;
import 'package:flutter/material.dart';

class System {
 
  final User user;
  
  const System({required this.user});
  
  static final http.Client _CLIENT = http.Client();
  
  Future<Response<void>> setBeerPrice(double price) async {
    try {
      proto.SetBeerPriceRequest setBeerPriceRequest = proto.SetBeerPriceRequest(
          price: price);
      http.Response response = await _CLIENT.post(
          Uri.parse("$SERVER/api/v1/system/beer-price"),
          headers: getHeaders(user.sessionId),
          body: setBeerPriceRequest.writeToBuffer()
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

  Future<Response<void>> addUser({required String employeeId, required String name, required bool isAdmin}) async {
    try {
      proto.AddUserRequest addUserRequest = proto.AddUserRequest(name: name, employeeId: employeeId, isAdmin: isAdmin);
      http.Response response = await _CLIENT.post(Uri.parse("$SERVER/api/v1/system/add-user"),
        headers: getHeaders(user.sessionId),
        body: addUserRequest.writeToBuffer()
      );

      switch(response.statusCode) {
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
  
  Future<Response<List<PaymentEntity>>> listPayments() async {
    const int maxSize = 10;
    
    try {
      http.Response response = await _CLIENT.get(Uri.parse("$SERVER/api/v1/system/payments?max=$maxSize"),
        headers: getHeaders(user.sessionId)
      );

      switch(response.statusCode) {
        case 200:
          proto.ListPaymentResponse listPaymentResponse = proto.ListPaymentResponse.fromBuffer(response.bodyBytes);
          List<PaymentEntity> paymentEntities = listPaymentResponse.payments.map((e) {
            NamedUserEntity? deniedBy;
            if(e.denied) {
              deniedBy = NamedUserEntity(employeeId: e.deniedBy.employeeId, name: e.deniedBy.name);
            }

            return PaymentEntity(amountPaid: e.amountPaid, paidAt: e.paidAt.toInt(), denied: e.denied, paidBy: NamedUserEntity(name: e.paidBy.name, employeeId: e.paidBy.employeeId), deniedBy: deniedBy, paymentId: e.paymentId);
          }).toList();

          return Response.ok(paymentEntities);
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

  Future<Response<void>> denyPayment(String id, bool denied) async {
    try {
      proto.DenyPaymentRequest denyPaymentRequest = proto.DenyPaymentRequest(denied: denied, paymentId: id);
      http.Response response = await _CLIENT.post(Uri.parse("$SERVER/api/v1/system/deny-payment"),
        headers: getHeaders(user.sessionId),
        body: denyPaymentRequest.writeToBuffer()
      );

      switch(response.statusCode) {
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