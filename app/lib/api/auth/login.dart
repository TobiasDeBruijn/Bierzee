
import 'dart:io';

import 'package:bierzee/api/common.dart';
import 'package:bierzee/proto/payloads/auth.pb.dart';
import 'package:http/http.dart' as http;

class AuthLogin {
  static Future<Response<PostLoginResponse>> login(PostLoginRequest request) async {
    try {
      http.Response response = await http.post(Uri.parse("$SERVER/api/v1/auth/login"),
        headers: getProtobufHeaders(),
        body: request.writeToBuffer()
      );

      switch(response.statusCode) {
        case 200:
          PostLoginResponse loginResponse = PostLoginResponse.fromBuffer(response.bodyBytes);
          return Response.ok(loginResponse);
        case 401:
          return Response.unauthorized();
        case 429:
          return Response.rateLimit();
        default:
          return Response.fail();
      }
    } on SocketException catch(e) {
      return Response.fail();
    }
  } 
}

/*

    try {
      http.Response response = await http.get(Uri.parse("$SERVER"),
        headers: getProtobufHeaders(),
      );

      switch(response.statusCode) {
        case 200:

        case 401:
          return Response.unauthorized();
        case 429:
          return Response.rateLimit();
        default:
          return Response.fail();
      }
    } on SocketException catch(e) {
      return Response.fail();
    }


 */