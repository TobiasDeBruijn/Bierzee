import 'package:flutter/material.dart';

Map<String, String> getProtobufHeaders() {
  return {
    'Content-Type': 'application/protobuf',
    'Accept': 'application/protobuf'
  };
}

Map<String, String> getHeaders(String sessionId) {
  Map<String, String> headers = getProtobufHeaders();
  headers['Authorization'] = sessionId;

  return headers;
}

enum ResponseStatus {
  OK,
  RATE_LIMIT,
  FAIL,
}

class Response<T> {
  late final ResponseStatus responseStatus;
  late final T? value;

  Response.ok(this.value) {
    responseStatus = ResponseStatus.OK;
  }

  Response.fail() {
    responseStatus = ResponseStatus.FAIL;
    value = null;
  }

  Response.rateLimit() {
    responseStatus = ResponseStatus.RATE_LIMIT;
    value = null;
  }

  bool handleNotOk(BuildContext context) {
    switch(responseStatus) {
      case ResponseStatus.OK:
        return true;
      case ResponseStatus.RATE_LIMIT:
        showSnackbar(context, 'Je gaat te snel. Rustig aan.');
        return false;
      case ResponseStatus.FAIL:
        showSnackbar(context, 'Er is iets verkeerd gegaan. Probeer het later opnieuw');
        return false;
    }
  }

  void showSnackbar(BuildContext context, String text) {
    Future<Null>.delayed(Duration.zero, () {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
    });
  }
}