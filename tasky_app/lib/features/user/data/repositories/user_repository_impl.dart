import '../../../../core/network/api_client.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../models/user_model.dart';

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
}
