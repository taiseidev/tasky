import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasky_app/core/extensions/widget_ref_extension.dart';
import 'package:tasky_app/core/utils/result.dart';

import '../../features/user/domain/entities/user.dart';
import '../../features/user/domain/usecases/create_user_usecase.dart';

class UserPage extends ConsumerWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.handleAsyncValue(
      createUserUsecaseProvider,
      completeMessage: 'ユーザの保存が完了しました。',
      complete: (context, data) {
        if (data is Success) {
          debugPrint('成功しました');
          debugPrint((data as Success).message);
        }

        if (data is Failure) {
          debugPrint('失敗しました');
          debugPrint((data as Failure).message);
        }
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Page'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Create User'),
          onPressed: () async {
            const user = User(
              id: 8,
              name: "山本浩也",
              email: "taisei.developer5@gmail.com",
              password: "password123",
            );

            await ref.read(createUserUsecaseProvider.notifier).call(user);
          },
        ),
      ),
    );
  }
}
