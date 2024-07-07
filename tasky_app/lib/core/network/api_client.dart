import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tasky_app/core/network/dio.dart';

import '../../features/user/data/models/user_model.dart';
import '../constants/api_endpoints.dart';

part 'api_client.g.dart';

@Riverpod(keepAlive: true)
ApiClient apiClient(ApiClientRef ref) => ApiClient(
      ref.watch(dioProvider),
    );

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST(Endpoints.createUser)
  Future<UserModel> createUser(@Body() UserModel user);
}
