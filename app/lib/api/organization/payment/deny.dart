import 'dart:io';

import 'package:bierzee/api/common.dart';
import 'package:bierzee/proto/payloads/organization.pb.dart';
import 'package:http/http.dart' as http;

class OrgPaymentDeny {
  static Future<Response<void>> deny(PostDenyPaymentRequest postDenyPaymentRequest, String sessionId) async {
    try {
      http.Response response = await http.post(Uri.parse("$SERVER/api/v1/organization/payment/deny"),
        headers: getHeaders(sessionId),
        body: postDenyPaymentRequest.writeToBuffer()
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