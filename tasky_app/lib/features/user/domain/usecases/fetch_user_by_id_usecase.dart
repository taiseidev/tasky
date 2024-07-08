import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tasky_app/core/utils/result.dart';
import 'package:tasky_app/features/user/data/repositories/user_repository_provider.dart';
import 'package:tasky_app/features/user/domain/value_objects/user_id.dart';

import '../entities/user.dart';

part 'fetch_user_by_id_usecase.g.dart';

@riverpod
Future<Result<User>> fetchUserByIdUsecase(
  FetchUserByIdUsecaseRef ref,
  UserId userId,
) async {
  final response = await ref.read(userRepositoryProvider).fetchUserById(userId);
  return response;
}
