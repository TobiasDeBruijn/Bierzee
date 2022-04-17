import 'dart:io';

import 'package:bierzee/api/common.dart';
import 'package:bierzee/proto/payloads/organization.pb.dart';
import 'package:http/http.dart' as http;

class OrgUserAdmin {
  static Future<Response<void>> admin(PostAdminRequest postAdminRequest, String sessionId) async {
    try {
      http.Response response = await http.post(Uri.parse("$SERVER/api/v1/organization/user/admin"),
        headers: getHeaders(sessionId),
        body: postAdminRequest.writeToBuffer(),
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