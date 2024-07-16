import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasky_app/core/providers/loading.dart';
import 'package:tasky_app/core/providers/navigator_key.dart';
import 'package:tasky_app/core/providers/scaffold_messenger_key.dart';
import 'package:tasky_app/core/utils/result.dart';

extension WidgetRefEx on WidgetRef {
  void handleAsyncValue<T>(
    ProviderListenable<AsyncValue<T>> asyncValueProvider, {
    void Function(BuildContext context, T data)? complete,
    String? completeMessage,
  }) =>
      listen<AsyncValue<T>>(
        asyncValueProvider,
        (_, next) async {
          final loadingNotifier = read(loadingProvider.notifier);

          if (next.isLoading) {
            loadingNotifier.show();
            return;
          }

          next.when(
            data: (data) async {
              loadingNotifier.hide();

              if (completeMessage != null) {
                final messengerState =
                    read(scaffoldMessengerKeyProvider).currentState;
                messengerState?.showSnackBar(
                  SnackBar(
                    content: Text(completeMessage),
                  ),
                );
              }
              complete?.call(read(navigatorKeyProvider).currentContext!, data);
            },
            error: (e, s) async {
              loadingNotifier.hide();

              await showDialog<void>(
                context: read(navigatorKeyProvider).currentContext!,
                builder: (context) => AlertDialog(
                  title: Text((e as Failure).title ?? ''),
                  content: Text(e.message ?? ''),
                ),
              );
            },
            loading: loadingNotifier.show,
          );
        },
      );
}
