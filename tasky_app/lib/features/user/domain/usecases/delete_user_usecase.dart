import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tasky_app/core/utils/result.dart';
import 'package:tasky_app/features/user/data/repositories/user_repository_provider.dart';
import 'package:tasky_app/features/user/domain/value_objects/user_id.dart';

part 'delete_user_usecase.g.dart';

@riverpod
class DeleteUserUsecase extends _$DeleteUserUsecase {
  @override
  Future<Result<void>?>? build() async => null;

  Future<void> call(UserId userId) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final response =
          await ref.read(userRepositoryProvider).deleteUser(userId);
      return response;
    });
  }
}
