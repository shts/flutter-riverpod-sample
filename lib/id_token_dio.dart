import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodsample/config.dart';

final idTokenDioProvider = Provider((_) => IdTokenDio.getInstance());

// ignore: prefer_mixin
class IdTokenDio with DioMixin implements Dio {
  IdTokenDio._([BaseOptions? options]) {
    options = BaseOptions(
      baseUrl: tokenServerBaseUrl,
      contentType: 'application/json',
      connectTimeout: 30000,
      sendTimeout: 30000,
      receiveTimeout: 30000,
    );

    this.options = options;

    if (kDebugMode) {
      // Local Log
      // interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    }

    httpClientAdapter = DefaultHttpClientAdapter();
  }

  static Dio getInstance() => IdTokenDio._();
}
