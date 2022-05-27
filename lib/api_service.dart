import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/retrofit.dart';

import 'app_dio.dart';
import 'user.dart';

part 'api_service.g.dart';

final apiServiceProvider = Provider((ref) => ApiService(ref.read));

@RestApi()
abstract class ApiService {
  factory ApiService(Reader reader) => _ApiService(reader(dioProvider));

  @GET('/users')
  Future<List<User>> getUsers();

  @POST('/user')
  Future<void> createUser(@Body() User user);
}
