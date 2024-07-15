import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tasky_app/core/constants/api_endpoints.dart';
import 'package:tasky_app/core/network/dio.dart';
import 'package:tasky_app/features/user/data/models/user_model.dart';

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

  @GET(Endpoints.fetchUserById)
  Future<UserModel> fetchUserById(@Path('id') String userId);

  @PUT(Endpoints.updateUser)
  Future<UserModel> updateUser(
    @Path('id') String userId,
    @Body() UserModel user,
  );

  @DELETE(Endpoints.deleteUser)
  Future<void> deleteUser(
    @Path('id') String userId,
  );
}
