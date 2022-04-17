import 'dart:io';

import 'package:bierzee/api/common.dart';
import 'package:bierzee/proto/entities/payment.pb.dart';
import 'package:http/http.dart' as http;

class PaymentGet {
  static Future<Response<Payment>> get(String id, String sessionId) async {
    try {
      http.Response response = await http.get(Uri.parse("$SERVER/api/v1/payment/$id"),
        headers: getHeaders(sessionId),
      );

      switch(response.statusCode) {
        case 200:
          return Response.ok(Payment.fromBuffer(response.bodyBytes));
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