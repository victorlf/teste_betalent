import 'dart:io';

class EndPoint {
  late final String baseUrl;
  EndPoint() {
    if (Platform.isAndroid) {
      baseUrl = 'http://10.0.2.2:8080';
    } else {
      baseUrl = 'http://localhost:8080';
    }
  }
}
