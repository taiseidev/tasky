import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:tasky_app/core/providers/loading.dart';
import 'package:tasky_app/core/providers/navigator_key.dart';
import 'package:tasky_app/core/providers/scaffold_messenger_key.dart';
import 'package:tasky_app/ui/pages/user_page.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Tasky',
      scaffoldMessengerKey: ref.watch(scaffoldMessengerKeyProvider),
      navigatorKey: ref.watch(navigatorKeyProvider),
      home: const UserPage(),
      builder: (context, child) => Consumer(
        builder: (context, ref, _) {
          final isLoading = ref.watch(loadingProvider);
          return Stack(
            children: [
              child!,
              if (isLoading)
                const ColoredBox(
                  color: Colors.black26,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
