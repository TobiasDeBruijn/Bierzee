import 'dart:io';

import 'package:bierzee/api/common.dart';
import 'package:bierzee/proto/payloads/notifications.pb.dart';
import 'package:http/http.dart' as http;

class NotificationList {
  static Future<Response<GetListNotificationResponse>> list(String sessionId) async {
    try {
      http.Response response = await http.get(Uri.parse("$SERVER/api/v1/notification/list"),
        headers: getHeaders(sessionId),
      );

      switch(response.statusCode) {
        case 200:
          return Response.ok(GetListNotificationResponse.fromBuffer(response.bodyBytes));
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