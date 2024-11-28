import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:teste_betalent/core/errors/exceptions.dart';

import 'endpoint.dart';
import 'http_response.dart';

class HttpClient {
  final _dio = Dio(
    BaseOptions(
      baseUrl: EndPoint().baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );

  Future<HttpResponse> get(String url, {dynamic body}) async {
    final response = await _catchDioError(_dio.get(url, data: body));

    return _generateResponse(response);
  }

  HttpResponse _generateResponse(Response response) {
    if (response.statusCode! >= 200 && response.statusCode! <= 204) {
      return HttpResponse(
        data: response.data,
        statusCode: response.statusCode,
        message: response.statusMessage,
      );
    } else {
      throw HttpException(
        statusCode: response.statusCode,
        message: response.statusMessage,
        error: response.data,
      );
    }
  }

  Future<Response> _catchDioError(Future<Response> request) async {
    try {
      return await request;
    } on DioException catch (e) {
      developer.log('${e.response}');
      throw HttpException(
        statusCode: e.response?.statusCode,
        message: 'Erro na requisição',
        error: e,
      );
    }
  }
}
