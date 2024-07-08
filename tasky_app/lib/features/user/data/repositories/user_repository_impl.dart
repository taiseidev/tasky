import '../../../../core/network/api_client.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../models/user_model.dart';
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

    return await ApiResultHandler.guard<User>(() async {
      await apiClient.createUser(userModel);
      return user;
    });
  }

  @override
  Future<Result<User>> fetchUserById(UserId userId) async {
    return await ApiResultHandler.guard<User>(() async {
      final userModel = await apiClient.fetchUserById(userId.value);
      return User(
        id: userModel.id,
        name: userModel.name,
        email: userModel.email,
        password: userModel.password,
      );
    });
  }
}
