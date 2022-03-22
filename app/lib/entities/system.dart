
import 'dart:io';

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
}