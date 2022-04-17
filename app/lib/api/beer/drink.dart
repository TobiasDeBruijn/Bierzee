import 'dart:io';

import 'package:bierzee/api/common.dart';
import 'package:bierzee/proto/payloads/beer.pb.dart';
import 'package:http/http.dart' as http;

class BeerDrink {
  static Future<Response<void>> drink(PostDrinkRequest request, String sessionId) async {
    try {
      http.Response response = await http.post(Uri.parse("$SERVER/api/v1/beer/drink"),
        headers: getHeaders(sessionId),
        body: request.writeToBuffer()
      );

      switch(response.statusCode) {
        case 200:
          return Response.ok(null);
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