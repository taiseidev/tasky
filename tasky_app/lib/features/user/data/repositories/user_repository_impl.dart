import 'package:tasky_app/core/network/api_client.dart';
import 'package:tasky_app/core/utils/result.dart';
import 'package:tasky_app/features/user/data/models/user_model.dart';
import 'package:tasky_app/features/user/domain/entities/user.dart';
import 'package:tasky_app/features/user/domain/repositories/user_repository.dart';
import 'package:tasky_app/features/user/domain/value_objects/user_id.dart';

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl({required this.apiClient});
  final ApiClient apiClient;

  @override
  Future<Result<User>> createUser(User user) async {
    final userModel = UserModel(
      id: user.id,
      name: user.name,
      email: user.email,
      password: user.password,
    );

    return ApiResultHandler.guard<User>(() async {
      await apiClient.createUser(userModel);
      return user;
    });
  }

  @override
  Future<Result<User>> fetchUserById(UserId userId) async {
    return ApiResultHandler.guard<User>(() async {
      final userModel = await apiClient.fetchUserById(userId.value);
      return User(
        id: userModel.id,
        name: userModel.name,
        email: userModel.email,
        password: userModel.password,
      );
    });
  }

  @override
  Future<Result<User>> updateUser(UserId userId, User user) {
    final userModel = UserModel(
      id: user.id,
      name: user.name,
      email: user.email,
      password: user.password,
    );

    return ApiResultHandler.guard<User>(() async {
      await apiClient.updateUser(userId.value, userModel);
      return user;
    });
  }
}
