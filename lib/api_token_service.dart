import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpodsample/id_token.dart';

import 'id_token_dio.dart';

part 'api_token_service.g.dart';

final apiTokenServiceProvider = Provider((ref) => ApiTokenService(ref.read));

@RestApi()
abstract class ApiTokenService {
  factory ApiTokenService(Reader reader) =>
      _ApiTokenService(reader(idTokenDioProvider));

  @GET('/')
  Future<IdToken> getToken();
}
