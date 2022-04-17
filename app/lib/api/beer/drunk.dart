import 'dart:io';

import 'package:bierzee/api/common.dart';
import 'package:bierzee/proto/payloads/beer.pb.dart';
import 'package:http/http.dart' as http;

class BeerDrunk {
  static Future<Response<GetDrunkResponse>> drunk(String sessionId) async {
    try {
      http.Response response = await http.get(Uri.parse("$SERVER/api/v1/beer/drunk"),
        headers: getHeaders(sessionId),
      );

      switch(response.statusCode) {
        case 200:
          return Response.ok(GetDrunkResponse.fromBuffer(response.bodyBytes));
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