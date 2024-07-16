import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasky_app/core/extensions/widget_ref_extension.dart';
import 'package:tasky_app/core/utils/result.dart';
import 'package:tasky_app/features/user/domain/entities/user.dart';
import 'package:tasky_app/features/user/domain/usecases/create_user_usecase.dart';
import 'package:tasky_app/features/user/domain/usecases/delete_user_usecase.dart';
import 'package:tasky_app/features/user/domain/usecases/fetch_user_by_id_usecase.dart';
import 'package:tasky_app/features/user/domain/usecases/update_user_usecase.dart';
import 'package:tasky_app/features/user/domain/value_objects/user_id.dart';

class UserPage extends ConsumerWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user1 = ref.watch(fetchUserByIdUsecaseProvider(UserId('48')));

    ref.handleAsyncValue(
      createUserUsecaseProvider,
      complete: (context, data) {
        if (data is Success) {
          debugPrint('成功しました');
          debugPrint((data! as Success).message);
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Page'),
      ),
      body: Center(
        child: Column(
          children: [
            user1.when(
              data: (data) {
                final user = data.value;

                if (user == null) {
                  return const SizedBox.shrink();
                }

                return Column(
                  children: [
                    Text(user.name ?? ''),
                  ],
                );
              },
              error: (Object error, StackTrace stackTrace) {
                return Text((error as Failure).title ?? '');
              },
              loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            ElevatedButton(
              child: const Text('Create User'),
              onPressed: () async {
                const user = User(
                  name: '金沢大樹',
                  email: 'test2@gmail.com',
                  password: 'password123',
                );

                await ref.read(createUserUsecaseProvider.notifier).call(user);
              },
            ),
            ElevatedButton(
              child: const Text('Update User'),
              onPressed: () async {
                const user = User(
                  name: '柴田雄介',
                  email: 'taisei.devel@gmail.com',
                  password: 'password123',
                );

                await ref
                    .read(updateUserUsecaseProvider.notifier)
                    .call(UserId('1'), user);
              },
            ),
            ElevatedButton(
              child: const Text('Delete User'),
              onPressed: () async {
                await ref
                    .read(deleteUserUsecaseProvider.notifier)
                    .call(UserId('47'));
              },
            ),
          ],
        ),
      ),
    );
  }
}
