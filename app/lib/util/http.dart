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