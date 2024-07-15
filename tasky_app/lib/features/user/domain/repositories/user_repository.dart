import 'package:tasky_app/core/utils/result.dart';
import 'package:tasky_app/features/user/domain/entities/user.dart';
import 'package:tasky_app/features/user/domain/value_objects/user_id.dart';

abstract class UserRepository {
  Future<Result<User>> createUser(User user);
  Future<Result<User>> fetchUserById(UserId userId);
  Future<Result<User>> updateUser(UserId userId, User user);
}
