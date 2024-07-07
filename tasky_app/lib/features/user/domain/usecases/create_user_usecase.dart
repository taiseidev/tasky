import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tasky_app/core/utils/result.dart';
import 'package:tasky_app/features/user/data/repositories/user_repository_provider.dart';
import '../entities/user.dart';

part 'create_user_usecase.g.dart';

@riverpod
class CreateUserUsecase extends _$CreateUserUsecase {
  @override
  Future<Result<User>>? build() => null;

  Future<void> call(User user) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final response = await ref.read(userRepositoryProvider).createUser(user);
      return response;
    });
  }
}
