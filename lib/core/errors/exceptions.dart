import 'dart:developer' as developer;

class AppException implements Exception {
  final String message;
  final Object? error;
  final StackTrace? stackTrace;

  AppException({
    required this.message,
    required this.error,
    required this.stackTrace,
  }) {
    developer.log(
      message,
      name: 'AppException',
      error: error?.toString(),
      stackTrace: stackTrace,
    );
  }
}

class HttpException implements Exception {
  final int? statusCode;
  final Object? error;
  final String? message;

  HttpException({
    required this.statusCode,
    required this.error,
    required this.message,
  }) {
    developer.log(
      message ?? '',
      name: 'HttpException',
      error: error?.toString(),
    );
  }
}
