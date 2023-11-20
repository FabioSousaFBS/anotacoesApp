import 'dart:async';
import 'dart:io';

import 'package:anotacoesapp/core/dio_client/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:retry/retry.dart';

class DioClientImplementacao implements DioClient{

  final _tentativas = const RetryOptions(maxAttempts: 5);

  final Dio _dio = Dio(BaseOptions(
      connectTimeout: const Duration(milliseconds: 50000),
      receiveTimeout: const Duration(milliseconds: 30000),      
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
      followRedirects: true,
      receiveDataWhenStatusError: true,
      validateStatus: (status) {
        return status! <= 500;
      }));


  @override
  Future<HttpResponse> get(String url) async {
    dynamic response = await _tentativas.retry(
      () => _dio
          .get(url)
          .timeout(Duration(seconds: 5)),
      retryIf: (e) => e is SocketException || e is TimeoutException,
    );

    return HttpResponse(data: response.data, statusCode: response.statusCode);
  }

  @override
  Future<HttpResponse> post(String url, {required Map<String, dynamic> body}) async {
     dynamic response = await _tentativas.retry(
      () => _dio
          .get(url, queryParameters: body)
          .timeout(Duration(seconds: 5)),
      retryIf: (e) => e is SocketException || e is TimeoutException,
    );

    return HttpResponse(data: response.data, statusCode: response.statusCode);
  }




}