import '../../../../core/utils/result.dart';
import '../entities/user.dart';

abstract class UserRepository {
  Future<Result<User>> createUser(User user);
}
