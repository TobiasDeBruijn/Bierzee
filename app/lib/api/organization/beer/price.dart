import 'dart:io';

import 'package:bierzee/api/common.dart';
import 'package:bierzee/proto/payloads/organization.pb.dart';
import 'package:http/http.dart' as http;

class OrgBeerPrice {
  static Future<Response<void>> price(PostSetBeerPriceRequest postSetBeerPriceRequest, String sessionId) async {
    try {
      http.Response response = await http.post(Uri.parse("$SERVER/api/v1/organization/beer/price"),
        headers: getHeaders(sessionId),
        body: postSetBeerPriceRequest.writeToBuffer(),
      );

      switch(response.statusCode) {
        case 200:
          return Response.ok(null);
        case 401:
          return Response.unauthorized();
        case 429:
          return Response.rateLimit();
        default:
          return Response.fail(response: response);
      }
    } on SocketException catch(e) {
      return Response.fail();
    }
  }
}