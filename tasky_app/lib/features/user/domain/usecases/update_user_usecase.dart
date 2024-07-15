import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tasky_app/core/utils/result.dart';
import 'package:tasky_app/features/user/data/repositories/user_repository_provider.dart';
import 'package:tasky_app/features/user/domain/entities/user.dart';
import 'package:tasky_app/features/user/domain/value_objects/user_id.dart';

part 'update_user_usecase.g.dart';

@riverpod
class UpdateUserUsecase extends _$UpdateUserUsecase {
  @override
  Future<Result<User>?>? build() async => null;

  Future<void> call(UserId userId, User user) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final response =
          await ref.read(userRepositoryProvider).updateUser(userId, user);
      return response;
    });
  }
}
