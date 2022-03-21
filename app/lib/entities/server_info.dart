import 'dart:io';
import 'package:bierzee/main.dart';
import 'package:bierzee/util/http.dart';
import 'package:http/http.dart' as http;
import 'package:bierzee/proto/items.pb.dart' as proto;
import 'package:flutter/cupertino.dart';

class ServerInfoEntity {
  final String version;
  final String repository;

  const ServerInfoEntity({required this.version, required this.repository});

  static final http.Client _CLIENT = http.Client();

  static Future<Response<ServerInfoEntity>> get() async {
    try {
      http.Response response = await _CLIENT.get(Uri.parse("$SERVER/api/v1/about"),
        headers: getProtobufHeaders()
      );
      switch(response.statusCode) {
        case 200:
          proto.GetAboutResponse getAboutResponse = proto.GetAboutResponse.fromBuffer(response.bodyBytes);
          return Response.ok(ServerInfoEntity(version: getAboutResponse.version, repository: getAboutResponse.repository));
        case 429:
          return Response.rateLimit();
        default:
          debugPrint('Got status ' + response.statusCode.toString() + ' :' + response.body);
          return Response.fail();
      }
    } on SocketException catch(e) {
      debugPrint(e.toString());
      return Response.fail();
    }
  }
}