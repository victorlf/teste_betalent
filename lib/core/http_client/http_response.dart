// ignore_for_file: public_member_api_docs, sort_constructors_first
class HttpResponse {
  final int? statusCode;
  final dynamic data;
  final String? message;

  HttpResponse({
    required this.statusCode,
    required this.data,
    required this.message,
  });

  @override
  String toString() {
    return 'HttpResponse(statusCode: $statusCode, data: $data, message: $message)';
  }
}
