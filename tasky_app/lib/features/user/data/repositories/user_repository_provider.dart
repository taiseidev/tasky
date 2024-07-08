import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tasky_app/core/network/api_client.dart';
import 'package:tasky_app/features/user/data/repositories/user_repository_impl.dart';

import 'package:tasky_app/features/user/domain/repositories/user_repository.dart';

part 'user_repository_provider.g.dart';

@Riverpod(keepAlive: true)
UserRepository userRepository(UserRepositoryRef ref) => UserRepositoryImpl(
      apiClient: ref.watch(apiClientProvider),
    );
