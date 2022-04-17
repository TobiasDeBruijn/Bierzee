import 'dart:io';

import 'package:bierzee/api/common.dart';
import 'package:bierzee/proto/payloads/organization.pb.dart';
import 'package:http/http.dart' as http;

class OrgGet {
  static Future<Response<GetOrganizationResponse>> get(String id) async {
    try {
      http.Response response = await http.get(Uri.parse("$SERVER/api/v1/organization/get/$id"),
        headers: getProtobufHeaders(),
      );

      switch(response.statusCode) {
        case 200:
          return Response.ok(GetOrganizationResponse.fromBuffer(response.bodyBytes));
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