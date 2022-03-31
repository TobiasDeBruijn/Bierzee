import 'dart:io';

import 'package:bierzee/entities/user.dart';
import 'package:bierzee/main.dart';
import 'package:bierzee/util/http.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bierzee/proto/items.pb.dart' as proto;

class NotificationEntity {
  final String id;
  final String text;
  final int createdAt;

  const NotificationEntity._({required this.id, required this.text, required this.createdAt});

  static http.Client _CLIENT = http.Client();

  static Future<Response<List<NotificationEntity>>> list(User user) async {
    debugPrint("Fetching notifications");
    
    try {
      http.Response response = await _CLIENT.get(Uri.parse("$SERVER/api/v1/notification/list"),
        headers: getHeaders(user.sessionId)
      );

      switch(response.statusCode) {
        case 200:
          proto.ListNotificationResponse listNotificationResponse = proto.ListNotificationResponse.fromBuffer(response.bodyBytes);
          List<NotificationEntity> notifications = listNotificationResponse.notifications.map((e) => NotificationEntity._(id: e.id, text: e.text, createdAt: e.createdAt.toInt())).toList();
          return Response.ok(notifications);
        case 429:
          return Response.rateLimit();
        default:
          debugPrint('Failed to list notifications. Got status ' + response.statusCode.toString() + ': ' + response.body.toString());
          return Response.fail();
      }
    } on SocketException catch(e) {
      debugPrint('Socket exception: ' + e.toString());
      return Response.fail();
    }
  }

  Future<Response<void>> markComplete(User user) async {
    debugPrint("Marking notification " + id + " as complete");

    try {
      proto.CompleteNotificationRequest completeNotificationRequest = proto.CompleteNotificationRequest(completed: true, notificationId: id);
      http.Response response = await _CLIENT.post(Uri.parse("$SERVER/api/v1/notification/complete"),
        headers: getHeaders(user.sessionId),
        body: completeNotificationRequest.writeToBuffer()
      );

      switch(response.statusCode) {
        case 200:
          return Response.ok(null);
        case 429:
          return Response.rateLimit();
        default:
          debugPrint('Failed to list notifications. Got status ' + response.statusCode.toString() + ': ' + response.body.toString());
          return Response.fail();
      }
    } on SocketException catch(e) {
      debugPrint('Socket exception: ' + e.toString());
      return Response.fail();
    }
  }
}