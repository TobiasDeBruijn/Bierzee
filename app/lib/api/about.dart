import 'dart:io';

import 'package:bierzee/api/common.dart';
import 'package:bierzee/proto/payloads/about.pb.dart';
import 'package:http/http.dart' as http;

class About {
  static Future<Response<GetAboutResponse>> about() async {
    try {
      http.Response response = await http.get(Uri.parse("$SERVER/api/v1/about"),
        headers: getProtobufHeaders(),
      );

      switch(response.statusCode) {
        case 200:
          return Response.ok(GetAboutResponse.fromBuffer(response.bodyBytes));
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