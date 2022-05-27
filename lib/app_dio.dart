import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodsample/config.dart';

import 'api_token_service.dart';

final dioProvider = Provider((ref) => AppDio.getInstance(ref.read));

// ignore: prefer_mixin
class AppDio with DioMixin implements Dio {
  static const String authHeader = "api-key";

  final Reader _reader;
  String? idToken;

  AppDio._(this._reader, [BaseOptions? options]) {
    options = BaseOptions(
      baseUrl: apiServerBaseUrl,
      contentType: 'application/json',
      connectTimeout: 30000,
      sendTimeout: 30000,
      receiveTimeout: 30000,
    );

    this.options = options;
    interceptors.add(QueuedInterceptorsWrapper(
      onRequest: (options, handler) async {
        print("interceptors:onRequest:: token($idToken)");
        // fetch idToken if Null
        idToken ??= await fetchIdToken();
        options.headers[authHeader] = idToken;
        handler.next(options);
      },
    ));
    interceptors.add(
      InterceptorsWrapper(
        onError: (DioError e, handler) async {
          print("interceptors:DioError:: token($e)");
          if (e.response?.statusCode == 401) {
            print("statusCode: 401");
            // トークンを更新してリトライ
            idToken = await fetchIdToken();
            final options = e.response!.requestOptions;
            options.headers[authHeader] = idToken;
            await retry(options);
            return;
          }
          print("next");
          handler.next(e);
        },
      ),
    );

    if (kDebugMode) {
      // Local Log
      // interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    }

    httpClientAdapter = DefaultHttpClientAdapter();
  }

  /// トークンを取得する
  Future<String> fetchIdToken() async {
    print("fetchIdToken()");
    final res = await _reader(apiTokenServiceProvider).getToken();
    return res.idToken;
  }

  /// リクエストをリトライする
  Future<Response<dynamic>> retry(RequestOptions requestOptions) async {
    print("retry()");
    final Options options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  static Dio getInstance(Reader reader) => AppDio._(reader);
}
