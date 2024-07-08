import '../../../../core/utils/result.dart';
import '../entities/user.dart';
import 'package:tasky_app/features/user/domain/value_objects/user_id.dart';

abstract class UserRepository {
  Future<Result<User>> createUser(User user);
  Future<Result<User>> fetchUserById(UserId userId);
}
