import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//const String SERVER = "http://10.10.2.1:8080";
const String SERVER = "https://bierzee-v2.k8s.array21.dev";

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
  UNAUTHORIZED,
}

class Response<T> {
  late final ResponseStatus responseStatus;
  late final T? value;

  Response.ok(this.value) {
    responseStatus = ResponseStatus.OK;
  }

  Response.fail({http.Response? response}) {
    responseStatus = ResponseStatus.FAIL;
    value = null;

    if(response != null) {
      debugPrint("Got status: " + response.statusCode.toString());
    }
  }

  Response.rateLimit() {
    responseStatus = ResponseStatus.RATE_LIMIT;
    value = null;
  }

  Response.unauthorized() {
    responseStatus = ResponseStatus.UNAUTHORIZED;
    value = null;
  }

  bool handleNotOk(BuildContext context) {
    switch(responseStatus) {
      case ResponseStatus.OK:
        return true;
      case ResponseStatus.UNAUTHORIZED:
        showSnackbar(context, 'Incorrecte login gegevens');
        return false;
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